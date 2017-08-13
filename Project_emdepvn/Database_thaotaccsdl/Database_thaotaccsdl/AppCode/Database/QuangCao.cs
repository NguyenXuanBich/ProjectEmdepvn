using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

namespace Database_thaotaccsdl.AppCode.Database
{
    public class QuangCao
    {
        #region Phương thức thêm mới dữ liệu vào bảng quảng cáo
        public static void QuangCao_Inser(string tenqc, string loaiqc, string anhqc, string lienket, string thutuqc, string nhomqcID, string ret)
        {
            OleDbCommand cmd = new OleDbCommand("quangcao_inser");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tenqc", tenqc);
            cmd.Parameters.AddWithValue("@loaiqc", loaiqc);
            cmd.Parameters.AddWithValue("@anhqc", anhqc);
            cmd.Parameters.AddWithValue("@lienket", lienket);
            cmd.Parameters.AddWithValue("@thutuqc", thutuqc);

            cmd.Parameters.AddWithValue("@nhomqcID", nhomqcID);
            cmd.Parameters.AddWithValue("@ret", ret);

            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức update thông tin quảng cáo
        public static void QuangCao_Update(string quangcaoid, string tenqc, string loaiqc, string anhqc, string lienket, string thutuqc, string nhomqcID)
        {
            OleDbCommand cmd = new OleDbCommand("quangcao_update");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@quangcaoid", quangcaoid);
            cmd.Parameters.AddWithValue("@tenqc", tenqc);
            cmd.Parameters.AddWithValue("@loaiqc", loaiqc);
            cmd.Parameters.AddWithValue("@anhqc", anhqc);
            cmd.Parameters.AddWithValue("@lienket", lienket);
            cmd.Parameters.AddWithValue("@thutuqc", thutuqc);
            cmd.Parameters.AddWithValue("@nhomqcID", nhomqcID);

            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức xóa quảng cáo theo mã được truyền vào
        public static void QuangCao_Delete(string quangcaoid)
        {
            OleDbCommand cmd = new OleDbCommand("quangcao_delete");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@quangcaoid", quangcaoid);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức lấy tất cả thông tin quảng cáo
        public static DataTable ThongTin_QuangCao()
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_quangcao");
            cmd.CommandType = CommandType.StoredProcedure;
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy thông tin quảng cáo theo id
        public static DataTable Thongtin_QuangCao_By_Id(string quangcaoid)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_quangcao_by_id");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@QuangCaoID", quangcaoid);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy thông tin quảng cáo theo tên
        public static DataTable Thongtin_QuangCao_By_Ten(string ten)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_quangcao_by_ten");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ten", ten);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy thông tin quảng cáo theo nhóm
        public static DataTable Thongtin_QuangCao_By_NhomQuangCaoId(string nhomquangcaoid)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_quangcao_by_nhomquangcaoid");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@NhomQuangCaoID", nhomquangcaoid);
            return DataHelper.GetData(cmd);
        }
        #endregion 

        #region Phương thức lấy ra danh sách tất cả các quảng cáo theo nhóm quảng cáo id
        /// <summary>
        /// Phương thức lấy ra danh sách tất cả các quảng cáo theo nhóm quảng cáo id
        /// </summary>
        /// <returns></returns>
        public static DataTable Thongtin_QuangCao_ByNhomQuangCaoID(string nhomquangcaoid)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_quangcao_by_nhomquangcaoid");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@NhomQuangCaoID", nhomquangcaoid);
            return DataHelper.GetData(cmd);
        }
        #endregion  

        #region Phương thức lấy ra danh sách tất cả các quảng cáo theo nhóm quảng cáo id và quảng cáo id
        /// <summary>
        ///  Phương thức lấy ra danh sách tất cả các quảng cáo theo nhóm quảng cáo id và quảng cáo id
        /// </summary>
        /// <returns></returns>
        public static DataTable Thongtin_QuangCao_ByNhomQuangCaoID_ID(string nhomquangcaoid, string quangcaoid)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_quangcao_by_nhomquangcaoid_and_id");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@NhomQuangCaoID", nhomquangcaoid);
            cmd.Parameters.AddWithValue("@QuangCaoID", quangcaoid);
            return DataHelper.GetData(cmd);
        }
        #endregion        
    }
}