using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

namespace Database_thaotaccsdl.AppCode.Database
{
    public class TaiKhoan
    {
        #region Phương thức thêm mới tài khoản
        public static void TaiKhoan_Inser(string tendangnhap, string matkhau, string emaildk, string diachidk, string tendaydu, string cauhoibaomat, string ngaysinh, string gioitinhdk, string maquyen, string ret)
        {
            OleDbCommand cmd = new OleDbCommand("dangky_inser");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@tendangnhap", tendangnhap);
            cmd.Parameters.AddWithValue("@matkhau", matkhau);
            cmd.Parameters.AddWithValue("@emaildk", emaildk);
            cmd.Parameters.AddWithValue("@diachidk", diachidk);
            cmd.Parameters.AddWithValue("@tendaydu", tendaydu);
            cmd.Parameters.AddWithValue("@cauhoibaomat", cauhoibaomat);
            cmd.Parameters.AddWithValue("@ngaysinh", ngaysinh);
            cmd.Parameters.AddWithValue("@gioitinhdk", gioitinhdk);
            cmd.Parameters.AddWithValue("@maquyen", maquyen);
            cmd.Parameters.AddWithValue("@ret", ret);

            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức update thông tin tài khoản
        public static void TaiKhoan_Update(string tendangnhap, string matkhau, string emaildk, string diachidk, string tendaydu, string cauhoibaomat, string ngaysinh, string gioitinhdk, string maquyen)
        {
            OleDbCommand cmd = new OleDbCommand("dangky_update");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@tendangnhap", tendangnhap);
            cmd.Parameters.AddWithValue("@matkhau", matkhau);
            cmd.Parameters.AddWithValue("@emaildk", emaildk);
            cmd.Parameters.AddWithValue("@diachidk", diachidk);
            cmd.Parameters.AddWithValue("@tendaydu", tendaydu);
            cmd.Parameters.AddWithValue("@cauhoibaomat", cauhoibaomat);
            cmd.Parameters.AddWithValue("@ngaysinh", ngaysinh);
            cmd.Parameters.AddWithValue("@gioitinhdk", gioitinhdk);
            cmd.Parameters.AddWithValue("@maquyen", maquyen);

            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức xóa tài khoản theo tên đăng nhập được truyền vào
        public static void TaiKhoan_Delete(string tendangnhap)
        {
            OleDbCommand cmd = new OleDbCommand("dangky_delete");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tendangnhap", tendangnhap);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức lấy ra danh sách tất cả các tài khoản
        public static DataTable ThongTin_TaiKhoan()
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_dangky");
            cmd.CommandType = CommandType.StoredProcedure;
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy thông tin tài khoản theo tên đăng nhập
        public static DataTable Thongtin_TaiKhoan_By_TenDangNhap(string TenDangNhap)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_dangky_by_id");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TenDangNhap", TenDangNhap);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy thông tin tài khoản theo mã quyền
        public static DataTable Thongtin_TaiKhoan_By_MaQuyen(string MaQuyen)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_dangky_by_maquyen");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaQuyen", MaQuyen);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy thông tin tài khoản theo tên đăng nhập và mật khẩu
        public static DataTable Thongtin_TaiKhoan_By_Id_MatKhau(string TenDangNhap, string MatKhau)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_dangky_by_id_matkhau");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TenDangNhap", TenDangNhap);
            cmd.Parameters.AddWithValue("@MatKhau", MatKhau);
            return DataHelper.GetData(cmd);
        }
        #endregion
    }
}