using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntities
{
    public class BELlamadaServicio
    {
        public BELlamadaServicio()
        {
            lineatecnicos = new List<BEBusinessPartner>();
        }
        public string CardCode { get; set; }
        public string CardName { get; set; }
        public string ContactPerson { get; set; }
        public string Estado { get; set; }
        public string Msg { get; set; }
        public string Prioridad { get; set; }
        public int CallId { get; set; }
        public string AddressType { get; set; }
        public string SerieFab { get; set; }
        public string SerieInt { get; set; }
        public string ItemCode { get; set; }
        public string Street { get; set; }
        public string U_DXP_BIZ_PROV { get; set; }
        public string State { get; set; }
        public string U_DXP_BIZ_DIST { get; set; }
        public string ItemName { get; set; }
        public string ItmsGrpCod { get; set; }
        public string NumDoc { get; set; }
        public string IdLlamada { get; set; }
        public string Creacion { get; set; }
        public DateTime? Creacion1 { get; set; }
        public DateTime? Cerrado1 { get; set; }
        public string Cerrado { get; set; }
        public string NroContrato { get; set; }
        public string FechaFinal { get; set; }
        public string Asunto { get; set; }
        public string Origen { get; set; }
        public string DetalleServicio { get; set; }
        public string TipoProblema { get; set; }
        public string Tecnico { get; set; }
        public string Resolucion { get; set; }
        public string Comentario { get; set; }
        public string HoraInicio { get; set; }
        public string HoraFin { get; set; }
        public string Duracion { get; set; }
        public string IdDireccion { get; set; }
        public string Cellular { get; set; }
        public string U_GOS_TECN1 { get; set; }
        public string U_GOS_TECN2 { get; set; }
        public string U_GOS_TECN3 { get; set; }
        public string U_GOS_TECN4 { get; set; }
        public string U_GOS_TECN5 { get; set; }
        public string U_GOS_TECN6 { get; set; }
        public List<BEBusinessPartner> lineatecnicos { get; set; }
    }
}
