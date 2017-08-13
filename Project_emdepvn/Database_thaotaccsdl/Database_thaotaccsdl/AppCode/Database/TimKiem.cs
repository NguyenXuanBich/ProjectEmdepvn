using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

namespace Database_thaotaccsdl.AppCode.Database
{
    public class TimKiem
    {
        #region Phương thức tìm kiếm tất cả tin tức, sản phẩm
        public static DataTable SearchTinTucByAll(string info)
        {
            OleDbCommand cmd = new OleDbCommand("select * from db_SanPham where TenSP like  N'%" + info + "%'");
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@Info", info);
            return DataHelper.GetData(cmd);
        }
        #endregion
        #region Phương thức tìm kiếm tất cả tin tức
        public static DataTable SearchTinTucTinTucByAll(string info)
        {
            OleDbCommand cmd = new OleDbCommand("select * from db_TinTuc where TieuDe like  N'%" + info + "%'");
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@Info", info);
            return DataHelper.GetData(cmd);
        }
        #endregion
    }
}