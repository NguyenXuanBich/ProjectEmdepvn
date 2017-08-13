using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

namespace Database_thaotaccsdl.AppCode.Database
{
    public class ChatLieu
    {
        #region Phương thức thực hiện thêm mới chất liệu
        public static void ChatLieu_Inser(string tenchatlieu, string ret)
        {
            OleDbCommand cmd = new OleDbCommand("chatlieu_inser");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@tenchatlieu", tenchatlieu);
            cmd.Parameters.AddWithValue("@ret", ret);

            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức update thông tin chất liệu
        public static void ChatLieu_Update(string chatlieuid, string tenchatlieu)
        {
            OleDbCommand cmd = new OleDbCommand("chatlieu_update");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@chatlieuid", chatlieuid);
            cmd.Parameters.AddWithValue("@tenchatlieu", tenchatlieu);

            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức xóa chất liệu theo mã chất liệu được truyền vào
        public static void ChatLieu_Delete(string chatlieuid)
        {
            OleDbCommand cmd = new OleDbCommand("chatlieu_delete");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@chatlieuid", chatlieuid);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức lấy ra danh sách tất cả các chất liệu
        public static DataTable Thongtin_ChatLieu()
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_chatlieu");
            cmd.CommandType = CommandType.StoredProcedure;
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy thông tin chất liệu theo mã
        public static DataTable Thongtin_ChatLieu_By_Id(string chatlieuid)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_chatlieu_by_id");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ChatLieuID", chatlieuid);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy thông tin chất liệu theo tên chất liệu
        public static DataTable Thongtin_ChatLieu_By_Ten(string tenchatlieu)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_chatlieu_by_ten");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TenChatLieu", tenchatlieu);
            return DataHelper.GetData(cmd);
        }
        #endregion
    }
}