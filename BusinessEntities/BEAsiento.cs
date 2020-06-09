using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntities
{
    public class BEAsiento
    {
        public BEAsiento()
        {
            Lines = new List<BEDocumentLine>();
        }
        public List<BEDocumentLine> Lines { get; set; }
        public string PrjCode { get; set; }
        public string Msg { get; set; }
        public string PrjName { get; set; }

        public string U_GOS_ESTDOC_LE { get; set; }
        public string U_GOS_FECHA_LE { get; set; }
        public int U_MSS_TransIdAD { get; set; }




        public int Number { get; set; }
        public DateTime RefDate { get; set; }
        public DateTime DueDate { get; set; }
        public DateTime StornoDate { get; set; }
        public DateTime TaxDate { get; set; }
        public string Memo { get; set; }
        public string FormatCode { get; set; }
        public string BaseRef { get; set; }
        public int TransId { get; set; }
        public string Project { get; set; }
        public string Indicator { get; set; }
        public string TransCode { get; set; }
        public string Ref1 { get; set; }
        public string Ref2 { get; set; }
        public string Ref3 { get; set; }
        public string TipoC { get; set; }
        public string Ref1m { get; set; }
        public string Ref2m { get; set; }
        public string Ref3m { get; set; }


        public string AcctCode { get; set; }
        public string OrignCurr { get; set; }
        public decimal CurrTotal { get; set; }
        public decimal Transrate { get; set; }

        public int Line_ID { get; set; }
        public string Series { get; set; }
        public string ShortName { get; set; }
        public string AcctName { get; set; }
        public string Account { get; set; }
        public string Debit { get; set; }
        public string Credit { get; set; }
        public string Debit_ME { get; set; }
        public string Credit_ME { get; set; }
        public string Debit_MS { get; set; }
        public string Credit_MS { get; set; }
        public string LineMemo { get; set; }
        public string Ref1d { get; set; }
        public string Ref2d { get; set; }
        public string Ref3Line { get; set; }
        public string RefDated { get; set; }
        public string DueDated { get; set; }
        public string TaxDated { get; set; }
        public string Projectd { get; set; }
        public string ContraAct { get; set; }

        public string AutoStorno { get; set; }
        public string AdjTran { get; set; }
        public string AutoVAT { get; set; }
        public string AutoWT { get; set; }


    }
}
