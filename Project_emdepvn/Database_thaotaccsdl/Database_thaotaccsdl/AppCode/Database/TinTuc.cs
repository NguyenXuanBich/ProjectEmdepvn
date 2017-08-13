using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

namespace Database_thaotaccsdl.AppCode.Database
{
    public class TinTuc
    {
        #region Phương thức thêm thông tin tin tức
        public static void TinTuc_Insert(string TieuDe, string AnhDaiDien, string MoTa, string NgayDang, string LuotXem, string ChiTiet, string ThuTu, string MaDM)
        {
            OleDbCommand cmd = new OleDbCommand("tintuc_inser");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TieuDe", TieuDe);
            cmd.Parameters.AddWithValue("@AnhDaiDien", AnhDaiDien);
            cmd.Parameters.AddWithValue("@MoTa", MoTa);
            cmd.Parameters.AddWithValue("@NgayDang", NgayDang);
            cmd.Parameters.AddWithValue("@LuotXem", LuotXem);

            cmd.Parameters.AddWithValue("@ChiTiet", ChiTiet);
            cmd.Parameters.AddWithValue("@ThuTu", ThuTu);
            cmd.Parameters.AddWithValue("@MaDM", MaDM);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức sửa thông tin tin tức
        public static void TinTuc_Update(string tintucid, string TieuDe, string AnhDaiDien, string MoTa, string NgayDang, string LuotXem, string ChiTiet, string ThuTu, string MaDM)
        {
            OleDbCommand cmd = new OleDbCommand("tintuc_update");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TinTucID", tintucid);
            cmd.Parameters.AddWithValue("@TieuDe", TieuDe);
            cmd.Parameters.AddWithValue("@AnhDaiDien", AnhDaiDien);
            cmd.Parameters.AddWithValue("@MoTa", MoTa);
            cmd.Parameters.AddWithValue("@NgayDang", NgayDang);

            cmd.Parameters.AddWithValue("@LuotXem", LuotXem);
            cmd.Parameters.AddWithValue("@ChiTiet", ChiTiet);
            cmd.Parameters.AddWithValue("@ThuTu", ThuTu);
            cmd.Parameters.AddWithValue("@MaDM", MaDM);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức xóa tin tức theo id
        public static void TinTuc_Delete(string tintucid)
        {
            OleDbCommand cmd = new OleDbCommand("tintuc_delete");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TinTucID", tintucid);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức lấy tất cả thông tin tin tức
        public static DataTable ThongTin_TinTuc()
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_tintuc");
            cmd.CommandType = CommandType.StoredProcedure;
            return DataHelper.GetData(cmd);
        }
        #endregion
     
        #region Phương thức lấy thông tin 6 tin tức mới nhất theo mã danh mục
        public static DataTable Thongtin_TinTuc_By_MaDM(string madm)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_tintuc_by_madm");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaMD", madm);
            return DataHelper.GetData(cmd);
        }
        #endregion  

        #region Phương thức lấy thông tin tin tức theo id
        /// <summary>
        /// Phương thức lấy thông tin tin tức theo id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static DataTable Thongtin_TinTuc_By_Id(string id)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_tintuc_by_id");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TinTucID", id);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy thông tin tin tức theo tiêu đề
        /// <summary>
        /// Phương thức lấy thông tin tin tức theo tiêu đề
        /// </summary>
        /// <param name="ten"></param>
        /// <returns></returns>
        public static DataTable Thongtin_TinTuc_By_Ten(string ten)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_tintuc_by_ten");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TieuDe", ten);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy thông tin mã danh mục tin theo id
        /// <summary>
        /// Phương thức lấy thông tin mã danh mục tin theo id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static DataTable Thongtin_MaDM_By_Id(string id)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_madm_by_idtintuc");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TinTucID", id);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy tất cả thông tin tin tức theo mã danh mục
        public static DataTable Thongtin_TinTuc_By_MaDM_TatCa(string madm)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_tintuc_by_madm_tatca");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaMD", madm);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy tất cả thông tin tin tức theo mã danh mục và mới ra lò
        public static DataTable Thongtin_TinTuc_By_MaDM_MoiNhat(string madm)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_tintuc_by_madm_moinhat");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaMD", madm);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức cập nhật lượt xem tin tức
        public static void LuotXem_Update( string luotxem,string tintucid)
        {
            OleDbCommand cmd = new OleDbCommand("luotxem_update");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@LuotXem", luotxem);
            cmd.Parameters.AddWithValue("@TinTucID", tintucid);          
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức lấy ra 9 tin xem nhiều nhất
        public static DataTable ThongTin_TinTuc_ByLuotXem()
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_tintuc_byLuotXem");
            cmd.CommandType = CommandType.StoredProcedure;
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy ra 5 tin xem mới nhất
        /// <summary>
        /// Phương thức lấy ra 5 tin xem mới nhất, dựa theo TinTucID, càng cao tức là càng mới
        /// </summary>
        /// <returns></returns>
        public static DataTable ThongTin_TinTuc_ByMoiNhat()
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_tintuc_byMoiNhat");
            cmd.CommandType = CommandType.StoredProcedure;
            return DataHelper.GetData(cmd);
        }
        #endregion
    }
}