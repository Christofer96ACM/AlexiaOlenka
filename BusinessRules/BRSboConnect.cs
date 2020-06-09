using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess;
using BusinessEntities;

namespace BusinessRules
{
    public class BRSboConnect : IDisposable
    {
        protected internal DASboConnect oda;
        public BRSboConnect()
        {
            oda = new DASboConnect();
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
        ~BRSboConnect()
        {
            Dispose(false);
        }
        /// <summary>
        /// CONEXIÓN A SAP BUSINESS ONE
        /// </summary>
        /// <param name="obep"></param>
        /// <returns></returns>
        public object Get_ComConnect(BEParameters osbo)
        {
            var ocp = oda.Get_ComConnect(osbo);
            Dispose(false);
            return (ocp);
        }
        /// <summary>
        /// DESCONEXIÓN DE SAP BUSINESS ONE
        /// </summary>
        /// <param name="ocp"></param>
        public void Get_ComDisconect(object ocp)
        {
            oda.Set_ComDisconect(ocp);
            Dispose(false);
        }
    }
}
