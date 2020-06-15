using APITG.Domain.Models;
using Microsoft.EntityFrameworkCore;

namespace APITG.Persistence.Contexts
{
    public class ContextDB : DbContext
    {

        public ContextDB(DbContextOptions<ContextDB> options) : base(options)
        {

        }

        public DbSet<Cliente> Cliente { get; set; }
        public DbSet<Logradouro> Logradouro { get; set; }
        public DbSet<Usuario> Usuario { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //modelBuilder.Entity<Usuario>().HasNoKey();
        }


    }
}
