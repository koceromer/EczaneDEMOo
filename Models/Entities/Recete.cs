namespace EczaneDEMOo.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Recete")]
    public partial class Recete
    {
        public int receteID { get; set; }

        public int? doktorID { get; set; }

        public int? musteriID { get; set; }

        public int? ilacID { get; set; }

        public string receteNo { get; set; }
        public int? miktar { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? tarih { get; set; }

        public virtual Doktor Doktor { get; set; }

        public virtual Ilac Ilac { get; set; }

        public virtual Musteri Musteri { get; set; }
    }
}
