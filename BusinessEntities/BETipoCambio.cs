using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntities
{
   public class BETipoCambio
    {
        public DateTime RateDate { get; set; }
        public decimal Rate { get; set; }
        public decimal RateUSD { get; set; }
        public decimal RateEUR { get; set; }
        public string UserSing { get; set; }
        public string Currency { get; set; }
        public string CurrencyUSD { get; set; }
        public string CurrencyEUR { get; set; }
        public string DataSource { get; set; }
        public string Msg { get; set; }
    }
}
