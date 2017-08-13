using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

namespace Database_thaotaccsdl.AppCode.Database
{
    public class Mau
    {
        #region Phương thức thêm mới màu
        public static void Mau_Inser(string tenmau, string ret)
        {
            OleDbCommand cmd = new OleDbCommand("mau_inser");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@tenmau", tenmau);
            cmd.Parameters.AddWithValue("@ret", ret);

            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức update thông tin màu
        public static void Mau_Update(string mamau, string tenmau)
        {
            OleDbCommand cmd = new OleDbCommand("mau_update");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@mauid", mamau);
            cmd.Parameters.AddWithValue("@tenmau", tenmau);

            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức xóa màu theo mã màu được truyền vào
        public static void Mau_Delete(string mamau)
        {
            OleDbCommand cmd = new OleDbCommand("mau_delete");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mauid", mamau);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức lấy ra danh sách tất cả các màu
        public static DataTable ThongTin_Mau()
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_mau");
            cmd.CommandType = CommandType.StoredProcedure;
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy thông tin màu theo mã
        public static DataTable Thongtin_Mau_By_Id(string mamau)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_mau_by_id");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MauID", mamau);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy thông tin màu theo tên
        public static DataTable Thongtin_Mau_By_Ten(string tenmau)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_mau_by_ten");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TenMau", tenmau);
            return DataHelper.GetData(cmd);
        }
        #endregion
    }
}