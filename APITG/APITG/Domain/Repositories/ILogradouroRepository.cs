using APITG.Domain.Models;
using System.Collections.Generic;

namespace APITG.Domain.Repositories
{
  public interface ILogradouroRepository
  {

    void Add(Logradouro logradouro);

    IEnumerable<Logradouro> GetAll();

    IEnumerable<Logradouro> GetAll(int clienteId);

    Logradouro Find(int id);

    void Update(Logradouro logradouro);

    void Remove(int id);
  }
}
