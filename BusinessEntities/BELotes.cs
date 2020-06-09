using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntities
{
    public class BELotes
    {
        public string ItemCode { get; set; }
        public string ItemName { get; set; }
        public string SysNumber { get; set; }
        public decimal Cantidad { get; set; }
        public decimal Stock { get; set; }
        public string Lote { get; set; }
        public string DueDate { get; set; }
        public DateTime DueDateCompra { get; set; }
        //public int Cantidad { get; set; }
    }
}
