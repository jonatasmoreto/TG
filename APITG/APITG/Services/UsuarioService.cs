using APITG.Domain.Models;
using APITG.Domain.Repositories;
using APITG.Domain.Services;
using System.Threading.Tasks;

namespace APITG.Services
{
  public class UsuarioService : IUsuarioSevice
  {
    private readonly IUsuarioRepository _usuarioRepository;

    public UsuarioService(IUsuarioRepository usuarioRepository)
    {
      _usuarioRepository = usuarioRepository;
    }

    public Usuario Get(string nome, string senha)
    {
      return _usuarioRepository.Get(nome, senha);
    }
  }
}
