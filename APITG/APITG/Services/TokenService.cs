using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using APITG.Domain.Models;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;

namespace APITG.Services
{
  public class TokenService : ITokenService
  {
    public IConfiguration Configuration { get; }

    public TokenService(IConfiguration configuration)
    {
      Configuration = configuration;
    }

    //Gerar token
    public string GenerateToken(Usuario usuario)
    {
      var tokenHandler = new JwtSecurityTokenHandler();

      var key = Encoding.ASCII.GetBytes(Configuration["SecurityKey"]);

      var tokenDescriptor = new SecurityTokenDescriptor
      {
        Subject = new ClaimsIdentity(new Claim[] {
          new Claim(ClaimTypes.Name, usuario.Nome.ToString())
       }),
        Expires = DateTime.UtcNow.AddHours(5),
        SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
      };

      var token = tokenHandler.CreateToken(tokenDescriptor);
      return tokenHandler.WriteToken(token);
    }
  }
}
