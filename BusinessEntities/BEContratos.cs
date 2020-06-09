using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntities
{
    public class BEContratos
    {
        public BEContratos()
        {
            

        }
        public string DocNum { get; set; }
        public int AbsEntry { get; set; }
        public string Code { get; set; }
        public string Dscription { get; set; }
        public string Detalle { get; set; }
        public string DocObjType { get; set; }
        public int DraftEntry { get; set; }
        public string Frequency { get; set; }
        public int Remind { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime NextDate { get; set; }
        public DateTime EndDate { get; set; }
        public string EndDate2 { get; set; }
        public string CardCode { get; set; }
        public string CardName { get; set; }
        public string Departamento { get; set; }
        public string Provincia { get; set; }
        public string Distrito { get; set; }
        public string Street { get; set; }
        public string Vendedor { get; set; }
        public string Id_Direccion { get; set; }
        public string Urbanizacion { get; set; }
        public string ShipToCode { get; set; }//ID DIRECCION
        public string Address2 { get; set; }//CALLE DIRECCION
    }
}
