using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;
namespace Database_thaotaccsdl.AppCode.Database
{
    public class NhomSanPham
    {
        #region Phương thức thêm mới nhóm sản phẩm
        public static void NhomSanPham_Insert(string tennhom, string anhdaidien, string thutu, string soSPhienthi, string ret)
        {
            OleDbCommand cmd = new OleDbCommand("nhomsanpham_inser");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tennhom", tennhom);
            cmd.Parameters.AddWithValue("@anhdaidien", anhdaidien);
            cmd.Parameters.AddWithValue("@thutu", thutu);
            cmd.Parameters.AddWithValue("@soSPhienthi", soSPhienthi);
            cmd.Parameters.AddWithValue("@ret", ret);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion
        #region Phương thức update nhóm sản phẩm
        public static void NhomSanPham_update(string nhomid, string tennhom, string anhdaidien, string thutu, string soSPhienthi)
        {
            OleDbCommand cmd = new OleDbCommand("nhomsanpham_update");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nhomid", nhomid);
            cmd.Parameters.AddWithValue("@tennhom", tennhom);
            cmd.Parameters.AddWithValue("@anhdaidien", anhdaidien);
            cmd.Parameters.AddWithValue("@thutu", thutu);
            cmd.Parameters.AddWithValue("@soSPhienthi", soSPhienthi);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion
        #region Phương thưc delete nhóm sản phẩm
        public static void NhomSanPham_Delete(string nhomid)
        {
            OleDbCommand cmd = new OleDbCommand("nhomsanpham_delete");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nhomid", nhomid);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion
        #region Phương thức lấy ra tất cả các nhóm sản phẩm
        public static DataTable Thongtin_NhomSanPham()
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_nhomsp");
            cmd.CommandType = CommandType.StoredProcedure;
            return DataHelper.GetData(cmd);
        }
        #endregion
        #region Phương thức lấy thông tin nhóm sản phẩm theo mã
        public static DataTable Thongtin_NhomSP_By_Id(string nhomid)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_nhomsp_by_id");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@NhomID", nhomid);
            return DataHelper.GetData(cmd);
        }
        #endregion
        #region Phương thức lấy thông tin nhóm sản phẩm theo tên
        public static DataTable Thongtin_NhomSP_By_Ten(string tennhom)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_nhomsp_by_ten");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TenNhom", tennhom);
            return DataHelper.GetData(cmd);
        }
        #endregion
    }
}