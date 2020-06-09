using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;

namespace BusinessServices
{
    public static class BSControlFinder
    {
        public static T FindControl<T>(Control startingControl, string id) where T : Control
        {
            T found = startingControl.FindControl(id) as T;

            if (found == null)
            {
                found = FindChildControl<T>(startingControl, id);
            }

            return found;
        }
        public static T FindChildControl<T>(Control startingControl, string id) where T : Control
        {
            T found = null;

            foreach (Control activeControl in startingControl.Controls)
            {
                found = activeControl as T;

                if (found == null || (string.Compare(id, found.ID, true) != 0))
                {
                    found = FindChildControl<T>(activeControl, id);
                }

                if (found != null)
                {
                    break;
                }
            }

            return found;
        }
    }
}
