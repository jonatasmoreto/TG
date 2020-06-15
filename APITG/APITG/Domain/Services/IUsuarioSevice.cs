using APITG.Domain.Models;
using System.Threading.Tasks;

namespace APITG.Domain.Services
{
  public interface IUsuarioSevice
  {
    Usuario Get(string nome, string senha);
  }
}
