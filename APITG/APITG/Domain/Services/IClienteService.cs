using APITG.Domain.Models;
using System.Collections.Generic;

namespace APITG.Domain.Services
{
  public interface IClienteService
  {
    void Add(Cliente cliente);

    IEnumerable<Cliente> GetAll();

    Cliente Find(int id);

    void Update(Cliente cliente);

    void Remove(int id);

    Cliente EmailExiste(string Email);
  }
}
