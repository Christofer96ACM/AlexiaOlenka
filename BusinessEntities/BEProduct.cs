using System;
using System.Collections.Generic;
using System.Linq;

namespace BusinessEntities
{
    public class BEProduct
    {
        public BEProduct()
        {
            Almacenes = new List<BEAlmacen>();
            Precios = new List<BEPrice>();
            Hijos = new List<BEProduct>();
        }
        public string DetalleServicio { get; set; }
        public string U_GOS_MARCA { get; set; }
        public string PLAN { get; set; }
        public string U_DXP_PLANINT { get; set; }
        public string U_GOS_MODELO { get; set; }
        public int Linea { get; set; }
        public string LastPurCur { get; set; }
        public decimal LastPurPrc { get; set; }
        public string InvntryUom { get; set; }
        public string Seriefabricante { get; set; }
        public string SerieInterna { get; set; }
        public string instLction { get; set; }
        public string NoFacturable { get; set; }
        public string TreeType { get; set; }
        public string HideComp { get; set; }
        public string Msg { get; set; }
        public string ItemCode { get; set; }
        public string ItemName { get; set; }
        public string ItemType { get; set; }
        public string ItmsGrpCod { get; set; }
        public string ListName { get; set; }
        public string InvntItem { get; set; }
        public string SellItem { get; set; }
        public string PrchseItem { get; set; }
        public string ActivoC { get; set; }
        public string ActivoS { get; set; }
        public string IssueMthd { get; set; }
        public string MngMethod { get; set; }
        public string Active { get; set; }
        public string BuyUnitMsr { get; set; }
        public Int32 NumInBuy { get; set; }
        public string PurPackMsr { get; set; }
        public Int32 PurPackUn { get; set; }
        public Int32 NumInSale { get; set; }
        public string SalUnitMsr { get; set; }
        public string SalPackMsr { get; set; }
        public Int32 SalPackUn { get; set; }
        public string TaxCodeAP { get; set; }
        public string TaxCodeAR { get; set; }
        public string U_BPP_TIPEXIST { get; set; }
        public int Quantity { get; set; }
        public decimal Quantity2 { get; set; }
        public int OnHand { get; set; }
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
        public string ManBtchNum { get; set; }
        public string ManSerNum { get; set; }
        public int IsCommited { get; set; }
        public int OnOrder { get; set; }
        public int Disponible { get; set; }
        public string RevenuesAc { get; set; }
        public string ExpensesAc { get; set; }
        public List<BEAlmacen> Almacenes { get; set; }
        public List<BEPrice> Precios { get; set; }
        public List<BEProduct> Hijos { get; set; }
    }
}
