using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

namespace Database_thaotaccsdl.AppCode.Database
{
    public class QuyenDangNhap
    {
        #region Phương thực hiện thêm mới quyền đăng nhập
        public static void QuyenDangNhap_Inser(string tenquyen, string ret)
        {
            OleDbCommand cmd = new OleDbCommand("quyendangnhap_inser");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@tenquyen", tenquyen);
            cmd.Parameters.AddWithValue("@ret", ret);

            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức update thông tin quyền đăng nhập
        public static void QuyenDangNhap_Update(string maquyen, string tenquyen)
        {
            OleDbCommand cmd = new OleDbCommand("quyendangnhap_update");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@maquyen ", maquyen);
            cmd.Parameters.AddWithValue("@tenquyen", tenquyen);

            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức xóa quyền đăng nhập theo mã quyền được truyền vào
        public static void QuyenDangNhap_Delete(string quyenid)
        {
            OleDbCommand cmd = new OleDbCommand("quyendangnhap_delete");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@quyenid", quyenid);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức lấy ra danh sách tất cả các quyền
        public static DataTable Thongtin_QuyenDangNhap()
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_quyendangnhap");
            cmd.CommandType = CommandType.StoredProcedure;
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy thông tin quyền theo mã
        public static DataTable Thongtin_QuyenDangNhap_By_Id(string maquyen)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_quyendangnhap_by_id");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaQuyen", maquyen);
            return DataHelper.GetData(cmd);
        }
        #endregion 

        #region Phương thức lấy thông tin quyền theo tên
        public static DataTable Thongtin_QuyenDangNhap_By_Ten(string tenquyen)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_quyendangnhap_by_ten");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TenQuyen", tenquyen);
            return DataHelper.GetData(cmd);
        }
        #endregion
    }
}