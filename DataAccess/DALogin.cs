using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data;
using BusinessEntities;

namespace DataAccess
{
    public class DALogin : IDisposable
    {
        protected Database odb;
        protected DbConnection ocn;
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
                ocn.Dispose();
                ((IDisposable)odb).Dispose();
                ocn = null;
                odb = null;
            }
            disposed = true;
        }
        ~DALogin()
        {
            Dispose(false);
        }
        public IDataReader Get_DS_SCSP_LSPJ_OPRJ(BEParameters obep)
        {
            try
            {
                odb = DatabaseFactory.CreateDatabase(obep.Socied);
                ocn = odb.CreateConnection();
                if (ocn.State == ConnectionState.Closed) ocn.Open();
                var ocmd = odb.GetStoredProcCommand("DS_SCSP_LSPJ_OPRJ", obep.UserName);
                ocmd.CommandTimeout = 2000;
                var ord = odb.ExecuteReader(ocmd);
                Dispose(false);
                return (ord);
            }
            finally
            {
                ocn.Close();
            }
        }
        public IDataReader GET_PERMISOS(BEParameters obep)
        {
            try
            {
                odb = DatabaseFactory.CreateDatabase("ApplicationServices");
                ocn = odb.CreateConnection();
                if (ocn.State == ConnectionState.Closed) ocn.Open();
                var ocmd = odb.GetStoredProcCommand("DXP_GET_PERMISOS", obep.UserName, obep.Socied, obep.Project);
                ocmd.CommandTimeout = 2000;
                var ord = odb.ExecuteReader(ocmd);
                Dispose(false);
                return (ord);
            }
            finally
            {
                ocn.Close();
            }
        }
        /// <summary>
        /// LISTA LOS LOCALES
        /// </summary>
        /// <param name="obep"></param>
        /// <returns></returns>
        public IDataReader Get_SCSP_LSPJ_OPRJ(BEParameters obep)
        {
            try
            {
                odb = DatabaseFactory.CreateDatabase(obep.Socied);
                ocn = odb.CreateConnection();
                if (ocn.State == ConnectionState.Closed) ocn.Open();
                var ocmd = odb.GetStoredProcCommand("SCSP_LSPJ_OPRJ", obep.RUC);
                ocmd.CommandTimeout = 2000;
                var ord = odb.ExecuteReader(ocmd);
                Dispose(false);
                return (ord);
            }
            finally
            {
                ocn.Close();
            }
        }
        /// <summary>
        /// RETORNA EL CODIGO DE EMPLEADO LOGUEADO
        /// </summary>
        /// <param name="obep"></param>
        /// <returns></returns>
        public string Get_OSCSP_IDOH(BEParameters obep)
        {
            try
            {
                odb = DatabaseFactory.CreateDatabase(obep.Socied);
                ocn = odb.CreateConnection();
                if (ocn.State == ConnectionState.Closed) ocn.Open();
                var ocmd = odb.GetStoredProcCommand("OSCSP_IDOH", obep.UserName);
                ocmd.CommandTimeout = 2000;
                var scl = (string)odb.ExecuteScalar(ocmd);
                Dispose(false);
                return (scl);
            }
            finally
            {
                ocn.Close();
            }
        }
        public IDataReader DXP_GET_RATE(BEParameters obep)
        {
            try
            {
                odb = DatabaseFactory.CreateDatabase(obep.Socied);
                ocn = odb.CreateConnection();
                if (ocn.State == ConnectionState.Closed) ocn.Open();
                var ocmd = odb.GetStoredProcCommand("DXP_GET_RATE");
                ocmd.CommandTimeout = 2000;
                var ord = odb.ExecuteReader(ocmd);
                Dispose(false);
                return (ord);
            }
            finally
            {
                ocn.Close();
            }
        }
        /// <summary>
        ///Validar usu log
        /// </summary>
        /// <param name="obep"></param>
        /// <returns></returns>
        /// 
        public IDataReader Get_val_usu(string UserName, string Socied, string Project)
        {
            try
            {
                odb = DatabaseFactory.CreateDatabase("ApplicationServices");
                ocn = odb.CreateConnection();
                if (ocn.State == ConnectionState.Closed) ocn.Open();
                var ocmd = odb.GetStoredProcCommand("Val_Usu",UserName,Socied,Project);
                ocmd.CommandTimeout = 2000;
                var ord = odb.ExecuteReader(ocmd);
                Dispose(false);
                return (ord);
            }
            finally
            {
                ocn.Close();
            }
        }
        /// <summary>
        /// LISTA LOS LOCALES VALIDADOS POR USUARIO
        /// </summary>
        /// <param name="obep"></param>
        /// <returns></returns>
        public IDataReader Get_SP_LISTARLOCALVAL(BEParameters obep)
        {
            try
            {
                odb = DatabaseFactory.CreateDatabase("ApplicationServices");
                ocn = odb.CreateConnection();
                if (ocn.State == ConnectionState.Closed) ocn.Open();
                var ocmd = odb.GetStoredProcCommand("SP_LISTVAL",obep.UserName);
                ocmd.CommandTimeout = 2000;
                var ord = odb.ExecuteReader(ocmd);
                Dispose(false);
                return (ord);
            }
            finally
            {
                ocn.Close();
            }
        }
        /// <summary>
        /// LISTA LOS LOCALES VALIDADOS para UPDATE
        /// </summary>
        /// <param name="obep"></param>
        /// <returns></returns>
        public IDataReader Get_SP_VAL_UPDATE_LOCAL(BEParameters obep)
        {
            try
            {
                odb = DatabaseFactory.CreateDatabase("ApplicationServices");
                ocn = odb.CreateConnection();
                if (ocn.State == ConnectionState.Closed) ocn.Open();
                var ocmd = odb.GetStoredProcCommand("SP_VAL_UPDATE_LOCAL", obep.UserName,obep.Socied,obep.Project);
                ocmd.CommandTimeout = 2000;
                var ord = odb.ExecuteReader(ocmd);
                Dispose(false);
                return (ord);
            }
            finally
            {
                ocn.Close();
            }
        }
        /// <summary>
        /// Actualizar Local
        /// </summary>
        /// <param name="obep"></param>
        /// <param name="permi"></param>
        public void SET_SP_EDITAR_VALLOCAL(BEParameters obep,bool permi)
        {
            try
            {
                odb = DatabaseFactory.CreateDatabase("ApplicationServices");
                ocn = odb.CreateConnection();
                if (ocn.State == ConnectionState.Closed) ocn.Open();
                var ocmd = odb.GetStoredProcCommand("SP_EDITAR_VALLOCAL", obep.UserName,obep.Socied,obep.Project,permi);
                ocmd.CommandTimeout = 2000;
                var ord = odb.ExecuteNonQuery(ocmd);
                Dispose(false);
            }
            finally
            {
                ocn.Close();
            }
        }
        /// <summary>
        /// Insertar Local
        /// </summary>
        /// <param name="obep"></param>
        /// <param name="permi"></param>
        public void SET_SP_INSERTAR_LOCAL(BEParameters obep, bool permi)
        {
            try
            {
                odb = DatabaseFactory.CreateDatabase("ApplicationServices");
                ocn = odb.CreateConnection();
                if (ocn.State == ConnectionState.Closed) ocn.Open();
                var ocmd = odb.GetStoredProcCommand("SP_INSERTAR_LOCAL", obep.UserName, obep.Socied, obep.Project, permi);
                ocmd.CommandTimeout = 2000;
                var ord = odb.ExecuteNonQuery(ocmd);
                Dispose(false);
            }
            finally
            {
                ocn.Close();
            }
        }
    }
}
