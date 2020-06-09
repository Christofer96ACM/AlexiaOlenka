using System;
using System.Collections.Generic;
using System.Linq;

namespace BusinessEntities
{
    public class BECloseBox
    {
        public string FT_NRO { get; set; }
        public string NC_NRO { get; set; }
        public string Fecha { get; set; }
        public string CardCode { get; set; }
        public string CardName { get; set; }
        public decimal FT_TOTAL { get; set; }
        public decimal MontoPagado { get; set; }
        public decimal EFECTIVO { get; set; }
        public decimal T_CREDITO { get; set; }
        public decimal NC_TOTAL { get; set; }
    }
}
