using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

namespace Database_thaotaccsdl.AppCode.Database
{
    public class DonDatHang
    {
        #region Phương thức thêm mới đơn đặt hàng
        public static void DonDatHang_Insert(string ngaytao, string thanhtienhd, string tinhtrangdonhang, string makh, string tenkh, string sdtkh, string emailkh, string ret)
        {
            OleDbCommand cmd = new OleDbCommand("dondathang_inser");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ngaytao", ngaytao);
            cmd.Parameters.AddWithValue("@thanhtienhd", thanhtienhd);
            cmd.Parameters.AddWithValue("@tinhtrangdonhang", tinhtrangdonhang);
            cmd.Parameters.AddWithValue("@makh", makh);
            cmd.Parameters.AddWithValue("@tenkh", tenkh);
            cmd.Parameters.AddWithValue("@sdtkh", sdtkh);
            cmd.Parameters.AddWithValue("@emailkh", emailkh);
            cmd.Parameters.AddWithValue("@ret", ret);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức update đơn đặt hàng
        public static void DonDatHang_update(string madondathang, string ngaytao, string thanhtienhd, string tinhtrangdonhang, string makh, string tenkh, string sdtkh, string emailkh)
        {
            OleDbCommand cmd = new OleDbCommand("dondathang_update");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@madondathang", madondathang);
            cmd.Parameters.AddWithValue("@ngaytao", ngaytao);
            cmd.Parameters.AddWithValue("@thanhtienhd", thanhtienhd);
            cmd.Parameters.AddWithValue("@tinhtrangdonhang", tinhtrangdonhang);
            cmd.Parameters.AddWithValue("@makh", makh);
            cmd.Parameters.AddWithValue("@tenkh", tenkh);
            cmd.Parameters.AddWithValue("@sdtkh", sdtkh);
            cmd.Parameters.AddWithValue("@emailkh", emailkh);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thưc delete đơn đặt hàng
        public static void DonDatHang_Delete(string madondathang)
        {
            OleDbCommand cmd = new OleDbCommand("dondathang_delete");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@madondathang", madondathang);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức lấy ra tất cả các đơn đặt hàng
        public static DataTable Thongtin_DonDatHang()
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_dondathang");
            cmd.CommandType = CommandType.StoredProcedure;
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy thông tin đơn đặt hàng theo mã đơn hàng
        public static DataTable Thongtin_DonDatHang_By_Id(string maddh)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_dondathang_by_id");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@madondathang", maddh);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy thông tin đơn đặt hàng theo mã thanh toán trực tuyến
        public static DataTable Thongtin_DonDatHang_By_maThanhToan(string mathanhtoan)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_dondathang_by_mathanhtoan");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mathanhtoan", mathanhtoan);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy thông tin đơn đặt hàng theo mã khách hàng
        public static DataTable Thongtin_DonDatHang_By_maKhachHang(string makhachhang)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_dondathang_by_makhachhang");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@makhachhang", makhachhang);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Lấy thông tin theo mail kh
        public static DataTable Thongtin_DonDatHangByEmailKH(string emailofkh)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_dondathang_by_emailKH");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mailkh", emailofkh);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy ra tất cả các đơn đặt hàng từ mới đến cũ
        public static DataTable Thongtin_DonDatHang_desc()
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_dondathang_desc");
            cmd.CommandType = CommandType.StoredProcedure;
            return DataHelper.GetData(cmd);
        }
        #endregion
    }
}