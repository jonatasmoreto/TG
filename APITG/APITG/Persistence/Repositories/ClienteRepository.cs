using System.Collections.Generic;
using System.Linq;
using APITG.Domain.Models;
using APITG.Persistence.Contexts;
using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;
using System.Data;
using APITG.Domain.Repositories;

namespace APITG.Persistence.Repositories
{
    public class ClienteRepository : BaseRepository, IClienteRepository
    {
        public ClienteRepository(ContextDB contexto) : base(contexto)
        {
        }

        public void Add(Cliente cliente)
        {
            var resultParameter = new SqlParameter
            {
                ParameterName = "@retorno",
                SqlDbType = SqlDbType.Int,
                Direction = ParameterDirection.Output
            };

            _contexto.Database.ExecuteSqlRaw("sp_Cliente_Incluir {0},{1},{2},{3} out", cliente.Nome, cliente.Email, cliente.Logotipo, resultParameter);
            cliente.Id = (int)resultParameter.Value;
        }

        public Cliente EmailExiste(string Email)
        {
            return _contexto.Cliente.FromSqlRaw<Cliente>("sp_Cliente_Consultar_Email {0}", Email).ToList().FirstOrDefault();
        }

        public Cliente Find(int id)
        {
            return _contexto.Cliente.FromSqlRaw<Cliente>("sp_Cliente_Consultar {0}", id).ToList().FirstOrDefault();
        }

        public IEnumerable<Cliente> GetAll()
        {
            return _contexto.Cliente.FromSqlRaw<Cliente>("sp_Cliente_Consultar").ToList();
        }

        public void Remove(int id)
        {
            _contexto.Database.ExecuteSqlRaw("sp_Cliente_Excluir {0}", id);
        }

        public void Update(Cliente cliente)
        {
            _contexto.Database.ExecuteSqlRaw("sp_Cliente_Alterar {0},{1},{2},{3}", cliente.Id, cliente.Nome, cliente.Email, cliente.Logotipo);
        }
    }
}
