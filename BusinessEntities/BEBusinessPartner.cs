using System;
using System.Collections.Generic;
using System.Linq;

namespace BusinessEntities
{
    public class BEBusinessPartner
    {
        public BEBusinessPartner()
        {
            Lines = new List<BEContactLines>();
            Lines2 = new List<BEClientAddress>();
        }
        public bool Proveedor { get; set; }
        public string Active { get; set; }
        public string validFor { get; set; }
        public string ID { get; set; }
        public string Tecnico { get; set; }
        public int LineNum { get; set; }
        public string Currency { get; set; }
        public string validFrom { get; set; }
        public string frozenFor { get; set; }
        public string frozenFrom { get; set; }
        public string Socied { get; set; }
        public string CardCode { get; set; }
        public string CardName { get; set; }
        public string U_BPP_BPTP { get; set; }
        public string U_BPP_BPTD { get; set; }
        public string GroupCode { get; set; }
        public string LicTradNum { get; set; }
        public string U_PN_FecNac { get; set; }
        public string  CreateDate { get; set; }
        public string GroupNum { get; set; }
        public string ListNum { get; set; }
        public string Phone1 { get; set; }
        public string Cellular { get; set; }
        public string E_Mail { get; set; }
        public string U_BPP_BPAP { get; set; }
        public string U_BPP_BPAM { get; set; }
        public string U_BPP_BPNO { get; set; }
        public string U_PN_CodGrup { get; set; }
        public string Free_Text { get; set; }
        public int SlpCode { get; set; }
        public string Msg { get; set; }

        public List<BEContactLines> Lines { get; set; }
        public List<BEClientAddress> Lines2 { get; set; }

        public string U_PN_Vend  { get; set; }
	    public string U_PN_DepDirVive { get; set; }
		public string U_PN_ProvDirVive { get; set; }
		public string U_PN_DistDirVive { get; set; }
		public string U_PN_Zona { get; set; }
		public string U_PN_DirViveRefe  { get; set; }
        public string U_PN_DirVive { get; set; }
        public string U_PN_Docum { get; set; }
        public int Linea { get; set; }
        
    }
}
