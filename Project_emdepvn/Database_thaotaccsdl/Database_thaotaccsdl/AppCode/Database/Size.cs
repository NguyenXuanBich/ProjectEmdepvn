using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;
namespace Database_thaotaccsdl.AppCode.Database
{
    public class Size
    {
        #region Phương thức thêm mới size
        public static void Size_Inser(string tensize, string ret)
        {
            OleDbCommand cmd = new OleDbCommand("size_inser");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@tensize", tensize);
            cmd.Parameters.AddWithValue("@ret", ret);

            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion
        #region Phương thức update thông tin size
        public static void Size_Update(string masize, string tensize)
        {
            OleDbCommand cmd = new OleDbCommand("size_update");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@sizeid", masize);
            cmd.Parameters.AddWithValue("@tensize", tensize);

            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion
        #region Phương thức xóa size theo mã size được truyền vào
        public static void Size_Delete(string mamau)
        {
            OleDbCommand cmd = new OleDbCommand("size_delete");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@sizeid", mamau);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion
        #region Phương thức lấy ra danh sách tất cả các size
        public static DataTable Thongtin_Size()
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_size");
            cmd.CommandType = CommandType.StoredProcedure;
            return DataHelper.GetData(cmd);
        }
        #endregion
        #region Phương thức lấy thông tin size theo mã
        public static DataTable Thongtin_Size_By_Id(string sizeid)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_size_by_id");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SizeID", sizeid);
            return DataHelper.GetData(cmd);
        }
        #endregion
        #region Phương thức lấy thông tin size theo tên
        public static DataTable Thongtin_Size_By_Ten(string tensize)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_size_by_ten");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TenSize", tensize);
            return DataHelper.GetData(cmd);
        }
        #endregion
    }
}