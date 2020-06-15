using APITG.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APITG.Services
{
  public interface ITokenService
  {
    string GenerateToken(Usuario usuario);
  }
}
