using APITG.Domain.Models;
using System.Threading.Tasks;

namespace APITG.Domain.Repositories
{
    public interface IUsuarioRepository
    {
        Usuario Get(string nome, string senha);
    }
}
