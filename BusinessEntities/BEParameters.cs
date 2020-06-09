using System;
using System.Collections.Generic;
using System.Linq;

namespace BusinessEntities
{
    public class BEParameters
    {
        public BEParameters()
        {
            Permisos = new List<BEParameters>();
        }
        public int Number { get; set; }
        public string Series { get; set; }
        public string U_GOS_MARCA { get; set; }
        public string BaseRef { get; set; }
        public decimal Total { get; set; }
        public decimal Total2 { get; set; }
        public decimal Total3 { get; set; }
        public decimal Total4 { get; set; }
        public decimal Total5 { get; set; }
        public decimal Total6 { get; set; }
        public decimal TotalFC { get; set; }
        public int Linea { get; set; }
        public int TransId { get; set; }
        public string cuenta { get; set; }
        public string Proyecto { get; set; }
        public string U_DXP_VISIBLE { get; set; }
        public string U_DXP_USUARIO_MOD { get; set; }
        public DateTime U_U_DXP_FECHA { get; set; }
        public string GRUPO_MENU { get; set; }
        public string PARTICULAR_MENU { get; set; }
        public int PERMISO { get; set; }
        public string PERMISOR { get; set; }
        public string LOCAL { get; set; }
        public string NOMBRE_OFICIAL { get; set; }
        public List<BEParameters> Permisos { get; set; }
        public string U_DXP_NOMBRE_PARAMET { get; set; }
        public string U_DXP_ABO_MIKROT { get; set; }
        public string U_DXP_ONU_SEDE { get; set; }

        public string IPONU { get; set; }
        public string USUARIONU { get; set; }
        public string PASSWORDONU { get; set; }


        public string U_DXP_VALOR_PARAMETR { get; set; }
        public string U_U_DXP_CODE { get; set; }
        public string U_DXP_SEDE { get; set; }
        public string Socied { get; set; }
        public string Project { get; set; }
        public string DscpLocal { get; set; }
        public string CardCode { get; set; }
        public string CardName { get; set; }
        public string Id_Dire { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Actives { get; set; }
        public Int16 PriceList { get; set; }
        public string WhsCode { get; set; }
        public decimal Rate { get; set; }
        public decimal RateEur { get; set; }
        public string U_BF_EMID { get; set; }
        public string CompanyAddress { get; set; }
        public string Phone { get; set; }
        public string SerieMaqr { get; set; }
        public int U_BF_ADMIN { get; set; }
        public int Sw { get; set; }
        public int año { get; set; }
        public int mes { get; set; }
        public int ObjType { get; set; }
        public int AbsEntryUpdt { get; set; }
        
        public string ParValue { get; set; }
        public int ColumnIndex { get; set; }
        public string Msg { get; set; }
        public string CompanyDB { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public object objSapSbo { get; set; }
        public DateTime? DateIn { get; set; }
        public DateTime? DateFi { get; set; }
        public DateTime? FechaUpdt { get; set; }
        public string FechaUpdt2 { get; set; }
        public string NumAtCard { get; set; }
        public string Descripcion { get; set; }
        public int DraftEntry { get; set; }
        public int DocEntry { get; set; }
        public int DocNum { get; set; }
        public bool Kit { get; set; }
        public string Internal { get; set; }
        public string Reserve { get; set; }
        public string TypeFilter { get; set; }
        public string Permition { get; set; }
        public string ItemCode { get; set; }
        public string Prov { get; set; }
        public string dni { get; set; }
        public string departamento { get; set; }
        public string provincia { get; set; }
        public string distrito { get; set; }
        public int accion { get; set; }
        public string RUC { get; set; }
        public string RAZON_SOCIAL { get; set; }
        public string NOMBRE_BD { get; set; }
        public string INDEX { get; set; }
        public string VALOR { get; set; }
        public string DEFECTO { get; set; }
        public string CLAVE { get; set; }
        public bool Band { get; set; }
        public string Currency { get; set; }
        public string Moneda { get; set; }
        public string SRV { get; set; }
        public string DBUSERNAME { get; set; }
        public string DBPASSWORD { get; set; }
        public string SAPUSERNAME { get; set; }
        public string SAPPASSWORD { get; set; }
        public string DIRECCIONIP { get; set; }
        public string USUARIOMKT { get; set; }
        public string PASSWORDMKT { get; set; }

        //OLENKA
        public string U_DXP_COD_ABONADO { get; set; }
        public string Status { get; set; }
        public string U_DXP_PLAN_INT { get; set; }
        public DateTime? U_DXP_FECHA_REG { get; set; }
        public DateTime? U_DXP_FEC_CORT_INT { get; set; }
        public DateTime? U_DXP_FEC_CORT_CABLE { get; set; }
        public string U_DXP_ESTADO_INT { get; set; }
        public string U_DXP_ESTADO_CABLE { get; set; }
        public string U_DXP_DIREC_ABO { get; set; }
        public string U_DXP_ABONADO { get; set; }
        public string U_DXP_DIRECCION { get; set; }
        public string U_DXP_MAC_EQUIPO { get; set; }

        public string ShipToCode { get; set; }



        //ONUS
        

        public string U_DXP_COD_ONU { get; set; }
        public string U_DXP_ONU_CODABO { get; set; }
        public string U_DXP_ONU_TARJETA { get; set; }
        public string U_DXP_ONU_PUERTO { get; set; }
        public string U_DXP_ONU_ABONADO { get; set; }
        public string U_DXP_ONU_ESTADO { get; set; }
        //public string U_DXP_ONU_MAC { get; set; }
        public string U_DXP_ONU_TYPE { get; set; }
        // public string U_DXP_ONU_MODE { get; set; }
        
        public string U_U_DXP_ONU_SERIAL { get; set; }
        
    }
}
