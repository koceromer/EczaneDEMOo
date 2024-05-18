namespace EczaneDEMOo.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Kullanici")]
    public partial class Kullanici
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Kullanici()
        {
            Sastis = new HashSet<Satis>();
        }

        public int kullaniciID { get; set; }

        public int? rolID { get; set; }

        [StringLength(50)]
        public string ad { get; set; }

        [StringLength(50)]
        public string soyad { get; set; }

        [StringLength(50)]
        public string kullaniciAd { get; set; }

        [StringLength(50)]
        public string sifre { get; set; }

        [StringLength(50)]
        public string telefon { get; set; }

        [StringLength(50)]
        public string ePosta { get; set; }

        public bool silindiMi { get; set; }

        public virtual KullaniciRol KullaniciRol { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Satis> Sastis { get; set; }
    }
}
