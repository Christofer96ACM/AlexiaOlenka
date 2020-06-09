using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntities
{
   public class BEChild
    {
        public decimal Quantity2 { get; set; }
        public int ChildNum { get; set; }
        public string Warehouse { get; set; }
        public string Father { get; set; }
        public string FatherName { get; set; }
        public string Code { get; set; }
        public string ItemCode { get; set; }
        public string ItemName { get; set; }
        public string WhsCode { get; set; }
        public string InvntryUom { get; set; }
        public string TreeType { get; set; }
        public string HideComp { get; set; }
        public int Linea { get; set; }
    }
}
