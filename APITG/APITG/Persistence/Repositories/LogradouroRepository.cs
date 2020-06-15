using System.Collections.Generic;
using System.Data;
using Microsoft.Data.SqlClient;
using System.Linq;
using APITG.Domain.Models;
using APITG.Domain.Repositories;
using APITG.Persistence.Contexts;
using Microsoft.EntityFrameworkCore;

namespace APITG.Persistence.Repositories
{
    public class LogradouroRepository : BaseRepository, ILogradouroRepository
    {
        public LogradouroRepository(ContextDB contexto) : base(contexto)
        {
        }

        public void Add(Logradouro logradouro)
        {
            var resultParameter = new SqlParameter("@retorno", SqlDbType.Int)
            {
                Direction = ParameterDirection.Output
            };

            _contexto.Database.ExecuteSqlRaw("sp_Logradouro_Incluir @Endereco, @ClienteId, @retorno out", new SqlParameter("@Endereco", logradouro.Endereco), new SqlParameter("@ClienteId", logradouro.ClienteId), resultParameter);
            logradouro.Id = (int)resultParameter.Value;

        }

        public Logradouro Find(int id)
        {
            return _contexto.Logradouro.FromSqlRaw<Logradouro>("sp_Logradouro_Consultar @id", new SqlParameter("@id", id)).ToList().FirstOrDefault();
        }

        public IEnumerable<Logradouro> GetAll()
        {
            return _contexto.Logradouro.FromSqlRaw<Logradouro>("sp_Logradouro_Consultar").ToList();
        }

        public IEnumerable<Logradouro> GetAll(int clienteId)
        {
            return _contexto.Logradouro.FromSqlRaw<Logradouro>("sp_Logradouro_ConsultarPorCliente {0}", clienteId).ToList();
        }

        public void Remove(int id)
        {
            _contexto.Database.ExecuteSqlRaw("sp_Logradouro_Excluir @id", new SqlParameter("@id", id));
        }

        public void Update(Logradouro logradouro)
        {
            _contexto.Database.ExecuteSqlRaw("sp_Logradouro_Alterar @id, @Endereco, @ClienteId", new SqlParameter("@id", logradouro.Id), new SqlParameter("@Endereco", logradouro.Endereco), new SqlParameter("@ClienteId", logradouro.ClienteId));
        }
    }
}