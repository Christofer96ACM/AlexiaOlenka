using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess;
using BusinessEntities;
using ResultSetMappers;

namespace BusinessRules
{
    public class BRLogin : IDisposable
    {
        protected internal DALogin oda;
        public BRLogin()
        {
            oda = new DALogin();
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
        ~BRLogin()
        {
            Dispose(false);
        }
        public List<BELogin> Get_DS_SCSP_LSPJ_OPRJ(BEParameters obep)
        {
            using (var odr = oda.Get_DS_SCSP_LSPJ_OPRJ(obep))
            {
                var olst = new List<BELogin>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BELogin>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA LOS LOCALES
        /// </summary>
        /// <returns></returns>
        public List<BELogin> Get_SCSP_LSPJ_OPRJ(BEParameters obep)
        {
            using (var odr = oda.Get_SCSP_LSPJ_OPRJ(obep))
            {
                var olst = new List<BELogin>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BELogin>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// RETORNA EL CODIGO DE EMPLEADO LOGUEADO
        /// </summary>
        /// <param name="obep"></param>
        /// <returns></returns>
        public string Get_OSCSP_IDOH(BEParameters obep)
        {
            var emid = oda.Get_OSCSP_IDOH(obep);
            Dispose(false);
            return (emid);
        }
        public List<BEParameters> GET_PERMISOS(BEParameters obep)
        {
            using (var odr = oda.GET_PERMISOS(obep))
            {
                var olst = new List<BEParameters>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEParameters>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public List<BETipoCambio> DXP_GET_RATE(BEParameters obep)
        {
            using (var odr = oda.DXP_GET_RATE(obep))
            {
                var olst = new List<BETipoCambio>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BETipoCambio>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// Validar USuario
        /// </summary>
        /// <param name="obep"></param>
        /// <returns></returns>
        public List<BEParameters> Get_val_usu(string UserName, string Socied, string Project)
        {
            using (var odr = oda.Get_val_usu(UserName,Socied,Project))
            {
                var olst = new List<BEParameters>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BEParameters>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA LOS LOCALES ValiDADOS
        /// </summary>
        /// <returns></returns>
        public List<BELocalValidar> Get_SP_LISTARLOCALVAL(BEParameters obep)
        {
            using (var odr = oda.Get_SP_LISTARLOCALVAL(obep))
            {
                var olst = new List<BELocalValidar>();
                var iLst = olst;
                
                ((IList)iLst).LoadFromReader<BELocalValidar>(odr);
                Dispose(false);
                return (olst);
            }
        }
        /// <summary>
        /// LISTA LOS LOCALES ValiDADOS para UPDATE
        /// </summary>
        /// <returns></returns>
        public List<BELocalValidar> Get_SP_VAL_UPDATE_LOCAL(BEParameters obep)
        {
            using (var odr = oda.Get_SP_VAL_UPDATE_LOCAL(obep))
            {
                var olst = new List<BELocalValidar>();
                var iLst = olst;
                ((IList)iLst).LoadFromReader<BELocalValidar>(odr);
                Dispose(false);
                return (olst);
            }
        }
        public void SET_SP_EDITAR_VALLOCAL(BEParameters obep, bool permi)
        {
            oda.SET_SP_EDITAR_VALLOCAL(obep, permi);

        }
        public void SET_SP_INSERTAR_LOCAL(BEParameters obep, bool permi)
        {
            oda.SET_SP_INSERTAR_LOCAL(obep, permi);
        }
    }
}
