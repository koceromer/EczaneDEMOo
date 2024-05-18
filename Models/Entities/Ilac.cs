namespace EczaneDEMOo.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Ilac")]
    public partial class Ilac
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Ilac()
        {
            Recete = new HashSet<Recete>();
            Sastis = new HashSet<Satis>();
        }

        public int ilacID { get; set; }

        [StringLength(100)]
        public string ad { get; set; }

        [StringLength(255)]
        public string aciklama { get; set; }

        [Column(TypeName = "money")]
        public decimal? fiyat { get; set; }

        public int? stokMiktar { get; set; }

        public bool silindiMi { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Recete> Recete { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Satis> Sastis { get; set; }
    }
}
