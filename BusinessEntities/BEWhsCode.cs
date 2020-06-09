using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntities
{
    public class BEWhsCode
    {
        public string WhsCode { get; set; }
        public string WhsName { get; set; }
        public decimal OnHand { get; set; }
        public string Locked { get; set; }
        public decimal IsCommited { get; set; }
        public decimal OnOrder { get; set; }
        public decimal Disponible { get; set; }
        public string RevenuesAc { get; set; }
        public string ExpensesAc { get; set; }
        public int Linea { get; set; }
    }
}
