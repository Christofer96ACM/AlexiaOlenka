using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntities
{
    public class BETarjetaEquipo
    {
        public int insID { get; set; }
        public string CardCode { get; set; }
        public string CardName { get; set; }
        public string ItemCode { get; set; }
        public string ItemName { get; set; }
        public string manufSN { get; set; }
        public string internalSN { get; set; }
        public string Status { get; set; }
        public string instLction { get; set; }
        public string street { get; set; }
        public string state { get; set; }
        public string distrito { get; set; }
        public string county { get; set; }
        public string cellular { get; set; }
        public string U_GOS_MARCA { get; set; }
        public string U_GOS_MODELO { get; set; }
        public string Msg { get; set; }
        public string directCsmr { get; set; }
        public string drctCsmNam { get; set; }
        public int deliveryNo { get; set; }
        public int invoiceNum { get; set; }

    }
}
