using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntities
{
    public class BECuentasPago
    {
        public int LineNum { get; set; }
        public string Project { get; set; }
        public string AcctCode { get; set; }
        public string AcctName { get; set; }
        public string ActCurr { get; set; }
        public string Clave { get; set; }
        public string CurrTotal { get; set; }
        public string U_EFECTIVO_ME { get; set; }
        public string U_TARJETA_N { get; set; }
        public string U_TARJETA_E { get; set; }
        public decimal Total { get; set; }
    }
}
