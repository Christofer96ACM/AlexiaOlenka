using System;
using System.Collections.Generic;
using System.Linq;


namespace BusinessEntities
{
    public class BEAlmacen
    {
        public BEAlmacen()
        {
            Almacenes = new List<BEProduct>();
        }
        //Cambio desarrolador
        public string U_BPP_TIPEXIST { get; set; }
        public string Msg { get; set; }
        public string ItemCode { get; set; }
        public string ItemName { get; set; }
        public string ItemType { get; set; }
        public string ItmsGrpCod { get; set; }
        public string ListName { get; set; }
        public string InvntItem { get; set; }
        public string SellItem { get; set; }
        public string PrchseItem { get; set; }
        public string IssueMthd { get; set; }
        public string MngMethod { get; set; }
        public string Active { get; set; }
        public string BuyUnitMsr { get; set; }
        public string NumInBuy { get; set; }
        public string PurPackMsr { get; set; }
        public string PurPackUn { get; set; }
        public decimal NumInSale { get; set; }
        public string SalUnitMsr { get; set; }
        public string SalPackMsr { get; set; }
        public string SalPackUn { get; set; }
        public string TaxCodeAP { get; set; }
        public string TaxCodeAR { get; set; }
        public int Linea { get; set; }
        public int Quantity { get; set; }
        public decimal OnHand { get; set; }
        public decimal PriceBefDi { get; set; }
        public decimal DiscPrcnt { get; set; }
        public decimal Price { get; set; }
        public decimal PriceVat { get; set; }
        public string BatchNum { get; set; }
        public string U_BF_CodKit { get; set; }
        public decimal Cost { get; set; }
        public decimal U_BIZ_VAL { get; set; }
        public decimal U_BIZ_CAPC { get; set; }
        public string U_BIZ_FOFA { get; set; }
        public decimal U_StoDiBE { get; set; }
        public decimal U_BF_StoDiYo { get; set; }
        public decimal BL050 { get; set; }
        public decimal BL010 { get; set; }
        public decimal U_U_BF_CompTot { get; set; }
        public decimal U_BF_MOMI { get; set; }
        public decimal U_BF_MOMA { get; set; }
        public string U_BF_COKI { get; set; }
        public int U_BF_DEFA { get; set; }
        public string U_BIZ_DREC { get; set; }
        public decimal stock { get; set; }
        public string Serie { get; set; }
        public int SysNumber { get; set; }
        public decimal Cantidad { get; set; }
        public string Father { get; set; }
        public string FatherName { get; set; }
        public string Code { get; set; }
        public string CodeName { get; set; }
        public int ChildNum { get; set; }
        public string Warehouse { get; set; }
        public string SUPRIMIR_MATERIALES { get; set; }
        public int PriceList { get; set; }
        public string AcctCode { get; set; }
        public string GLMethod { get; set; }
        public string ByWh { get; set; }
        public string WhsCode { get; set; }
        public string WhsName { get; set; }
        public string Locked { get; set; }
        public decimal IsCommited { get; set; }
        public decimal OnOrder { get; set; }
        public decimal Disponible { get; set; }
        public string RevenuesAc { get; set; }
        public string ExpensesAc { get; set; }
        public List<BEProduct> Almacenes { get; set; }
        public string Tiempo { get; set; }

    }
}
