using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

namespace Database_thaotaccsdl.AppCode.Database
{
    public class DanhMucTin
    {
        #region Phương thức thêm mới danh mục tin
        public static void DanhMucTin_Inser(string tendm, string anhdaidien, string thutu, string maDMcha, string ret)
        {
            OleDbCommand cmd = new OleDbCommand("danhmuctin_inser");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tendm", tendm);
            cmd.Parameters.AddWithValue("@anhdaidien", anhdaidien);
            cmd.Parameters.AddWithValue("@thutu", thutu);
            cmd.Parameters.AddWithValue("@maDMcha", maDMcha);
            cmd.Parameters.AddWithValue("@ret", ret);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức update thông tin danh mục tin
        public static void DanhMucTin_Update(string madm, string tendm, string anhdaidien, string thutu, string maDMcha)
        {
            OleDbCommand cmd = new OleDbCommand("danhmuctin_update");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@madm", madm);
            cmd.Parameters.AddWithValue("@tendm", tendm);
            cmd.Parameters.AddWithValue("@anhdaidien", anhdaidien);
            cmd.Parameters.AddWithValue("@thutu", thutu);
            cmd.Parameters.AddWithValue("@maDMcha", maDMcha);

            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức xóa danh mục tin theo mã danh mục được truyền vào
        public static void DanhMucTin_Delete(string madm)
        {
            OleDbCommand cmd = new OleDbCommand("danhmuctin_delete");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@madm", madm);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức lấy ra danh sách tất cả các danh mục tin
        public static DataTable Thongtin_DanhMucTin()
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_danhmuctin");
            cmd.CommandType = CommandType.StoredProcedure;
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy thông tin danh mục tin tức theo mã danh mục tin
        public static DataTable Thongtin_DanhMucTin_By_Id(string MaDM)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_danhmuctin_by_id");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaDM", MaDM);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy thông tin danh mục tin tức theo danh mục cha
        public static DataTable Thongtin_DanhMucTin_By_MaDMCha(string madmcha)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_danhmuctin_by_MaDMCha");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaDMCha", madmcha);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy ra danh mục cha theo mã danh mục con
        /// <summary>
        ///Phương thức lấy ra danh mục cha theo mã danh mục con
        /// </summary>
        /// <param name="@MaDMCon">Mã danh mục con</param>
        /// <returns></returns>
        public static DataTable Thongtin_DanhmucTin_By_MaDMCon(string MaDMCon)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_danhmuctin_by_MaDMCon");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaDMCon", MaDMCon);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy ra danh sách tất cả các danh mục tin theo tên
        /// <summary>
        /// Phương thức lấy ra danh sách tất cả các danh mục
        /// </summary>
        /// <param name="@MaDM">Mã danh mục cần lấy thông tin</param>
        /// <returns></returns>
        public static DataTable Thongtin_DanhmucTin_ByTen(string tendanhmuc)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_danhmuctin_by_ten");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TenDM", tendanhmuc);
            return DataHelper.GetData(cmd);
        }
        #endregion
    }
}