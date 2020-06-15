using APITG.Domain.Models;
using APITG.Domain.Services;
using APITG.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace APITG.Controllers
{
  [Route("api/[controller]")]
  [ApiController]
  public class UsuarioController : ControllerBase
  {
    private readonly ITokenService _tokenService;
    private readonly IUsuarioSevice _usuarioSevice;

    public UsuarioController(ITokenService tokenService, IUsuarioSevice usuarioSevice)
    {
      _tokenService = tokenService;
      _usuarioSevice = usuarioSevice;
    }

    [HttpPost("login")]
    [AllowAnonymous]
    public ActionResult<dynamic> Post([FromBody] Usuario usuario)
    {
      var usuarioBD = _usuarioSevice.Get(usuario.Nome, usuario.Senha);

      if (usuarioBD == null)
        return NotFound(new { message = "Usuário ou senha inválidos" });

      var token = _tokenService.GenerateToken(usuarioBD);
      usuarioBD.Senha = "";

      return new
      {
        usuario = usuarioBD,
        token = token
      };
    }
  }
}
