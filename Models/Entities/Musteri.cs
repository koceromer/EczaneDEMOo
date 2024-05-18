namespace EczaneDEMOo.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Musteri")]
    public partial class Musteri
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Musteri()
        {
            Recete = new HashSet<Recete>();
            Sastis = new HashSet<Satis>();
        }

        public int musteriID { get; set; }

        [Required]
        [StringLength(100)]
        public string adSoyad { get; set; }

        [Required]
        [StringLength(11)]
        public string identityNumber { get; set; }

        [Required]
        [StringLength(20)]
        public string telefon { get; set; }

        [Required]
        [StringLength(255)]
        public string adres { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Recete> Recete { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Satis> Sastis { get; set; }
    }
}
