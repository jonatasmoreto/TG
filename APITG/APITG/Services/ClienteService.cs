using APITG.Domain.Models;
using APITG.Domain.Repositories;
using APITG.Domain.Services;
using System.Collections.Generic;

namespace APITG.Services
{
    public class ClienteService : IClienteService
    {
        private readonly IClienteRepository _clienteRepository;
        private readonly ILogradouroRepository _logradouroRepository;

        public ClienteService(IClienteRepository clienteRepository, ILogradouroRepository logradouroRepository)
        {
            _clienteRepository = clienteRepository;
            _logradouroRepository = logradouroRepository;
        }

        public void Add(Cliente cliente)
        {
            _clienteRepository.Add(cliente);
        }

        public Cliente EmailExiste(string Email)
        {
            return _clienteRepository.EmailExiste(Email);
        }

        public Cliente Find(int id)
        {
            var cliente = _clienteRepository.Find(id);

            if (cliente != null)
                cliente.Enderecos = _logradouroRepository.GetAll(cliente.Id);

            return cliente;
        }

        public IEnumerable<Cliente> GetAll()
        {
            var clientes = _clienteRepository.GetAll();

            foreach (var cliente in clientes)
            {
                cliente.Enderecos = _logradouroRepository.GetAll(cliente.Id);
            }

            return clientes;

        }

        public void Remove(int id)
        {
            _clienteRepository.Remove(id);
        }

        public void Update(Cliente cliente)
        {
            _clienteRepository.Update(cliente);
        }
    }
}
