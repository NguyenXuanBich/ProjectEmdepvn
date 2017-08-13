using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

namespace Database_thaotaccsdl.AppCode.Database
{
    public class SanPham
    {
        #region Phương thức lấy thông tin sản phẩm theo nhóm và số lượng muốn lấy
        public static DataTable Thongtin_SanPham_By_NhomId(string nhomid, string SoSPHienThi)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_sanpham_by_nhomid");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@NhomID", nhomid);
            cmd.Parameters.AddWithValue("@SoSPHienThi", SoSPHienThi);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy tất cả thông tin sản phẩm theo nhóm
        public static DataTable Thongtin_SanPham_By_NhomId_Tatca(string nhomid)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_sanpham_by_nhomid_tatca");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@NhomID", nhomid);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy thông tin 3 sản phẩm theo mã danh mục
        public static DataTable Thongtin_SanPham_By_MaDM(string madm)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_sanpham_by_madm");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaMD", madm);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy tất cả thông tin sản phẩm theo mã danh mục
        public static DataTable Thongtin_SanPham_By_MaDM_TatCa(string madm)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_sanpham_by_madm_tatca");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaMD", madm);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy tất cả thông tin sản phẩm theo mã chất liệu
        public static DataTable Thongtin_SanPham_By_MaChatLieu_TatCa(string ma)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_sanpham_by_chatlieu");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Ma", ma);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy tất cả thông tin sản phẩm theo mã màu
        public static DataTable Thongtin_SanPham_By_MaMau_TatCa(string ma)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_sanpham_by_mau");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Ma", ma);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy tất cả thông tin sản phẩm theo mã size
        public static DataTable Thongtin_SanPham_By_MaSize_TatCa(string ma)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_sanpham_by_size");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Ma", ma);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức xóa sản phẩm theo mã sản phẩm được truyền vào
        /// <summary>
        /// Phương thức xóa sản phầm theo mã sản phẩm được truyền vào
        /// </summary>
        /// <param name="masp"></param>
        public static void SanPham_Delete(string masp)
        {
            OleDbCommand cmd = new OleDbCommand("sanpham_delete");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@masp", masp);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức update thông tin sản phẩm
        public static void SanPham_Update(
                                string masp,
                                string tensp,
                                string mauid,
                                string sizeid,
                                string chatlieuid,
                                string anhsp,
                                string soluongsp,
                                string giasp,
                                string gianhapsp,
                                string motasp,
                                string ngaytao,
                                string ngayhuy,
                                string madm,
                                string nhomid)
        {
            OleDbCommand cmd = new OleDbCommand("sanpham_update");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@masp", masp);
            cmd.Parameters.AddWithValue("@tensp", tensp);
            cmd.Parameters.AddWithValue("@mauid", mauid);
            cmd.Parameters.AddWithValue("@sizeid", sizeid);
            cmd.Parameters.AddWithValue("@chatieuid", chatlieuid);
            cmd.Parameters.AddWithValue("@anhsp", anhsp);
            cmd.Parameters.AddWithValue("@soluongsp", soluongsp);
            cmd.Parameters.AddWithValue("@giasp", giasp);
            cmd.Parameters.AddWithValue("@gianhapsp", gianhapsp);
            cmd.Parameters.AddWithValue("@motasp", motasp);
            cmd.Parameters.AddWithValue("@ngaytao", ngaytao);
            cmd.Parameters.AddWithValue("@ngayhuy", ngayhuy);
            cmd.Parameters.AddWithValue("@madm", madm);
            cmd.Parameters.AddWithValue("@nhomid", nhomid);

            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức update thông tin sản phẩm số lượng
        public static void SanPham_UpdateSL(
                                string masp,
                                string soluongsp)
        {
            OleDbCommand cmd = new OleDbCommand("sanpham_update_soluong");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@masp", masp);
            cmd.Parameters.AddWithValue("@soluongsp", soluongsp);


            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức lấy ra danh sách tất cả các sản phẩm
        /// <summary>
        /// Phương thức lấy ra danh sách tất cả các sản phẩm
        /// </summary>
        /// <returns></returns>
        public static DataTable Thongtin_Sanpham()
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_sanpham");
            cmd.CommandType = CommandType.StoredProcedure;

            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy ra danh sách tất cả các sản phẩm theo ID
        /// <summary>
        /// Phương thức lấy ra danh sách tất cả các sản phẩm
        /// </summary>
        /// <returns></returns>
        public static DataTable Thongtin_Sanpham_ByID(string masp)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_sanpham_by_id");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaSP", masp);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy ra danh sách tất cả các sản phẩm theo tên
        /// <summary>
        /// Phương thức lấy ra danh sách tất cả các sản phẩm theo tên
        /// </summary>
        /// <returns></returns>
        public static DataTable Thongtin_Sanpham_ByTen(string tensp)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_sanpham_by_ten");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Ten", tensp);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thực hiện thêm mới dữ liệu vào bảng sản phẩm
        /// <summary>
        /// Phương thực hiện thêm mới dữ liệu vào bảng sản phẩm
        /// </summary>
        /// <param name="tensp"></param>
        /// <param name="mauID"></param>
        /// <param name="sizeID"></param>
        /// <param name="chatieuID"></param>
        /// <param name="anhsanpham"></param>
        /// <param name="soluongsp"></param>
        /// <param name="giasp"></param>
        /// <param name="motasp"></param>
        /// <param name="ngaytao"></param>
        /// <param name="ngayhuy"></param>
        /// <param name="maDM"></param>
        /// <param name="nhomID"></param>
        /// <param name="ret"></param>
        public static void Sanpham_Inser(
                                        string tensp,
                                        string mauID,
                                        string sizeID,
                                        string chatieuID,
                                        string anhsanpham,
                                        string soluongsp,
                                        string giasp,
                                        string gianhapsp,
                                        string motasp,
                                        string ngaytao,
                                        string ngayhuy,
                                        string maDM,
                                        string nhomID,
                                        string ret)
        {
            OleDbCommand cmd = new OleDbCommand("sanpham_inser");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tensp", tensp);
            cmd.Parameters.AddWithValue("@mauID", mauID);
            cmd.Parameters.AddWithValue("@sizeID", sizeID);
            cmd.Parameters.AddWithValue("@chatieuID", chatieuID);
            cmd.Parameters.AddWithValue("@anhsanpham", anhsanpham);

            cmd.Parameters.AddWithValue("@soluongsp", soluongsp);
            cmd.Parameters.AddWithValue("@giasp", giasp);
            cmd.Parameters.AddWithValue("@gianhapsp", gianhapsp);
            cmd.Parameters.AddWithValue("@motasp", motasp);
            cmd.Parameters.AddWithValue("@ngaytao", ngaytao);
            cmd.Parameters.AddWithValue("@ngayhuy", ngayhuy);

            cmd.Parameters.AddWithValue("@maDM", maDM);
            cmd.Parameters.AddWithValue("@nhomID", nhomID);
            cmd.Parameters.AddWithValue("@ret", ret);

            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion
    }
}