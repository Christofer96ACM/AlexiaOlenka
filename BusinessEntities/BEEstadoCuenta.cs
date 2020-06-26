using System;
using System.Collections.Generic;
using System.Linq;

namespace BusinessEntities
{
    public class BEEStadoCuenta
    {
        public string TIPO_DOC { get; set; }
        public string Documento { get; set; }
        
        public string DocStatus { get; set; }
        public string DocDate { get; set; }
        public decimal DocTotal { get; set; }
        public string slpname { get; set; }
        public string OwnerCode { get; set; }
        public string Comments { get; set; }

        public string OV_FECHA { get; set; }
        public string GU_FECHA { get; set; }
        public string NC_FECHA { get; set; }
       
        public decimal OV_TOTAL { get; set; }
        public decimal GU_TOTAL { get; set; }



        public string OV_NRO { get; set; }
        public string GU_NRO { get; set; }
        public string NC_NRO { get; set; }
        



        public string FT_NRO { get; set; }
        
        public string Fecha { get; set; }
        public string CardCode { get; set; }
        public string CardName { get; set; }
        public decimal FT_TOTAL { get; set; }
        public decimal MontoPagado { get; set; }
        public string Mon{ get; set; }
        public decimal EFECTIVO { get; set; }
        public decimal T_CREDITO { get; set; }
        public decimal CREDITO { get; set; }
        public decimal NC_TOTAL { get; set; }
        public decimal CHEQUE { get; set; }
        public decimal CONCILIACIONES { get; set; }
        public decimal TRANSFERENCIA { get; set; }



        //olenka

        public string DocNum { get; set; }
      
       
        public string CANCELADO { get; set; }
        public string ESTADO { get; set; }
        public string FACTURA { get; set; }
        public string NumAtCard { get; set; }
        public string FECHA_FACTURA { get; set; }
        public string MONEDA_FACTURA { get; set; }
        public decimal TOTAL_FACTURA { get; set; }
        public string CANCELADO_FACTURA { get; set; }
        public string ESTADO_FACTURA { get; set; }
        public decimal MONTOPAGADO_FACTURA { get; set; }
        public decimal SALDO_FACTURA { get; set; }
       
        public string NC_NUMERO { get; set; }
       
    }
}
