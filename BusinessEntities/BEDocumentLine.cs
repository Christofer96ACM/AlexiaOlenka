using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntities
{
    public class BEDocumentLine
    {
        
        public string U_GOS_MARCA { get; set; }
        public string Doctor { get; set; }
        public DateTime DocDate { get; set; }
        public string DetalleServicio { get; set; }
        public int DocEntry { get; set; }
        public int LineNum { get; set; }
        public string OItemCode { get; set; }
        public string PLAN { get; set; }
        public string ItemCode { get; set; }
        public string ItemName { get; set; }
        public string LastPurCur { get; set; }
        public decimal OnHand { get; set; }
        public decimal NumInSale { get; set; }
        public decimal NumInBuy { get; set; }
        public decimal  Quantity { get; set; }
        public decimal _Quantity { get; set; }
        public decimal PriceBefDi { get; set; }
        public decimal DiscPrcnt { get; set; }
        public decimal Price { get; set; }
        public string ActivoC { get; set; }
        public string ActivoS { get; set; }
        public decimal LineTotal { get; set; }
        public decimal GTotal { get; set; }
        public string WhsCode { get; set; }
        public string WareHouse { get; set; }
        public string U_BF_CodKit { get; set; }
        public string BatchNum { get; set; }
        public string BatchNums { get; set; }
        public string U_BF_LOTE { get; set; }
        public string TaxCode { get; set; }
        public string ObjType { get; set; }
        public string LineStatus { get; set; }
        public string InvntItem { get; set; }
        public int OpenQty { get; set; }
        public string U_BIZ_DREC { get; set; }
        public string U_BIZ_FFAR { get; set; }
        public decimal U_BIZ_CANT { get; set; }
        public string U_BF_FECH_EXPE { get; set; }
        public string U_BF_FECH_VENC { get; set; }
        public decimal U_StoDiBE { get; set; }
        public decimal U_BF_StoDiYo { get; set; }
        public decimal BL050 { get; set; }
        public decimal BL010 { get; set; }
        public decimal U_U_BF_CompTot { get; set; }
        public string U_BIZ_UNPR { get; set; }
        public decimal U_BIZ_GANA { get; set; }
        public string U_BF_ABRE_ETIQ { get; set; }
        public string DocQut { get; set; }
        public int InGift { get; set; }
        public int InDscOrg { get; set; }
        public decimal OnDscOrg { get; set; }
        public string Serie { get; set; }
        public int BaseType { get; set; }
        public int BaseEntry { get; set; }
        public int BaseLine { get; set; }
        public string IssueMthd { get; set; }
        public string TreeType { get; set; }
        public int SysNumber { get; set; }
        public decimal Cantidad { get; set; }
        public string Father { get; set; }
        public string AcctCode { get; set; }


        //para Asiento

        public string ShortName { get; set; }
        public string AcctName { get; set; }
        public string Account { get; set; }
        public decimal Debit { get; set; }
        public decimal Credit { get; set; }
        public string LineMemo { get; set; }
        public string Ref1d { get; set; }
        public string Ref2d { get; set; }
        public string Ref3Line { get; set; }
        public string RefDated { get; set; }
        public string DueDated { get; set; }
        public string TaxDated { get; set; }
        public string Projectd { get; set; }
        public string Project { get; set; }

       
        public decimal Debit_ME { get; set; }
        public decimal Credit_ME { get; set; }
        public decimal Debit_MS { get; set; }
        public decimal Credit_MS { get; set; }
    }
}
