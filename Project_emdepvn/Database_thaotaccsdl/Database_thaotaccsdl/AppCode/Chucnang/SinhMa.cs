using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Database_thaotaccsdl.AppCode.Chucnang
{
    public class SinhMa
    {
        public static string SinhMaTuDong()
        {
            DateTime time = DateTime.Now;

            return time.Year.ToString() + "_" + (time.Month < 10 ? "0" + time.Month.ToString() : time.Month.ToString()) + "_" + (time.Day < 10 ? "0" + time.Day.ToString() : time.Day.ToString()) + "_" + (time.Hour < 10 ? "0" + time.Hour.ToString() : time.Hour.ToString()) + "_" + (time.Minute < 10 ? "0" + time.Minute.ToString() : time.Minute.ToString()) + "_" + (time.Second < 10 ? "0" + time.Second.ToString() : time.Second.ToString()) + "_" + (time.Millisecond.ToString());
        }
    }
}