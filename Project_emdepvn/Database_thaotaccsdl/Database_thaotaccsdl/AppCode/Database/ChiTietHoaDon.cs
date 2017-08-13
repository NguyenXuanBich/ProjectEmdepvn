using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

namespace Database_thaotaccsdl.AppCode.Database
{
    public class ChiTietHoaDon
    {
        #region Phương thức thêm mới chi tiết đơn đặt hàng
        public static void ChiTietHoaDon_Insert(string masp, string mahoadon, string soluong, string dongia, string ret)
        {
            OleDbCommand cmd = new OleDbCommand("chitietdonhang_inser");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@masp", masp);
            cmd.Parameters.AddWithValue("@mahoadon", mahoadon);
            cmd.Parameters.AddWithValue("@soluong", soluong);
            cmd.Parameters.AddWithValue("@dongia", dongia);
            cmd.Parameters.AddWithValue("@ret", ret);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion
    
        #region Phương thức lấy ra tất cả các chi tiết HD
        public static DataTable Thongtin_ChiTietHoaDon(string mahoadon)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_chitietdonhang_bymahoadon");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mahoadon", mahoadon);
            return DataHelper.GetData(cmd);
        }
        #endregion
      
    }
}