using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessEntities;
using SAPbobsCOM;

namespace DataAccess
{
    public class DASboConnect : IDisposable
    {
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
            disposed = true;
        }
        ~DASboConnect()
        {
            Dispose(false);
        }
        /// <summary>
        /// CONEXIÓN A SAP BUSINESS ONE
        /// </summary>
        /// <param name="obep"></param>
        /// <returns></returns>
        public object Get_ComConnect(BEParameters obep)
        {
            int ErrCode = 0;
            string ErrMsg = null;

            var ocp = new Company();
            ocp.Server = @obep.SRV;//PCBINFO04  SRVBFPRUEBA SRVBFDB01\SAP
            //SRVBFDB01\SAP
            ocp.DbServerType = BoDataServerTypes.dst_MSSQL2008;
            ocp.DbUserName = obep.DBUSERNAME;
            ocp.DbPassword = obep.DBPASSWORD;//S6p8x2BO84 SAPB1Admin S0p0rt3@2014
            ocp.language = BoSuppLangs.ln_Spanish_La;
            ocp.CompanyDB = obep.CompanyDB;
            ocp.UserName = obep.SAPUSERNAME;
            ocp.Password = obep.SAPPASSWORD;

            /*var ocp = new Company()
            {
                Server = @"SRV-SQL01",//PCBINFO04  SRVBFPRUEBA SRVBFDB01\SAP
                //SRVBFDB01\SAP
                DbServerType = BoDataServerTypes.dst_MSSQL2008,
                DbUserName = "sa",
                DbPassword = "MPP@SW0RD",//S6p8x2BO84 SAPB1Admin S0p0rt3@2014
                language = BoSuppLangs.ln_Spanish_La,
                CompanyDB = obep.CompanyDB,
                UserName = "manager",
                Password = "wsx.654123" 
            };*/
            ocp.Connect();
            ocp.GetLastError(out ErrCode, out ErrMsg);
            obep.Msg = ErrMsg;
            Dispose(false);
            return (ocp);
        }
        /// <summary>
        /// DESCONEXIÓN DE SAP BUSINESS ONE
        /// </summary>
        /// <param name="ocp"></param>
        public void Set_ComDisconect(object ocp)
        {
            if (((Company)ocp).Connected)
                ((Company)ocp).Disconnect();
            Dispose(false);
        }
    }
}
