using System;
using System.Collections.Generic;
using System.Linq;
using BusinessEntities;
using System.Globalization;
using BusinessRules;
namespace BusinessServices
{
    public class BSSalesOrder
    {
        
      
        public static bool Get_Mobility(BEDocument obj, List<BEParMovility> prmv)
        {
            bool mvl = false;
            if (string.Compare(obj.U_BIZ_LUEN, "006", false) == 0 && obj.DocTotal > 0)
            {
                var count = prmv.Where(lobj => string.Compare(lobj.U_BF_CODI, obj.U_BIZ_CODI, false) == 0 &&
                string.Compare(lobj.U_BF_DIA, "Vacio", false) == 0 && obj.DocTotal >= lobj.U_BF_TOTA).Count();

                if (count == 0)
                {
                    var per = CultureInfo.GetCultureInfo("es-PE");
                    int day = (int)obj.DocDueDate.DayOfWeek;
                    string dayn = per.DateTimeFormat.DayNames[day];
                    count = prmv.Where(lobj => string.Compare(lobj.U_BF_CODI, obj.U_BIZ_CODI, false) == 0 &&
                    string.Compare(lobj.U_BF_DIA.ToUpper(), dayn.ToUpper(), false) == 0 && obj.DocTotal > 0 && obj.DocTotal < 200).Count();
                    if (count == 0)
                        mvl = true;
                }
            }
            return (mvl);
        }
        public static decimal Get_Discount(decimal DocTotal, string soc)
        {
            BRDocument br= new BRDocument();
            BEParameters be = new BEParameters();
            be.Socied = soc;
            be.Rate = DocTotal;
            decimal dct = 0;

            dct = br.Get_DSCTO(be)[0].Dscto;
            //if (DocTotal >= 500 && DocTotal <= 1000)
            //{
            //    dct = 10;
            //}
            //else if (DocTotal > 1000 && DocTotal <= 3000)
            //{
            //    dct = 20;
            //}
            //else
            //{
            //    if (DocTotal > 3000)
            //        dct = 25;
            //}
            return (dct);
        }
        public static List<BEProduct> Get_Present(decimal sumlinetotal, List<BEProduct> prmv)
        {
            sumlinetotal = Math.Round(sumlinetotal, 2);
            var olst = prmv.Where(lobj => sumlinetotal >= lobj.U_BF_MOMI && sumlinetotal < lobj.U_BF_MOMA && lobj.U_BF_DEFA == 1).ToList();
            if (olst.Count == 0)
                olst = prmv.Where(lobj => sumlinetotal >= lobj.U_BF_MOMI && lobj.U_BF_MOMA == 0 && lobj.U_BF_DEFA == 1).ToList();
            return (olst);
        }
    }
}
