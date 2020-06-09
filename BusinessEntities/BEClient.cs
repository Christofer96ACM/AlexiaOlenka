using System;
using System.Collections.Generic;
using System.Linq;

namespace BusinessEntities
{
    public class BEClient
    {
        public string CardCode { get; set; }
        public string CardName { get; set; }
        public string CardFName { get; set; }
        public string LicTradNum { get; set; }
        public int ListNum { get; set; }
        public int SlpCode { get; set; }
        public int empID { get; set; }
        public int GroupNum { get; set; }
        public int GroupCode { get; set; }
        public string GenDoc { get; set; }
        public decimal Credit { get; set; }
        public string ShipToDef { get; set; }
        public string ShipStreet { get; set; }
        public string BillToDef { get; set; }
        public string BillStreet { get; set; }
        public string Doctor { get; set; }
        public string U_BIZ_CODI { get; set; }
        public decimal U_BIZ_MOV { get; set; }
        public int Linea { get; set; }
    }
}
