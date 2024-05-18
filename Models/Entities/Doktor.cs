namespace EczaneDEMOo.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Doktor")]
    public partial class Doktor
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Doktor()
        {
            Recete = new HashSet<Recete>();
        }

        public int doktorID { get; set; }

        [StringLength(100)]
        public string ad { get; set; }

        [StringLength(100)]
        public string soyad { get; set; }

        public int? unvanID { get; set; }

        public virtual DoktorUnvan DoktorUnvan { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Recete> Recete { get; set; }
    }
}
