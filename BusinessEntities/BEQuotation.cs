using System;
using System.Collections.Generic;
using System.Linq;

namespace BusinessEntities
{
    public class BEQuotation
    {
        public BEQuotation()
        {
            qut17 = new List<BEQuotation17>();
            qut18 = new List<BEQuotation18>();
        }
        public string Socied { get; set; }
        public int LineNum { get; set; }
        public int DocEntry { get; set; }
        public int DocNum { get; set; }
        public DateTime CreateDate { get; set; }
        public string U_BIZ_CODM { get; set; }
        public string U_BIZ_NOMM { get; set; }
        public decimal U_BIZ_CNTP { get; set; }
        public string U_BIZ_CODR { get; set; }
        public string U_BIZ_NOMR { get; set; }
        public decimal U_BIZ_TOTP { get; set; }
        public decimal U_BIZ_COSC { get; set; }
        public decimal U_BIZ_COSE { get; set; }
        public decimal U_BIZ_COSM { get; set; }
        public decimal U_BIZ_TOTC { get; set; }
        public decimal U_BIZ_PMAR { get; set; }
        public decimal U_BIZ_PREV { get; set; }
        public string U_BIZ_DOCE { get; set; }
        public string U_BIZ_COSN { get; set; }
        public string CardName { get; set; }
        public decimal U_BIZ_TOTM { get; set; }
        public string U_BIZ_UNPR { get; set; }
        public decimal U_BIZ_MIGV { get; set; }
        public decimal U_BIZ_PVMI { get; set; }
        public string U_BF_DEET { get; set; }
        public string U_BF_FOFA { get; set; }
        public string U_BF_HNCO { get; set; }
        public string U_PickRmrk { get; set; }
        public string Actives { get; set; }
        public Int16 SlpCode { get; set; }

        public string Msg { get; set; }
        public List<BEQuotation17> qut17 { get; set; }
        public List<BEQuotation18> qut18 { get; set; }
    }
}
