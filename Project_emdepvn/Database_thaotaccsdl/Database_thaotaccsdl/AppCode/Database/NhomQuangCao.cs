using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

namespace Database_thaotaccsdl.AppCode.Database
{
    public class NhomQuangCao
    {
        #region Phương thức thêm mới nhóm quảng cáo
        public static void NhomQuangCao_Insert(string tennhompc, string vitripc, string thutunhompc, string anhdaidienpc, string ret)
        {
            OleDbCommand cmd = new OleDbCommand("nhomquangcao_inser");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tennhomqc", tennhompc);
            cmd.Parameters.AddWithValue("@vitriqc", vitripc);
            cmd.Parameters.AddWithValue("@thutunhomqc", thutunhompc);
            cmd.Parameters.AddWithValue("@anhdaidienqc", anhdaidienpc);
            cmd.Parameters.AddWithValue("@ret", ret);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức update nhóm quảng cáo
        public static void NhomQuangCao_update(string nhompcid, string tennhompc, string vitripc, string thutunhompc, string anhdaidienpc)
        {
            OleDbCommand cmd = new OleDbCommand("nhomquangcao_update");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nhomquangcaoid", nhompcid);
            cmd.Parameters.AddWithValue("@tennhomquangcao", tennhompc);
            cmd.Parameters.AddWithValue("@vitriqc", vitripc);
            cmd.Parameters.AddWithValue("@thutunhomqc", thutunhompc);
            cmd.Parameters.AddWithValue("@anhdaidienqc", anhdaidienpc);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thưc delete nhóm quảng cáo
        public static void NhomQuangCao_Delete(string nhompcid)
        {
            OleDbCommand cmd = new OleDbCommand("nhomquangcao_delete");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nhomquangcaoid", nhompcid);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức lấy ra tất cả các nhóm quảng cáo
        public static DataTable Thongtin_NhomQuangCao()
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_nhomquangcao");
            cmd.CommandType = CommandType.StoredProcedure;
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy thông tin nhóm quảng cáo theo mã
        public static DataTable Thongtin_NhomQuangCao_By_Id(string nhomid)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_nhomquangcao_by_id");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@NhomQuangCaoID", nhomid);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy thông tin nhóm quảng cáo theo tên
        public static DataTable Thongtin_NhomQuangCao_By_Ten(string ten)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_nhomquangcao_by_ten");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ten", ten);
            return DataHelper.GetData(cmd);
        }
        #endregion


        #region Phương thức lấy thông tin nhóm quảng cáo theo vị trí nhóm  quảng cáo
        public static DataTable Thongtin_NhomQuangCao_By_ViTriQC(string vitripc)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_nhomquangcao_by_vitriqc");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ViTriQC", vitripc);
            return DataHelper.GetData(cmd);
        }
        #endregion
    }
}