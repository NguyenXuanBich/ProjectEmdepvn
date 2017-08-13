using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

namespace Database_thaotaccsdl.AppCode.Database
{
    public class ChiTietDonDatHang
    {
        #region Phương thức thêm mới chi tiết đơn đặt hàng
        public static void ChiTietDonDatHang_Insert(string masp, string madondathang, string soluongdat, string dongiadat, string ret)
        {
            OleDbCommand cmd = new OleDbCommand("chitietdondathang_inser");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@masp", masp);
            cmd.Parameters.AddWithValue("@madondathang", madondathang);
            cmd.Parameters.AddWithValue("@soluongdat", soluongdat);
            cmd.Parameters.AddWithValue("@dongiadat", dongiadat);
            cmd.Parameters.AddWithValue("@ret", ret);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion
        #region Phương thức update chi tiết đơn đặt hàng
        public static void ChiTietDonDatHang_update(string masp, string madondathang, string soluongdat, string dongiadat)
        {
            OleDbCommand cmd = new OleDbCommand("chitietdondathang_update");
            cmd.Parameters.AddWithValue("@masp", masp);
            cmd.Parameters.AddWithValue("@madondathang", madondathang);
            cmd.Parameters.AddWithValue("@soluongdat", soluongdat);
            cmd.Parameters.AddWithValue("@dongiadat", dongiadat);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion
        #region Phương thưc delete chi tiết đơn đặt hàng
        public static void ChiTietDonDatHang_Delete(string masp, string madondathang)
        {
            OleDbCommand cmd = new OleDbCommand("chitietdondathang_delete");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@masp", masp);
            cmd.Parameters.AddWithValue("@madondathang", madondathang);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion
        #region Phương thức lấy ra tất cả các chi tiết đơn đặt hàng
        public static DataTable Thongtin_ChiTietDonDatHang()
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_chitietdondathang");
            cmd.CommandType = CommandType.StoredProcedure;
            return DataHelper.GetData(cmd);
        }
        #endregion  
        #region Phương thức lấy ra tất cả các chi tiết đơn đặt hàng theo mã SP
        public static DataTable Thongtin_ChiTietDonDatHang_ByMSP(string MaSP)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_chitietdondathang_byMaSP");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@masanpham", MaSP);
            return DataHelper.GetData(cmd);
        }
        #endregion
        #region Phương thức lấy ra tất cả các chi tiết đơn đặt hàng theo mã đơn đh
        public static DataTable Thongtin_ChiTietDonDatHang_ByMaDon(string Ma)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_chitietdondathang_byMaDon");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@madon", Ma);
            return DataHelper.GetData(cmd);
        }
        #endregion
        #region Phương thức lấy ra tất cả các đơn đặt hàng từ mới đến cũ
        //public static DataTable Thongtin_DonDatHang_desc()
        //{
        //    OleDbCommand cmd = new OleDbCommand("thongtin_dondathang_desc");
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    return DataHelper.GetData(cmd);
        //}
        #endregion
    }
}