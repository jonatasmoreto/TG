using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using APITG.Domain.Models;
using APITG.Domain.Repositories;
using APITG.Persistence.Contexts;
using Microsoft.EntityFrameworkCore;

namespace APITG.Persistence.Repositories
{
    public class UsuarioRepository : BaseRepository, IUsuarioRepository
    {
        public UsuarioRepository(ContextDB contexto) : base(contexto)
        {
        }

        public Usuario Get(string nome, string senha)
        {
            return _contexto.Usuario.FromSqlRaw<Usuario>("sp_Usuario_Consultar {0}, {1}", nome.ToLower(), senha.ToLower()).ToList().FirstOrDefault();
        }
    }
}
