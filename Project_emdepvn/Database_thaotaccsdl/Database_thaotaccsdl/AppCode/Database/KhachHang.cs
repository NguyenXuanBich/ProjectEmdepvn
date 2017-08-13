using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

namespace Database_thaotaccsdl.AppCode.Database
{
    public class KhachHang
    {
        #region Phương thức thêm thông tin khách hàng
        public static void KhachHang_Insert(string tenkh, string diachikh, string sdtkh, string emailkh, string matkhau, string ret)
        {
            OleDbCommand cmd = new OleDbCommand("khachang_inser");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tenkh", tenkh);
            cmd.Parameters.AddWithValue("@diachikh", diachikh);
            cmd.Parameters.AddWithValue("@sdtkh", sdtkh);
            cmd.Parameters.AddWithValue("@emailkh", emailkh);
            cmd.Parameters.AddWithValue("@matkhau", matkhau);
            cmd.Parameters.AddWithValue("@ret", ret);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức sửa thông tin khách hàng
        public static void KhachHang_Update(string makh, string tenkh, string diachikh, string sdtkh, string emailkh, string matkhau)
        {
            OleDbCommand cmd = new OleDbCommand("khachang_update");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@makh", makh);
            cmd.Parameters.AddWithValue("@tenkh", tenkh);
            cmd.Parameters.AddWithValue("@diachikh", diachikh);
            cmd.Parameters.AddWithValue("@sdtkh", sdtkh);
            cmd.Parameters.AddWithValue("@emailkh", emailkh);
            cmd.Parameters.AddWithValue("@matkhau", matkhau);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức xóa khách hàng theo id
        public static void KhachHang_Delete(string makh)
        {
            OleDbCommand cmd = new OleDbCommand("khachang_delete");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@makh", makh);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức lấy tất cả thông tin khách hàng
        public static DataTable ThongTin_KhachHang()
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_khachhang");
            cmd.CommandType = CommandType.StoredProcedure;
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy tất cả thông tin khách hàng theo email
        public static DataTable ThongTin_KhachHang_By_Email(string emailkh)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_khachhang_by_emailkh");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@emailkh", emailkh);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy tất cả thông tin khách hàng theo email và mật khẩu
        public static DataTable ThongTin_KhachHang_By_Email_MatKhau(string emailkh, string matkhau)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_khachhang_by_emailkh_matkhau");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@emailkh", emailkh);
            cmd.Parameters.AddWithValue("@matkhau", matkhau);
            return DataHelper.GetData(cmd);
        }
        #endregion
    }
}