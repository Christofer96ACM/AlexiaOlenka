using System;
using System.Collections.Generic;
using System.Linq;

namespace BusinessEntities
{
    public class BEDocument
    {
        public BEDocument()
        {
            Lines = new List<BEDocumentLine>();
            Anticipos = new List<BEAnticipos>();
            Lineas = new List<BEDocument>();
            CuentasPago = new List<BECuentasPago>();
        }

        public string U_DXP_VISIBLE { get; set; }
        public string U_DXP_USUARIO_MOD { get; set; }
        public DateTime U_U_DXP_FECHA { get; set; }

        public string IPONU { get; set; }
        public string USUARIONU { get; set; }
        public string PASSWORDONU { get; set; }
        public string LineMemo { get; set; }
        public string ContraAct { get; set; }
        public string Ref1 { get; set; }
        public string Ref2 { get; set; }
        public decimal Debit { get; set; }
        public decimal Credit { get; set; }
        public decimal BalScCred { get; set; }
        public decimal BalScDeb { get; set; }
        public string ItemName { get; set; }
        public string formatoImpresion { get; set; }
        public string Socied { get; set; }
        public string Active { get; set; }
        public string Descto { get; set; }
        public decimal SaldoVenc { get; set; }
        public decimal PagoTotal { get; set; }
        public string U_DXP_SEDE { get; set; }
        public string AlmacenO { get; set; }
        public string AlmacenD { get; set; }
        public string U_DXP_FE_MOTIVO_TRAS { get; set; }
        public string U_DXP_FE_MODALIDTRAS { get; set; }
        public string DDocEntry { get; set; }
        public int DocEntry { get; set; }
        public int DocEntryBorrador { get; set; }
        public int DocNum { get; set; }
        public int CntctCode { get; set; }
        public string DocStatus { get; set; }
        public string Currency { get; set; }
        public DateTime DocDate { get; set; }
        public DateTime DocDate1 { get; set; }
        public DateTime DocDate3 { get; set; }
        public DateTime TaxDate { get; set; }
        public DateTime DocDueDate { get; set; }
        public string DocDate2 { get; set; }
        public string CardCode { get; set; }
        public string CardName { get; set; }
        public string U_DXP_FE_MOT_GEN { get; set; }
        public string CardNameAdd { get; set; }
        public string LicTradNum { get; set; }
        public string U_BPP_MDTD { get; set; }
        public string U_BPP_MDSD { get; set; }
        public string U_BPP_MDCD { get; set; }
        public string U_BPP_MDTO { get; set; }
        public string U_BPP_MDSO { get; set; }
        public string U_BPP_MDCO { get; set; }
        public string NumAtCard { get; set; }
        public string NumAtCard3 { get; set; }
        public string ShipToCode { get; set; }
        public string PayToCode { get; set; }
        public string ShipStreet { get; set; }
        public string BillStreet { get; set; }
        public string U_MP_FE_GRR { get; set; }
        public string U_DXP_FE_TO { get; set; }
        public string Address { get; set; }
        public string Address2 { get; set; }
        public string SerieGuia { get; set; }
        public Int16 ListNum { get; set; }
        public int SlpCode { get; set; }
        public int ListNumSrch { get; set; }
        public int OwnerCode { get; set; }
        public string Project { get; set; }
        public int GroupNum { get; set; }
        public decimal DiscPrcntTotal { get; set; }
        public decimal DiscSum { get; set; }
        public decimal DpmAmnt { get; set; }
        public decimal TotalExpns { get; set; }
        public decimal DpmPrcnt { get; set; }
        public string U_BF_PED_ORIG { get; set; }
        public string Comments { get; set; }
        public string U_BF_PickRmrk { get; set; }
        public decimal DocTotal { get; set; }
        public string DocTotalSrch { get; set; }
        public decimal PaidToDate { get; set; }
        public decimal PendingBal { get; set; }
        public string U_BIZ_LUEN { get; set; }        
        public string U_BIZ_CODI { get; set; }
        public string U_BF_HOEN { get; set; }
        public string U_BF_HCFI { get; set; }
        public string U_BF_CODNI { get; set; }
        public string U_BIZ_SOLI { get; set; }
        public string U_BF_COCIT { get; set; }
        public string U_BIZ_CONTA { get; set; }
        public string U_BIZ_TPDO { get; set; }
        public string U_BF_HONUP { get; set; }
        public string U_BIZ_DOCG { get; set; }
        public string U_BIZ_MEDI { get; set; }
        public string U_BIZ_ESP { get; set; }
        public string U_BIZ_COLE { get; set; }
        public string U_BIZ_DIRE_MED { get; set; }
        public decimal U_BF_CREDBM { get; set; }
        public string U_BF_NumOV { get; set; }

        public string Doctor { get; set; }
        public string U_BIZ_UBIG { get; set; }
        public decimal U_BIZ_MOV { get; set; }
        public string DocTime { get; set; }
        public string CardNameReal { get; set; }
        public int Stock { get; set; }
        public List<BEDocumentLine> Lines { get; set; }
        public List<BEAnticipos> Anticipos { get; set; }
        public List<BEDocument> Lineas { get; set; }
        public List<BECuentasPago> CuentasPago { get; set; }
        public string Msg { get; set; }

        public int BaseDocType { get; set; }
        public int BaseDocEntry { get; set; }
        public string Reserve { get; set; }

        public string MedPayment { get; set; }
        public string CashAccount { get; set; }
        public decimal CashSum { get; set; }
        public Int16 CreditCard { get; set; }
        public string CreditCardNumber { get; set; }
        public string CardValidUntil { get; set; }
        public string VoucherNum { get; set; }
        public string DetPayment { get; set; }
        public string DocCur { get; set; }
        public string DIRECCIONIP { get; set; }
        public string USUARIOMKT { get; set; }
        public string PASSWORDMKT { get; set; }
        //Mikrotik
        public string MsjMikrot { get; set; }
        public string MedPayment2 { get; set; }
        public string MedPayment3 { get; set; }
        public string CashAccount2 { get; set; }
        public string CashAccount3 { get; set; }
        public decimal CashSum2 { get; set; }
        public decimal CashSum3 { get; set; }
        public string DocCur2 { get; set; }
        public string DocCur3 { get; set; }

    }
}
