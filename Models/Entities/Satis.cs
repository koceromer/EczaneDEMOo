namespace EczaneDEMOo.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Satis
    {
        [Key]
        public int satisID { get; set; }

        public int? ilacID { get; set; }
        public int? receteID { get; set; }
        public int? musteriID { get; set; }

        public int? calisanID { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? satisTarih { get; set; }

        public int? miktar { get; set; }

        [Column(TypeName = "money")]
        public decimal? fiyat { get; set; }

        public virtual Ilac Ilac { get; set; }

        public virtual Kullanici Kullanici { get; set; }

        public virtual Musteri Musteri { get; set; }
    }
}
