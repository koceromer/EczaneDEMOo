using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace EczaneDEMOo.Models.Entities
{
    public partial class EczaneContext : DbContext
    {
        public EczaneContext()
            : base("name=EczaneContext")
        {
        }

        public virtual DbSet<Doktor> Doktor { get; set; }
        public virtual DbSet<DoktorUnvan> DoktorUnvan { get; set; }
        public virtual DbSet<Ilac> Ilac { get; set; }
        public virtual DbSet<Kullanici> Kullanici { get; set; }
        public virtual DbSet<KullaniciRol> KullaniciRol { get; set; }
        public virtual DbSet<Musteri> Musteri { get; set; }
        public virtual DbSet<Recete> Recete { get; set; }
        public virtual DbSet<Satis> Satis { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Ilac>()
                .Property(e => e.fiyat)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Kullanici>()
                .HasMany(e => e.Sastis)
                .WithOptional(e => e.Kullanici)
                .HasForeignKey(e => e.calisanID);

            modelBuilder.Entity<KullaniciRol>()
                .HasMany(e => e.Kullanici)
                .WithOptional(e => e.KullaniciRol)
                .HasForeignKey(e => e.rolID);

            modelBuilder.Entity<Satis>()
                .Property(e => e.fiyat)
                .HasPrecision(19, 4);
        }
    }
}
