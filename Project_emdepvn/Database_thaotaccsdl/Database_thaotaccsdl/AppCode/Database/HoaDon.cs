using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

namespace Database_thaotaccsdl.AppCode.Database
{
    public class HoaDon
    {
        #region Phương thức thêm mới HD
        public static void HoaDon_Insert(string ngaylap, string thanhtien, string manv, string tennv, string makh, string tenkh, string ret)
        {
            OleDbCommand cmd = new OleDbCommand("hoadon_inser");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ngaylap", ngaylap);
            cmd.Parameters.AddWithValue("@thanhtien", thanhtien);
            cmd.Parameters.AddWithValue("@manv", manv);
            cmd.Parameters.AddWithValue("@tennv", tennv);
            cmd.Parameters.AddWithValue("@makh", makh);
            cmd.Parameters.AddWithValue("@tenkh", tenkh);
            cmd.Parameters.AddWithValue("@ret", ret);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức update hóa đơn
        public static void HoaDon_update(string madondathang, string ngaytao, string thanhtienhd, string tinhtrangdonhang, string makh, string tenkh, string sdtkh, string emailkh)
        {
            OleDbCommand cmd = new OleDbCommand("dondathang_update");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@madondathang", madondathang);
            cmd.Parameters.AddWithValue("@ngaytao", ngaytao);
            cmd.Parameters.AddWithValue("@thanhtienhd", thanhtienhd);
            cmd.Parameters.AddWithValue("@tinhtrangdonhang", tinhtrangdonhang);
            cmd.Parameters.AddWithValue("@makh", makh);
            cmd.Parameters.AddWithValue("@tenkh", tenkh);
            cmd.Parameters.AddWithValue("@sdtkh", sdtkh);
            cmd.Parameters.AddWithValue("@emailkh", emailkh);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thưc delete hóa đơn
        public static void HoaDon_Delete(string mahoadon)
        {
            OleDbCommand cmd = new OleDbCommand("hoadon_delete");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mahoadon", mahoadon);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức lấy ra tất cả các HD
        public static DataTable Thongtin_HoaDon()
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_hoadon");
            cmd.CommandType = CommandType.StoredProcedure;
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy 1 HD mới nhất
        public static DataTable Thongtin_HoaDon_MoiNhat()
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_hoadon_moinhat");
            cmd.CommandType = CommandType.StoredProcedure;
            return DataHelper.GetData(cmd);
        }
        #endregion
    }
}