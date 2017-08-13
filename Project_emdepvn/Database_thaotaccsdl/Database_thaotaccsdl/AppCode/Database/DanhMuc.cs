using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;
namespace Database_thaotaccsdl.AppCode.Database
{
    public class DanhMuc
    {
        #region Phương thức xóa danh mục theo mã danh mục được truyền vào
        /// <summary>
        /// Phương thức xóa danh mục theo mã danh mục được truyền vào
        /// </summary>
        /// <param name="masp"></param>
        public static void DanhMuc_Delete(string madm)
        {
            OleDbCommand cmd = new OleDbCommand("danhmuc_delete");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@madm", madm);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức update thông tin danh mục
        /// <summary>
        /// Phương thức update thông tin danh mục
        /// </summary>
        /// <param name="madm"></param>
        /// <param name="tendm"></param>
        /// <param name="anhdaidien"></param>
        /// <param name="thutu"></param>
        /// <param name="maDMcha"></param>
        public static void DanhMuc_Update(
                                string madm,
                                string tendm,
                                string anhdaidien,
                                string thutu,
                                string maDMcha
                               )
        {
            OleDbCommand cmd = new OleDbCommand("danhmuc_update");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@madm", madm);
            cmd.Parameters.AddWithValue("@tendm", tendm);
            cmd.Parameters.AddWithValue("@anhdaidien", anhdaidien);
            cmd.Parameters.AddWithValue("@thutu", thutu);
            cmd.Parameters.AddWithValue("@maDMcha", maDMcha);

            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức lấy ra danh sách tất cả các danh mục
        /// <summary>
        /// Phương thức lấy ra danh sách tất cả các danh mục
        /// </summary>
        /// <returns></returns>
        public static DataTable Thongtin_Danhmuc()
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_danhmuc");
            cmd.CommandType = CommandType.StoredProcedure;
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy ra danh sách tất cả các danh mục theo id
        /// <summary>
        /// Phương thức lấy ra danh sách tất cả các danh mục danh mục theo id
        /// </summary>
        /// <param name="@MaDM">Mã danh mục cần lấy thông tin</param>
        /// <returns></returns>
        public static DataTable Thongtin_Danhmuc_ByID(string MaDM)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_danhmuc_by_id");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaDM", MaDM);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy ra danh sách tất cả các danh mục theo tên
        /// <summary>
        /// Phương thức lấy ra danh sách tất cả các danh mục
        /// </summary>
        /// <param name="@MaDM">Mã danh mục cần lấy thông tin</param>
        /// <returns></returns>
        public static DataTable Thongtin_Danhmuc_ByTen(string tendanhmuc)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_danhmuc_by_ten");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TenDM", tendanhmuc);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy ra danh sách tất cả các danh mục theo mã danh mục cha
        /// <summary>
        /// Phương thức lấy ra danh sách tất cả các danh mục theo mã danh mục cha
        /// </summary>
        /// <param name="@MaDMCha">Mã danh mục cha cần lấy danh sách các danh mục con</param>
        /// <returns></returns>
        public static DataTable Thongtin_Danhmuc_By_MaDMCha(string MaDMCha)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_danhmuc_by_MaDMCha");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaDMCha", MaDMCha);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy ra danh mục cha theo mã danh mục con
        /// <summary>
        ///Phương thức lấy ra danh mục cha theo mã danh mục con
        /// </summary>
        /// <param name="@MaDMCon">Mã danh mục con</param>
        /// <returns></returns>
        public static DataTable Thongtin_Danhmuc_By_MaDMCon(string MaDMCon)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_danhmuc_by_MaDMCon");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaDMCon", MaDMCon);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thực hiện thêm mới danh mục
        /// <summary>
        /// Phương thực hiện thêm mới danh mục
        /// </summary>
        /// <param name="madm"></param>
        /// <param name="tendm"></param>
        /// <param name="anhdaidien"></param>
        /// <param name="thutu"></param>
        /// <param name="maDMcha"></param>
        public static void Danhmuc_Inser(
                                   string madm,
                                string tendm,
                                string anhdaidien,
                                string thutu,
                                string maDMcha)
        {
            OleDbCommand cmd = new OleDbCommand("danhmuc_inser");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@madm", madm);
            cmd.Parameters.AddWithValue("@tendm", tendm);
            cmd.Parameters.AddWithValue("@anhdaidien", anhdaidien);
            cmd.Parameters.AddWithValue("@thutu", thutu);
            cmd.Parameters.AddWithValue("@maDMcha", maDMcha);

            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

    }
}