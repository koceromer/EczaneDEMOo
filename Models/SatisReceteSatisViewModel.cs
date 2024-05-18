using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EczaneDEMOo.Models
{
    public class SatisReceteSatisViewModel
    {
        public int SatisID { get; set; }
        public int ReceteID { get; set; }
        public string ReceteNo { get; set; }
        public int IlacID { get; set; }
        public int Adet { get; set; }
        public decimal? Fiyat { get; set; }
    }
}