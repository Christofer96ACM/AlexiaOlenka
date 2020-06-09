using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using DataAccess;
using BusinessEntities;
using ResultSetMappers;

namespace BusinessRules
{
    public class BRDocument : IDisposable
    {
        protected DADocument oda;
        public BRDocument()
        {
            oda = new DADocument();
        }
        private bool disposed;
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        private void Dispose(bool disposing)
        {
            if (disposed)
                return;
            if (disposing)
            {
                oda.Dispose();
                oda = null;
            }
            disposed = true;
        }
        ~BRDocument()
        {
            Dispose(false);
        }
        public void Recoverer(BEParameters obj)
        {
            oda.Recoverer(obj);
            Dispose(false);
        }
        #region Dashboard
        public List<BEDocument> Get_DS_OSCSP_SRCH_OINV(BEParameters obep)
        {
            using (var odr = oda.Get_DS_OSCSP_SRCH_OINV(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BELlamadaServicio> Get_DS_OSCSP_SRCH_OSCL(BEParameters obep)
        {
            using (var odr = oda.Get_DS_OSCSP_SRCH_OSCL(obep))
            {
                var olst = new List<BELlamadaServicio>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BELlamadaServicio>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocument> Get_DS_OSCSP_SRCH_OPCH(BEParameters obep)
        {
            using (var odr = oda.Get_DS_OSCSP_SRCH_OPCH(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocumentLine> Get_DS_OSCSP_SRCH_INV1(BEParameters obep)
        {
            using (var odr = oda.Get_DS_OSCSP_SRCH_INV1(obep))
            {
                var olst = new List<BEDocumentLine>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocumentLine>(odr);
                Dispose(false);
                return (olst);
            }
        }

        public List<BEDocumentLine> Get_OSCSP_SRCH_JDT1(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_JDT1(obep))
            {
                var olst = new List<BEDocumentLine>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocumentLine>(odr);
                Dispose(false);
                return (olst);
            }
        }

        public List<BEDocumentLine> DXP_GET_GUIA_LLAMADA(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_GUIA_LLAMADA(obep))
            {
                var olst = new List<BEDocumentLine>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocumentLine>(odr);
                Dispose(false);
                return (olst);
            }
        }




        public List<BEDocumentLine> Get_DS_OSCSP_SRCH_PCH1(BEParameters obep)
        {
            using (var odr = oda.Get_DS_OSCSP_SRCH_PCH1(obep))
            {
                var olst = new List<BEDocumentLine>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocumentLine>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocument> Get_DS_OSCSP_SRCH_ORDR(BEParameters obep)
        {
            using (var odr = oda.Get_DS_OSCSP_SRCH_ORDR(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocument> Get_DS_OSCSP_SRCH_OPOR(BEParameters obep)
        {
            using (var odr = oda.Get_DS_OSCSP_SRCH_OPOR(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocument> Get_DS_OSCSP_SRCH_OPOR2(BEParameters obep)
        {
            using (var odr = oda.Get_DS_OSCSP_SRCH_OPOR2(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocument> Get_DS_OSCSP_SRCH_OPDN(BEParameters obep)
        {
            using (var odr = oda.Get_DS_OSCSP_SRCH_OPDN(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocument> Get_DS_OSCSP_SRCH_OQUT(BEParameters obep)
        {
            using (var odr = oda.Get_DS_OSCSP_SRCH_OQUT(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        #endregion

        public List<BEDocument> DXP_GET_FACTURAS_PROVEEDORES(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_FACTURAS_PROVEEDORES(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocument> DXP_GET_PAGOF(BEParameters obep)
        {
            using (var odr = oda.DXP_PAGOSEFECTUADOS(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public void CancelPaymentEfectuado(BEDocument obj, object objs)
        {
            oda.CancelPaymentPagoEfectuado(obj, objs);
            Dispose(false);
        }
        public void SavePaymentPagoEfectuado(BEDocument obj, object objs)
        {
            oda.SavePaymentPagoEfectuado(obj, objs);
            Dispose(false);
        }
        public void DXP_INSERT_VISTA_POR_USUARIO(BEParameters obep)
        {
            oda.DXP_INSERT_VISTA_POR_USUARIO(obep);
        }
        public List<BEParameters> VISTAS()
        {
            using (var odr = oda.VISTAS())
            {
                var olst = new List<BEParameters>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEParameters>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public void EDIT_PERMISOS(BEParameters obep)
        {
            oda.EDIT_PERMISOS(obep);
        }
        //!+ DOCUMENTOS DE VENTA
        /// <summary>
        /// LISTA LOS TIPOS DE DOCUMENTOS DE VENTA
        /// </summary>
        /// <returns></returns>
        /// 
        public List<BEParameters> USUARIOS(BEParameters obep)
        {
            using (var odr = oda.USUARIOS(obep))
            {
                var olst = new List<BEParameters>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEParameters>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEParameters> PERMISOS(BEParameters obep)
        {
            using (var odr = oda.PERMISOS(obep))
            {
                var olst = new List<BEParameters>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEParameters>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BECuentasPago> DXP_GET_CUENTASGENERAL(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_CUENTASGENERAL(obep))
            {
                var olst = new List<BECuentasPago>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BECuentasPago>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocument> DXP_GET_PAGOR(BEParameters obep)
        {
            using (var odr = oda.DXP_PAGOSRECIBIDOS(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEParameters> DXP_VALORES_GESTIONBANCOS(BEParameters obep)
        {
            using (var odr = oda.DXP_VALORES_GESTIONBANCOS(obep))
            {
                var olst = new List<BEParameters>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEParameters>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public void SavePayment2(BEDocument obj, object objs)
        {
            oda.SavePaymentPagoRecibido(obj, objs);
            Dispose(false);
        }


        public void GUARDAR_ONU_SAP(BEParameters obj, object objs)
        {
            oda.GUARDAR_ONU_SAP(obj, objs);
            Dispose(false);
        }






        public void CancelPayment(BEDocument obj, object objs)
        {
            oda.CancelPaymentPagoRecibido(obj, objs);
            Dispose(false);
        }
        public List<BEDocument> DXP_GET_FACTURAS(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_FACTURAS(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocumentType> Get_OSCSP_TPDOVE(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_TPDOVE(obep))
            {
                var olst = new List<BEDocumentType>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocumentType>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocumentType> Get_OSCSP_TPDOVE_2(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_TPDOVE_2(obep))
            {
                var olst = new List<BEDocumentType>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocumentType>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BECuentasPago> DXP_CUENTAS_PAGO(BEParameters obep)
        {
            using (var odr = oda.DXP_CUENTAS_PAGO(obep))
            {
                var olst = new List<BECuentasPago>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BECuentasPago>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEBusinessPartner> DXP_GET_TECNICOAUX(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_TECNICOAUX(obep))
            {
                var olst = new List<BEBusinessPartner>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEBusinessPartner>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEAsiento> DXP_GET_CUENTAS_ASIENTO(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_CUENTAS_ASIENTO(obep))
            {
                var olst = new List<BEAsiento>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEAsiento>(odr);
                Dispose(false);
                return (olst);
            }
        }
       
        public List<BEAsiento> DXP_GET_PROYECTO(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_PROYECTO(obep))
            {
                var olst = new List<BEAsiento>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEAsiento>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEContratos> DXP_GET_CONTRATOS(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_CONTRATOS(obep))
            {
                var olst = new List<BEContratos>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEContratos>(odr);
                Dispose(false);
                return (olst);
            }
            
        }
        public List<BETipoCambio> DXP_GET_TIPOCAMBIO(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_TIPOCAMBIO(obep))
            {
                var olst = new List<BETipoCambio>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BETipoCambio>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEParameters> DXP_GET_URL_FORMATOIMPRESION(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_URL_FORMATOIMPRESION(obep))
            {
                var olst = new List<BEParameters>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEParameters>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocumentLine> DXP_GETDETALLE_BORRADOR_OV(BEParameters obep)
        {
            using (var odr = oda.DXP_GETDETALLE_BORRADOR_OV(obep))
            {
                var olst = new List<BEDocumentLine>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocumentLine>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BECuentasPago> GET_CUENTAS_PAGO(BEParameters obep)
        {
            using (var odr = oda.GET_CUENTAS_PAGO(obep))
            {
                var olst = new List<BECuentasPago>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BECuentasPago>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEAnticipos> GET_ANTICIPOS(BEParameters obep)
        {
            using (var odr = oda.GET_ANTICIPOS(obep))
            {
                var olst = new List<BEAnticipos>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEAnticipos>(odr);
                Dispose(false);
                return (olst);
            }
        }
        //OLENKA MIKROT
        public List<BEAbonado> DXP_GET_ISP_REGISTRO(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_ISP_REGISTRO(obep))
            {
                var olst = new List<BEAbonado>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEAbonado>(odr);
                Dispose(false);
                return (olst);
            }

        }

        public List<BEOnu> DXP_GET_REGISTROONUS(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_REGISTROONUS(obep))
            {
                var olst = new List<BEOnu>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEOnu>(odr);
                Dispose(false);
                return (olst);
            }

        }





        public List<BEDocument> DXP_GET_TRANSTOCK(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_TRANSTOCK(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocumentLine> DXP_GET_TRANSTOCK_DETALLE(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_TRANSTOCK_DETALLE(obep))
            {
                var olst = new List<BEDocumentLine>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocumentLine>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public void SaveTransferenciaStock(BEDocument obj, object objs)
        {
            oda.SaveTransferenciaStock(obj, objs);
            Dispose(false);
        }
        //OLENKA MIKROT HIRTORICO
        public List<BEAbonado> HISTORICO_ABONADO(BEParameters obep)
        {
            using (var odr = oda.HISTORICO_ABONADO(obep))
            {
                var olst = new List<BEAbonado>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEAbonado>(odr);
                Dispose(false);
                return (olst);
            }

        }

        public List<BEOnu> LEER_ONUS_REGISTRAR(BEParameters obep)
        {

            var olst = new List<BEOnu>();
            DADocument dad = new DADocument();
            olst= dad.LEER_ONUS_REGISTRAR(obep);
            
            Dispose(false);
            return (olst);
        
        }







        //OLENKA
        public List<BEAbonado> DXP_GET_ISP_REGISTROTMP(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_ISP_REGISTROTMP(obep))
            {
                var olst = new List<BEAbonado>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEAbonado>(odr);
                Dispose(false);
                return (olst);
            }

        }


        public List<BEAbonado> DXP_GET_ISP_INFILTRADOS(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_ISP_INFILTRADOS(obep))
            {
                var olst = new List<BEAbonado>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEAbonado>(odr);
                Dispose(false);
                return (olst);
            }

        }


        //OLENKA
        public List<BETipoPlan> GET_TIPOPLAN(BEParameters obep)
        {
            using (var odr = oda.DXP_IP_POOL(obep))
            {
                var olst = new List<BETipoPlan>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BETipoPlan>(odr);
                Dispose(false);
                return (olst);
            }
        }


        public List<BETipoPlan> DXP_IP_PLAN_ONU(BEParameters obep)
        {
            using (var odr = oda.DXP_IP_PLAN_ONU(obep))
            {
                var olst = new List<BETipoPlan>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BETipoPlan>(odr);
                Dispose(false);
                return (olst);
            }
        }

        public void Leer_Mikrotik_Abonados(BEParameters obj,object objs)
        {
            oda.Leer_Mikrotik_Abonados(obj,objs);
            Dispose(false);
        }

        public void ACTUALIZAR_DEUDAS_ABONADO(BEParameters obep, object objs)
        {
            oda.ACTUALIZAR_DEUDAS_ABONADO(obep,objs);
            Dispose(false);
        }

        public void ACTUALIZAR_ONUSAP(BEParameters obep, object objs)
        {
            oda.ACTUALIZAR_ONUSAP(obep, objs);
            Dispose(false);
        }
        public void ONU_DELETE(BEParameters obep, object objs)
        {
            oda.ONU_DELETE(obep, objs);
            Dispose(false);
        }
        public string DXP_VAL_LLAMADA_ENTREGA(BEParameters obj)
        {
            var msj = oda.DXP_VAL_LLAMADA_ENTREGA(obj);
            return msj;
        }

        //PENDIENTES
        public string MikrotikPendientes(BEAbonado obj, Object objs)
        {
            var msj = oda.MikrotikPendientes(obj, objs);
            return msj;
        }

        public string  Enviar_pendientes(BEParameters obj, Object objs)
        {
            var msj=oda.Enviar_pendientes(obj, objs);
            return msj;
           
        }




        public List<BETarjetaEquipo> DXP_GET_TARJETAEQUIPO(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_TARJETAEQUIPO(obep))
            {
                var olst = new List<BETarjetaEquipo>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BETarjetaEquipo>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BELlamadaServicio> DXP_GET_SERVICIO_TJ(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_SERVICIO_TJ(obep))
            {
                var olst = new List<BELlamadaServicio>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BELlamadaServicio>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public void UpdateMikrotikAbonado(BEAbonado objs, object obj)
        {
            oda.UpdateMikrotikAbonado(objs, obj);
            Dispose(false);
        }

        public void Leer_Mikrotik_Active(BEParameters objs, object obj)
        {
            oda.Leer_Mikrotik_Active(objs, obj);
            Dispose(false);
        }

        public List<BEAbonado> Leer_Mikrotik_Consumos(BEParameters obep)
        {
         
                BEAbonado abo = new BEAbonado();
                abo = oda.Leer_Mikrotik_Consumos(obep);
                var olst = new List<BEAbonado>();
                BEAbonado abo1 = new BEAbonado()
               {
                 U_DXP_ABONADO=abo.U_DXP_ABONADO,
                 Tx=abo.Tx,
                 Rx=abo.Rx,
                 FPTx=abo.FPTx,
                 FPRx=abo.FPRx,
               };
                 olst.Add(abo1);
  
                 Dispose(false);
                 return (olst);
            
        }



        public List<BEAbonado> Leer_Mikrotik_ConsumosXAbonado(BEParameters obep)
        {

            BEAbonado abo = new BEAbonado();
            abo = oda.Leer_Mikrotik_ConsumosXAbonado(obep);
            var olst = new List<BEAbonado>();
            BEAbonado abo1 = new BEAbonado()
            {
                U_DXP_ABONADO = abo.U_DXP_ABONADO,
                Tx = abo.Tx,
                Rx = abo.Rx,
                FPTx = abo.FPTx,
                FPRx = abo.FPRx,
            };
            olst.Add(abo1);

            Dispose(false);
            return (olst);

        }



        /// <summary>
        /// LISTA DATOS INICIALES
        /// </summary>
        /// <param name="obep"></param>
        /// <returns></returns>
        public List<BEInitialData> Get_OSCSP_DAIN(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_DAIN(obep))
            {
                var olst = new List<BEInitialData>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEInitialData>(odr);
                Dispose(false);
                return (olst);
            }
        }

        /// <summary>
        /// LISTA DATOS INICIALES MIKROTIK
        /// </summary>
        /// <param name="obep"></param>
        /// <returns></returns>
        public List<BEInitialData> GET_VALORES_MK(BEParameters obep)
        {
            using (var odr = oda.GET_VALORES_MK(obep))
            {
                var olst = new List<BEInitialData>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEInitialData>(odr);
                Dispose(false);
                return (olst);
            }
        }

        public List<BEInitialData> GET_VALORES_ON(BEParameters obep)
        {
            using (var odr = oda.GET_VALORES_ON(obep))
            {
                var olst = new List<BEInitialData>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEInitialData>(odr);
                Dispose(false);
                return (olst);
            }
        }

        public List<BEInitialData> GET_RECURSOS(BEParameters obep)
        {
            using (var odr = oda.GET_RECURSOS(obep))
            {
                var olst = new List<BEInitialData>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEInitialData>(odr);
                Dispose(false);
                return (olst);
            }
        }





        public List<BEPrice> GET_PRICELIST(BEParameters obep)
        {
            using (var odr = oda.GET_PRICELIST(obep))
            {
                var olst = new List<BEPrice>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEPrice>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA DE CODIGO DE USUARIO
        /// </summary>
        /// <param name="obep"></param>
        /// <returns></returns>
        public List<BEInitialData> Get_SP_CODIGO_USUARIO(BEParameters obep)
        {
            using (var odr = oda.Get_SP_CODIGO_USUARIO(obep))
            {
                var olst = new List<BEInitialData>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEInitialData>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA DEPARTAMENTO,PROVINCIA,DISTRITO
        /// </summary>
        /// <param name="obep"></param>
        /// <returns></returns>
        public List<BEInitialData> Get_SP_LIST_DIST(BEParameters obep)
        {
            using (var odr = oda.Get_SP_LIST_DIST(obep))
            {
                var olst = new List<BEInitialData>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEInitialData>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA LOS CLIENTES
        /// </summary>
        /// <returns></returns>
        public List<BEClient> Get_OSCSP_OCRD(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_OCRD(obep))
            {
                var olst = new List<BEClient>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEClient>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEClient> Get_OSCSP_OCRD_P(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_OCRD_P(obep))
            {
                var olst = new List<BEClient>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEClient>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA LAS DIRECCIONES DEL CLIENTE SELECIONADO
        /// </summary>
        /// <returns></returns>
        public List<BEClientAddress> Get_OSCSP_CRD1(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_CRD1(obep))
            {
                var olst = new List<BEClientAddress>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEClientAddress>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEContactLines> Get_Contact_Person(BEParameters obep)
        {
            using (var odr = oda.Get_Contact_Person(obep))
            {
                var olst = new List<BEContactLines>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEContactLines>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public void DeletePendientes(BEAbonado obj, object objs)
        {
            oda.DeletePendientes(obj, objs);
            Dispose(false);
        }



        //PENDIENTES MIKROTIK
        public void CRUD_PENDIENTES(BEParameters obj)
        {
            oda.CRUD_PENDIENTES(obj);
            Dispose(false);
        }

        public void DXP_UPDATE_CRUDINFILTRADOS(BEAbonado obj)
        {
            oda.DXP_UPDATE_CRUDINFILTRADOS(obj);
            Dispose(false);
        }
        /// <summary>
        /// LISTA LOS PRODUCTOS
        /// </summary>
        /// <returns></returns>
        public List<BEProduct> Get_OSCSP_OITM(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_OITM(obep))
            {
                var olst = new List<BEProduct>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEProduct>(odr);
                Dispose(false);
                return (olst);
            }
        }

        public List<BEProduct> DXP_GET_ART_LLAMADA(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_ART_LLAMADA(obep))
            {
                var olst = new List<BEProduct>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEProduct>(odr);
                Dispose(false);
                return (olst);
            }
        }



        public List<BEProduct> DXP_GET_KITS(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_KITS(obep))
            {
                var olst = new List<BEProduct>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEProduct>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEProduct> DXP_GET_HIJOS_KITS(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_HIJOS_KITS(obep))
            {
                var olst = new List<BEProduct>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEProduct>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEProduct> DXP_GET_ITEM_SEGUN_ALMACEN(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_ITEM_SEGUN_ALMACEN(obep))
            {
                var olst = new List<BEProduct>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEProduct>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEProduct> Get_OSCSP_OITM_P(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_OITM_P(obep))
            {
                var olst = new List<BEProduct>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEProduct>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEProduct> GET_CUENTA_MAYOR(BEParameters obep)
        {
            using (var odr = oda.GET_CUENTA_MAYOR(obep))
            {
                var olst = new List<BEProduct>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEProduct>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEProduct> GET_SERIES_USADAS(BEParameters obep)
        {
            using (var odr = oda.GET_SERIES_USADAS(obep))
            {
                var olst = new List<BEProduct>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEProduct>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEProduct> GET_LOTES_USADAS(BEParameters obep)
        {
            using (var odr = oda.GET_LOTES_USADAS(obep))
            {
                var olst = new List<BEProduct>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEProduct>(odr);
                Dispose(false);
                return (olst);
            }
        }



        public String REGISTRAR_ONUS(BEParameters obep, BEOnu abo)
        {
            var osl = oda.REGISTRAR_ONUS(obep,abo);
            Dispose(false);
            return (osl);
        }

        public String BAJA_ONU(BEParameters obep, BEOnu abo)
        {
            var osl = oda.BAJA_ONU(obep, abo);
            Dispose(false);
            return (osl);
        }


        public List<BEProduct> DXP_GET_CARDS(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_CARDS(obep))
            {
                var olst = new List<BEProduct>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEProduct>(odr);
                Dispose(false);
                return (olst);
            }

        }
        public List<BEParameters> GET_VALORES_SERVICIO(BEParameters obep)
        {
            using (var odr = oda.GET_VALORES_SERVICIO(obep))
            {
                var olst = new List<BEParameters>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEParameters>(odr);
                Dispose(false);
                return (olst);
            }
        }

        public List<BEParameters> DXP_GET_VALORES_ASIENTO(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_VALORES_ASIENTO(obep))
            {
                var olst = new List<BEParameters>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEParameters>(odr);
                Dispose(false);
                return (olst);
            }
        }


        public List<BELlamadaServicio> DXP_GET_SERVICIO(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_SERVICIO(obep))
            {
                var olst = new List<BELlamadaServicio>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BELlamadaServicio>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public void SaveService(BELlamadaServicio obj, object objs)
        {
            oda.SaveService(obj, objs);
            Dispose(false);
        }
        public void SaveRecon(BEDocument obj, object objs)
        {
            oda.SaveRecon(obj, objs);
            Dispose(false);
        }
        public List<BEDocument> DXP_GET_SALDOS(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_SALDOS(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public void SaveAsiento(BEAsiento obj, object objs)
        {
            oda.SaveAsiento(obj, objs);
            Dispose(false);
        }
        public void UpdtService(BELlamadaServicio obj, object objs)
        {
            oda.UpdtService(obj, objs);
            Dispose(false);
        }

        public void UpdtAsiento(BEAsiento obj, object objs)
        {
            oda.UpdtAsiento(obj, objs);
            Dispose(false);
        }
        public void SaveTarjeta(BETarjetaEquipo obj, object objs)
        {
            oda.SaveTarjeta(obj, objs);
            Dispose(false);
        }
        public void UpdtTarjeta(BETarjetaEquipo obj, object objs)
        {
            oda.UpdtTarjeta(obj, objs);
            Dispose(false);
        }
        public List<BEProduct> GET_LOTES_USADAS_COMPRAS(BEParameters obep)
        {
            using (var odr = oda.GET_LOTES_USADAS_COMPRAS(obep))
            {
                var olst = new List<BEProduct>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEProduct>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEProduct> GET_SERIES_USADAS_COMPRAS(BEParameters obep)
        {
            using (var odr = oda.GET_SERIES_USADAS_COMPRAS(obep))
            {
                var olst = new List<BEProduct>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEProduct>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEProduct> Get_SerialNumber(BEParameters obep)
        {
            using (var odr = oda.Get_SerialNumber(obep))
            {
                var olst = new List<BEProduct>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEProduct>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BELotes> Get_LotesNumber(BEParameters obep)
        {
            using (var odr = oda.Get_LotesNumber(obep))
            {
                var olst = new List<BELotes>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BELotes>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEProduct> Get_ListdeMateriales(BEParameters obep)
        {
            using (var odr = oda.Get_ListadeMateriales(obep))
            {
                var olst = new List<BEProduct>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEProduct>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEClientAddress> GET_PROVINCIAS(BEParameters obep)
        {
            using (var odr = oda.GET_PROVINCIAS(obep))
            {
                var olst = new List<BEClientAddress>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEClientAddress>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEClientAddress> GET_DISTRITOS(BEParameters obep)
        {
            using (var odr = oda.GET_DISTRITOS(obep))
            {
                var olst = new List<BEClientAddress>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEClientAddress>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEClientAddress> GET_URBANIZACIONES(BEParameters obep)
        {
            using (var odr = oda.GET_URBANIZACIONES(obep))
            {
                var olst = new List<BEClientAddress>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEClientAddress>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEClientAddress> GET_DEPARTAMENTOS(BEParameters obep)
        {
            using (var odr = oda.GET_DEPARTAMENTOS(obep))
            {
                var olst = new List<BEClientAddress>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEClientAddress>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEClientAddress> GET_GABINETES(BEParameters obep)
        {
            using (var odr = oda.GET_GABINETES(obep))
            {
                var olst = new List<BEClientAddress>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEClientAddress>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEParameters> GET_VALORES_ARTICULOS(BEParameters obep)
        {
            using (var odr = oda.GET_VALORES_ARTICULOS(obep))
            {
                var olst = new List<BEParameters>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEParameters>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEParameters> DXP_GET_GRUPO_ARTICULOS(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_GRUPO_ARTICULOS(obep))
            {
                var olst = new List<BEParameters>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEParameters>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEParameters2> GET_ARTICULOS_V(BEParameters2 obep)
        {
            using (var odr = oda.GET_ARTICULOS_VALORES(obep))
            {
                var olst = new List<BEParameters2>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEParameters2>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEBusinessPartner> GET_CLIENTES_GENERAL(BEParameters obep)
        {
            using (var odr = oda.GET_CLIENTES(obep))
            {
                var olst = new List<BEBusinessPartner>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEBusinessPartner>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEContactLines> GET_CLIENTES_CONTACTOS(BEParameters obep)
        {
            using (var odr = oda.GET_CLIENTES(obep))
            {
                var olst = new List<BEContactLines>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEContactLines>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEClientAddress> GET_CLIENTES_DIRECCIONES(BEParameters obep)
        {
            using (var odr = oda.GET_CLIENTES(obep))
            {
                var olst = new List<BEClientAddress>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEClientAddress>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEProduct> GET_ARTICULOS_GENERAL(BEParameters obep)
        {
            using (var odr = oda.GET_ARTICULOS(obep))
            {
                var olst = new List<BEProduct>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEProduct>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEGrupoArt> DXP_GET_GRUPO_ART(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_GRUPO_ART(obep))
            {
                var olst = new List<BEGrupoArt>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEGrupoArt>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEAlmacen> GET_ARTICULOS_Almacen(BEParameters obep)
        {
            using (var odr = oda.GET_ARTICULOS(obep))
            {
                var olst = new List<BEAlmacen>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEAlmacen>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEPrice> GET_ARTICULOS_PRECIOS(BEParameters obep)
        {
            using (var odr = oda.GET_ARTICULOS(obep))
            {
                var olst = new List<BEPrice>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEPrice>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA SOLO DISTRITO
        /// </summary>
        /// <param name="obep"></param>
        /// <returns></returns>
        public List<BEInitialData> Get_SP_LIST_DIST_PROV(BEParameters obep)
        {
            using (var odr = oda.Get_SP_LIST_DIST_PROV(obep))
            {
                var olst = new List<BEInitialData>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEInitialData>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// Listar Tipo de Cliente
        /// </summary>
        /// <param name="obep"></param>
        /// <returns></returns>
        public List<BEInitialData> GET_SP_TIP_CLIE(BEParameters obep)
        {
            using (var odr = oda.GET_SP_TIP_CLIE(obep))
            {
                var olst = new List<BEInitialData>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEInitialData>(odr);
                Dispose(false);
                return (olst);
            }
        }

        /// <summary>
        /// LISTA LOS PRODUCTOS NAIAH
        /// </summary>
        /// <returns></returns>
        public List<BEProduct> Get_OSCSP_OITM_NAIAH(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_OITM_NAIAH(obep))
            {
                var olst = new List<BEProduct>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEProduct>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA LOS KITS
        /// </summary>
        /// <returns></returns>
        public List<BEProduct> Get_OSCSP_KITS(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_KITS(obep))
            {
                var olst = new List<BEProduct>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEProduct>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA LOS KITS NAIAH
        /// </summary>
        /// <returns></returns>
        public List<BEProduct> Get_OSCSP_KITS_NAIAH(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_KITS_NAIAH(obep))
            {
                var olst = new List<BEProduct>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEProduct>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA LOS KITS NAIAH_cod
        /// </summary>
        /// <returns></returns>
        public List<BEProduct> OSCSP_KITS_NAIAH_Cod(BEParameters obep)
        {
            using (var odr = oda.OSCSP_KITS_NAIAH_Cod(obep))
            {
                var olst = new List<BEProduct>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEProduct>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA LOS DOCUMENTOS DE VENTA
        /// </summary>
        /// <returns></returns>
        public List<BEDocument> Get_OSCSP_SRCH_OINV(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_OINV(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }

        public List<BEAsiento> Get_OSCSP_SRCH_OJDT(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_OJDT(obep))
            {
                var olst = new List<BEAsiento>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEAsiento>(odr);
                Dispose(false);
                return (olst);
            }
        }



        public List<BEDocument> Get_OSCSP_SRCH_OINV_RESERVA(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_OINV_RESERVA(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocument> Get_OSCSP_SRCH_ODPI(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_ODPI(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocument> Get_OSCSP_SRCH_OPCH(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_OPCH(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA EL DETALLE DE LOS DOCUMENTOS DE VENTA
        /// </summary>
        /// <returns></returns>
        public List<BEDocumentLine> Get_OSCSP_SRCH_INV1(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_INV1(obep))
            {
                var olst = new List<BEDocumentLine>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocumentLine>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocumentLine> Get_OSCSP_SRCH_DPI1(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_DPI1(obep))
            {
                var olst = new List<BEDocumentLine>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocumentLine>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocumentLine> Get_OSCSP_SRCH_PCH1(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_PCH1(obep))
            {
                var olst = new List<BEDocumentLine>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocumentLine>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA LAS TARJETAS DE CREDITO
        /// </summary>
        /// <returns></returns>
        public List<BECreditTarject> Get_OSCSP_OCRC(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_OCRC(obep))
            {
                var olst = new List<BECreditTarject>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BECreditTarject>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEAlmacen> Get_OSCSP_OWHS(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_OWHS(obep))
            {
                var olst = new List<BEAlmacen>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEAlmacen>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEWhsCode> Get_OSCSP_OITW(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_OITW(obep))
            {
                var olst = new List<BEWhsCode>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEWhsCode>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA LAS NOTAS DE CREDITO
        /// </summary>
        /// <returns></returns>
        public List<BEDocument> Get_OSCSP_SRCH_ORIN(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_ORIN(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocument> Get_OSCSP_SRCH_ORPC(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_ORPC(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA EL DETALLE DE LAS NOTAS DE CREDITO
        /// </summary>
        /// <returns></returns>
        public List<BEDocumentLine> Get_OSCSP_SRCH_RIN1(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_RIN1(obep))
            {
                var olst = new List<BEDocumentLine>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocumentLine>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocumentLine> Get_OSCSP_SRCH_RPC1(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_RPC1(obep))
            {
                var olst = new List<BEDocumentLine>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocumentLine>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA LOS DOCUMENTOS DE ENTREGA
        /// </summary>
        /// <returns></returns>
        public List<BEDocument> Get_OSCSP_SRCH_ODLN(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_ODLN(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocument> Get_OSCSP_SRCH_OPDN(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_OPDN(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA EL DETALLE DE LOS DOCUMENTOS DE ENTREGA
        /// </summary>
        /// <returns></returns>
        public List<BEDocumentLine> Get_OSCSP_SRCH_DLN1(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_DLN1(obep))
            {
                var olst = new List<BEDocumentLine>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocumentLine>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocumentLine> Get_OSCSP_SRCH_PDN1(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_PDN1(obep))
            {
                var olst = new List<BEDocumentLine>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocumentLine>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// Validacion de Correlativo
        /// </summary>
        /// <param name="obep"></param>
        /// <returns></returns>
        public List<BEValidarCorrelativo> Get_ValidarCorrelativo(BEParameters obep,string corre)
        {
            using (var odr = oda.Get_ValidarCorrelativo(obep, corre))
            {
                var olst = new List<BEValidarCorrelativo>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEValidarCorrelativo>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public void SaveItems(BEProduct obj, object objs)
        {
            oda.SaveItems(obj, objs);
            Dispose(false);
        }
        public void SaveKits(BEProduct obj, object objs)
        {
            oda.SaveListaMateriales(obj, objs);
            Dispose(false);
        }
        public void UpdateKits(BEProduct obj, object objs)
        {
            oda.UpdateKits(obj, objs);
            Dispose(false);
        }
        public void UpdateItems(BEProduct obj, object objs)
        {
            oda.UpdateItems(obj, objs);
            Dispose(false);
        }
        public void SaveCurrencyDates(BETipoCambio obj, object objs)
        {
            oda.SaveCurrencyDates(obj, objs);
            Dispose(false);
        }
        /// <summary>
        /// GUARDA EL CLIENTE
        /// </summary>
        /// <param name="obj"></param>
        /// <param name="objs"></param>
        public void SaveBusinessPartner(BEBusinessPartner obj, object objs)
        {
            oda.SaveBusinessPartner(obj, objs);
            Dispose(false);
        }
        public void UpdateBusinessPartner(BEBusinessPartner obj, object objs)
        {
            oda.UpdateBusinessPartner(obj, objs);
            Dispose(false);
        }
        /// <summary>
        /// Guardar Cliente Naiah
        /// </summary>
        /// <param name="obj"></param>
        /// <param name="objs"></param>
        public void SaveBusinessPartnerNaiah(BEBusinessPartner obj, object objs)
        {
            oda.SaveBusinessPartnerNaiah(obj, objs);
            Dispose(false);
        }
        /// <summary>
        /// GUARDA DOCUMENTOS DE VENTA
        /// </summary>
        /// <param name="obj"></param>
        /// <param name="objs"></param>
        public void SaveInvoice(BEDocument obj, object objs) 
        {
            oda.SaveInvoice(obj, objs);
            Dispose(false);
        }
        public void SaveDownPayment(BEDocument obj, object objs)
        {
            oda.SaveDownPayment(obj, objs);
            Dispose(false);
        }
        public void SaveUdt(BEDocument obj, object objs)
        {
            oda.SaveUdt(obj, objs);
            Dispose(false);
        }
        /// <summary>
        /// GUARDA EL PAGO DEL DOCUMENTO DE VENTA
        /// </summary>
        /// <param name="obj"></param>
        /// <param name="objs"></param>
        public void SavePayment(BEDocument obj, object objs)
        {
            oda.SavePayment(obj, objs);
            Dispose(false);
        }
        public void SaveVendorPayment(BEDocument obj, object objs)
        {
            oda.SaveVendorPayment(obj, objs);
            Dispose(false);
        }
        /// <summary>
        /// GUARDA LA NOTA DE CREDITO
        /// </summary>
        /// <param name="obj"></param>
        /// <param name="objs"></param>
        public void SaveCreditNote(BEDocument obj, object objs)
        {
            oda.SaveCreditNote(obj, objs);
            Dispose(false);
        }
        public void SavePurchaseCreditNote(BEDocument obj, object objs)
        {
            oda.SavePurchaseCreditNote(obj, objs);
            Dispose(false);
        }
        /// <summary>
        /// GUARDA EL DOCUMENTO DE ENTREGA
        /// </summary>
        /// <param name="obj"></param>
        /// <param name="objs"></param>
        public void SaveDeliveryNote(BEDocument obj, object objs)
        {
            oda.SaveDeliveryNote(obj, objs);
            Dispose(false);
        }
        public void SaveDeliveryNote2(BEDocument obj, object objs)
        {
            oda.SaveDeliveryNote2(obj, objs);
            Dispose(false);
        }
        public int DXP_GETO_BORRADOR_OV(BEParameters obep)
        {
            var emid = oda.DXP_GETO_BORRADOR_OV(obep);
            Dispose(false);
            return (emid);
        }
        public void SaveDraft(BEDocument obj, object objs, int objType)
        {
            oda.SaveDraft(obj, objs, objType);
            Dispose(false);
        }
        public void SavePurchaseDeliveryNote(BEDocument obj, object objs)
        {
            oda.SavePurchaseDeliveryNote(obj, objs);
            Dispose(false);
        }
        public void SavePurchaseInvoice(BEDocument obj, object objs)
        {
            oda.SavePurchaseInvoice(obj, objs);
            Dispose(false);
        }

        //!+ ORDEN DE VENTA Y COTIZACIÓN
        /// <summary>
        /// LISTA MATERIA PRIMA Y ENVASES
        /// </summary>
        /// <returns></returns>
        public List<BEProduct> Get_OSCSP_MAEN(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_MAEN(obep))
            {
                var olst = new List<BEProduct>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEProduct>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// FACTOR DE MULTIPLICACION
        /// </summary>
        /// <returns></returns>
        public List<BEProduct> Get_SCSP_MPFC_OITM(BEParameters obep)
        {
            using (var odr = oda.Get_SCSP_MPFC_OITM(obep))
            {
                var olst = new List<BEProduct>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEProduct>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA LOS COMPONENTES DEL ENVASE PHANTOM
        /// </summary>
        /// <returns></returns>
        public List<BEQuotation18> Get_OSCSP_COPH(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_COPH(obep))
            {
                var olst = new List<BEQuotation18>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEQuotation18>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// listar el ultimo codigo de naiah
        /// </summary>
        /// <param name="obep"></param>
        /// <returns></returns>
        public List<BEInitialData>Get_sp_selCodigoNAIAH(BEParameters obep)
        {
            using (var odr = oda.Get_sp_selCodigoNAIAH(obep))
            {
                var olst = new List<BEInitialData>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEInitialData>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// listar el ultimo codigo de ruc naiah
        /// </summary>
        /// <param name="obep"></param>
        /// <returns></returns>
        public List<BEInitialData> Get_sp_selCodigoRUCNAIAH(BEParameters obep)
        {
            using (var odr = oda.Get_sp_selCodigoRUCNAIAH(obep))
            {
                var olst = new List<BEInitialData>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEInitialData>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// Guardar dni Naiah
        /// </summary>
        /// <param name="obj"></param>
        /// <param name="objs"></param>
        public void set_dninaiah(BEParameters obj)
        {
            oda.set_dninaiah(obj);
            Dispose(false);
        }
        /// <summary>
        /// Guardar Ruc Naiah
        /// </summary>
        /// <param name="obj"></param>
        public void set_rucnaiah(BEParameters obj)
        {
            oda.set_rucnaiah(obj);
            Dispose(false);
        }
        public void CRUD_CONTRATO(BEParameters obj)
        {
            oda.CRUD_CONTRATOS(obj);
            Dispose(false);
        }
        /// <summary>
        /// GUARDA LA COTIZACION DEL RP
        /// </summary>
        /// <param name="obj"></param>
        /// <param name="objs"></param>
        public void SaveQut(BEQuotation obj, object objs)
        {
            oda.SaveQut(obj, objs);
            Dispose(false);
        }
        /// <summary>
        /// BÚSCA COTIZACIONES DE RP'S SEGÚN FILTRO
        /// </summary>
        /// <returns></returns>
        public List<BEQuotation> Get_OSCSP_SRCH_QUTT(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_QUTT(obep))
            {
                var olst = new List<BEQuotation>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEQuotation>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// BÚSCA COTIZACIONES DE RP'S SEGÚN FILTRO
        /// </summary>
        /// <returns></returns>
        public BEQuotation Get_OSCSP_SRCH_QUTD(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_QUTD(obep))
            {
                var oqut = new BEQuotation();
                var iq17 = oqut.qut17;
                ((IList)iq17).LoadFromReader<BEQuotation17>(odr);

                odr.NextResult();
                var iq18 = oqut.qut18;
                ((IList)iq18).LoadFromReader<BEQuotation18>(odr);
                Dispose(false);
                return (oqut);
            }
        }
        /// <summary>
        /// PARAMETROS DE MOVILIDAD
        /// </summary>
        /// <returns></returns>
        public List<BEParMovility> Get_SCSP_LSPR_MOVI(BEParameters obep)
        {
            using (var odr = oda.Get_SCSP_LSPR_MOVI(obep))
            {
                var olst = new List<BEParMovility>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEParMovility>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// MOVILIDAD DE BELMAY
        /// </summary>
        /// <returns></returns>
        public string Get_OSCSP_MVBM(BEParameters obep)
        {
            var osl = oda.Get_OSCSP_MVBM(obep);
            Dispose(false);
            return (osl);
        }
        /// <summary>
        /// GUARDA LA ORDEN DE VENTA
        /// </summary>
        /// <param name="obj"></param>
        /// <param name="objs"></param>
        public void SaveOrderSale(BEDocument obj, object objs)
        {
            oda.SaveOrderSale(obj, objs);
            Dispose(false);
        }
        public void SavePurchaseOrder(BEDocument obj, object objs)
        {
            oda.SavePurchaseOrder(obj, objs);
            Dispose(false);
        }
        public void SaveOfertaVenta(BEDocument obj, object objs)
        {
            oda.SaveOfertaVenta(obj, objs);
            Dispose(false);
        }
        /// <summary>
        /// MODIFICA LA ORDEN DE VENTA
        /// </summary>
        /// <param name="obj"></param>
        /// <param name="objs"></param>
        public void ModifyOrderSale(BEDocument obj, object objs)
        {
            oda.ModifyOrderSale(obj, objs);
            Dispose(false);
        }
        public void ModifyOfferSale(BEDocument obj, object objs)
        {
            oda.ModifyOfferSale(obj, objs);
            Dispose(false);
        }
        public void ModifyPurchaseOrder(BEDocument obj, object objs)
        {
            oda.ModifyPurchaseOrder(obj, objs);
            Dispose(false);
        }
        /// <summary>
        /// CANCELA LA ORDEN DE VENTA
        /// </summary>
        /// <param name="obj"></param>
        /// <param name="objs"></param>
        public void CancelOrderSale(BEDocument obj, object objs)
        {
            oda.CancelOrderSale(obj, objs);
            Dispose(false);
        }
        public void CancelOfferSale(BEDocument obj, object objs)
        {
            oda.CancelOfferSale(obj, objs);
            Dispose(false);
        }
        public void CancelPurchaseOrder(BEDocument obj, object objs)
        {
            oda.CancelPurchaseOrder(obj, objs);
            Dispose(false);
        }
        public void CancelDeliveryNote(BEDocument obj, object objs)
        {
            oda.CancelDeliveryNote(obj, objs);
            Dispose(false);
        }
        /// <summary>
        /// LISTA LAS ORDENES DE VENTA
        /// </summary>
        /// <returns></returns>
        public List<BEDocument> Get_OSCSP_SRCH_ORDR(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_ORDR(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocument> Get_OSCSP_SRCH_OQUT_OFE(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_OQUT_OFE(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocument> Get_OSCSP_SRCH_OPOR(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_OPOR(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// Lista de orden por numped
        /// </summary>
        /// <param name="obep"></param>
        /// <returns></returns>
        public List<BEDocument> Get_OSCSP_SRCH_ORDR_POR_NUMPED(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_ORDR_POR_NUMPED(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA EL DETALLE DE LAS ORDENES DE VENTA
        /// </summary>
        /// <returns></returns>
        public List<BEDocumentLine> Get_OSCSP_SRCH_RDR1(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_RDR1(obep))
            {
                var olst = new List<BEDocumentLine>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocumentLine>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocumentLine> Get_OSCSP_SRCH_QUT1_OFE(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_QUT1_OFE(obep))
            {
                var olst = new List<BEDocumentLine>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocumentLine>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocumentLine> Get_OSCSP_SRCH_POR1(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_POR1(obep))
            {
                var olst = new List<BEDocumentLine>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocumentLine>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA LAS COTIZACIONES PARA GENERAR LA OFERTA DE VENTA
        /// </summary>
        /// <returns></returns>
        public List<BEQuotation> Get_OSCSP_LGOV(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_LGOV(obep))
            {
                var olst = new List<BEQuotation>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEQuotation>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA LAS ORDENES DE VENTA ABIERTAS RP'S
        /// </summary>
        /// <returns></returns>
        public List<BEDocument> Get_OSCSP_SRCH_BORD(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_BORD(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA EL DETALLE DE LAS ORDENES DE VENTA ABIERTAS RP'S
        /// </summary>
        /// <returns></returns>
        public List<BEDocumentLine> Get_OSCSP_SRCH_BOR1(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_BOR1(obep))
            {
                var olst = new List<BEDocumentLine>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocumentLine>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// Retorno de Descuento
        /// </summary>
        /// <param name="obep"></param>
        /// <returns></returns>
        public List<BEDscto> Get_DSCTO(BEParameters obep)
        {
            using (var odr = oda.Get_DSCTO(obep))
            {
                var olst = new List<BEDscto>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDscto>(odr);
                Dispose(false);
                return (olst);
            }
        }
    
        /// <summary>
        /// GUARDA LA OFERTA DE VENTA DE RPS
        /// </summary>
        /// <param name="obj"></param>
        /// <param name="objs"></param>
        public void SaveOfferSale(BEQuotation obj, List<BEQuotation> qlst, object objs)
        {
            oda.SaveOfferSale(obj, qlst, objs);
            Dispose(false);
        }
        /// <summary>
        /// LISTA LAS OFERTAS
        /// </summary>
        /// <returns></returns>
        public List<BEDocument> Get_OSCSP_SRCH_OQUT(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_OQUT(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocument> Get_OSCSP_SRCH_ORDR2(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_ORDR2(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocument> Get_OSCSP_SRCH_OPOR2(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_OPOR2(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocument> Get_OSCSP_SRCH_ODLN2(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_ODLN2(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocument> Get_OSCSP_SRCH_OPDN2(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_OPDN2(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocumentLine> Get_OSCSP_SRCH_DLN12(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_DLN12(obep))
            {
                var olst = new List<BEDocumentLine>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocumentLine>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocumentLine> Get_OSCSP_SRCH_PDN12(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_PDN12(obep))
            {
                var olst = new List<BEDocumentLine>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocumentLine>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA LAS COTIZACIONES PARA GENERAR LA OFERTA DE VENTA
        /// </summary>
        /// <returns></returns>
        public List<BEDocumentLine> Get_OSCSP_SRCH_QUT1(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_QUT1(obep))
            {
                var olst = new List<BEDocumentLine>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocumentLine>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocumentLine> Get_OSCSP_SRCH_RDR12(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_RDR12(obep))
            {
                var olst = new List<BEDocumentLine>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocumentLine>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BEDocumentLine> Get_OSCSP_SRCH_POR12(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_SRCH_POR12(obep))
            {
                var olst = new List<BEDocumentLine>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocumentLine>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA LOS REGALOS
        /// </summary>
        /// <returns></returns>
        public List<BEProduct> Get_SCSP_LSRG_BFREGA(BEParameters obep)
        {
            using (var odr = oda.Get_SCSP_LSRG_BFREGA(obep))
            {
                var olst = new List<BEProduct>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEProduct>(odr);
                Dispose(false);
                return (olst);
            }
        }

        //?+ REPORTES
        /// <summary>
        /// CIERRE DE CAJA
        /// </summary>
        /// <returns></returns>
        public List<BECloseBox> Get_OSCSP_RPCJ(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_RPCJ(obep))
            {
                var olst = new List<BECloseBox>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BECloseBox>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// INVENTARIO
        /// </summary>
        /// <returns></returns>
        public List<BEInventory> Get_OSCSP_RPIN(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_RPIN(obep))
            {
                var olst = new List<BEInventory>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEInventory>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA DOCUMENTOS PENDIENTES POR PAGAR
        /// </summary>
        /// <returns></returns>
        public List<BEDocument> Get_OSCSP_DVPP(BEParameters obep)
        {
            using (var odr = oda.Get_OSCSP_DVPP(obep))
            {
                var olst = new List<BEDocument>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEDocument>(odr);
                Dispose(false);
                return (olst);
            }
        }
        //Ingreso de Jose
        /// <summary>
        /// Lista de usuarios
        /// </summary>
        /// <param name="obep"></param>
        /// <returns></returns>
        public List<BEAdministrator> Get_list_user_admin()
        {
            using (var odr = oda.Get_list_user_admin())
            {
                var olst = new List<BEAdministrator>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEAdministrator>(odr);
                Dispose(false);
                return (olst);
            }
        }
        //Verifica stock en el BL010
        public int getStockAlmacen(string itemCode)
        {
            try
            {
                using (var odr = oda.getStockItemCode(itemCode))
                {
                    var olst = new List<BEDocument>();
                    var iLst = olst;
                    ((IList)iLst).LoadFromReader<BEDocument>(odr);
                    Dispose(false);
                    return (int)olst[0].Stock;
                }
            }
            finally
            {
                Dispose();
            }
        }
    }
}
