using APITG.Persistence.Contexts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APITG.Persistence.Repositories
{
  public class BaseRepository
  {
    protected readonly ContextDB _contexto;
    public BaseRepository(ContextDB contexto)
    {
      _contexto = contexto;
    }
  }
}
