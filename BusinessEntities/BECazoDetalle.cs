using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntities
{
    public class BECazoDetalle
    {
        public BECazoDetalle()
        {
            Line = new List<BECazoDetalle>();
        }

        public string Code { get; set; }
        public string Name { get; set; }
        public int DocEntry { get; set; }
        public string Object { get; set; }
        public decimal U_DXP_BIZ_MOV { get; set; }
        public List<BECazoDetalle> Line { get; set; }
    }
}
