using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntities
{
    public class BEPrintTicket
    {
        public string CompanyName { get; set; }
        public string Ruc { get; set; }
        public string CompanyAddress { get; set; }
        public string Phone { get; set; }
        public string SerieMaqr { get; set; }
        public string NumAtCard { get; set; }
        public string DocDate { get; set; }
        public string CardName { get; set; }
        public string LicTradNum { get; set; }

        public string ItemCode { get; set; }
        public string ItemName { get; set; }
        public int Quantity { get; set; }
        public decimal PriceDiscount { get; set; }

        public string SubTotal { get; set; }
        public string Discount { get; set; }
        public string VatSum { get; set; }
        public string DocTotal { get; set; }
    }
}
