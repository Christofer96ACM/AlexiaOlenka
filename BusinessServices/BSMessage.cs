using System;
using System.Collections.Generic;
using System.Linq;

namespace BusinessServices
{
    public class BSMessage
    {
        public const string MsNotChilds = "Seleccionar al Padre, No al Hijo.";
        public const string MsNotEmptyDocEntry = "Presionar nuevo e ingresar nuevamente los datos.";
        public const string MsEmptyItemCode = "Ingrese código de producto.";
        public const string MsEmptyCardCode = "Ingrese cliente.";
        public const string MsEmptyDEET = "Ingrese descripción de etiqueta.";        
        public const string MsDiferItemCode = "El código actual es diferente al agregado anteriormente.";
        public const string MsExistItemCode = "El código ingresado ya existe en la lista.";
        public const string MsExLinesCount = "Ingresar al menos un producto a la lista.";
        public const string MsExOwnerCode = "Seleccionar responsable de venta.";
        public const string MsExQuantityZero = "Ingrese cantidad mayor a cero.";
        public const string MsExQuantityMino = "Ingrese cantidad menor a la del documento origen.";
        public static readonly string MsgExSelMp = "Agregue una materia prima.";
        public static readonly string MsgExPerMayZero = "El porcentaje debe ser mayor a 0.";
        public static readonly string MsgExPerMiCien = "El total del porcentaje de la cotización, debe ser menor o igual a 100%.";
        public const string MsExRecPres = "Presentación ingresada es diferente a la calculada en los componentes, Calcular la cotización.";
    }
}
