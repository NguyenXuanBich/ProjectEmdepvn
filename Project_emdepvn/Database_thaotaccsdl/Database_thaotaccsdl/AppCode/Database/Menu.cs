using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

namespace Database_thaotaccsdl.AppCode.Database
{
    public class Menu
    {
        #region Phương thức thêm mới menu
        public static void Menu_Insert(string tenmenu, string lienket, string mamenucha, string thutumenu, string ret)
        {
            OleDbCommand cmd = new OleDbCommand("menu_inser");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tenmenu", tenmenu);
            cmd.Parameters.AddWithValue("@lienket", lienket);
            cmd.Parameters.AddWithValue("@mamenucha", mamenucha);
            cmd.Parameters.AddWithValue("@thutumenu", thutumenu);
            cmd.Parameters.AddWithValue("@ret", ret);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức update menu
        public static void Menu_update(string mamenu, string tenmenu, string lienket, string mamenucha, string thutumenu)
        {
            OleDbCommand cmd = new OleDbCommand("menu_update");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mamenu", mamenu);
            cmd.Parameters.AddWithValue("@tenmenu", tenmenu);
            cmd.Parameters.AddWithValue("@lienket", lienket);
            cmd.Parameters.AddWithValue("@mamenucha", mamenucha);
            cmd.Parameters.AddWithValue("@thutumenu", thutumenu);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thưc delete menu
        public static void Menu_Delete(string mamenu)
        {
            OleDbCommand cmd = new OleDbCommand("menu_delete");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mamenu", mamenu);
            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion

        #region Phương thức lấy ra tất cả các menu
        public static DataTable Thongtin_Menu()
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_menu");
            cmd.CommandType = CommandType.StoredProcedure;
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy thông tin menu theo mã
        public static DataTable Thongtin_Menu_By_Id(string mamenu)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_menu_by_id");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaMenu", mamenu);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy thông tin menu theo tên
        public static DataTable Thongtin_Menu_By_Ten(string ten)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_menu_by_ten");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ten", ten);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy thông tin menu theo menu cha
        public static DataTable Thongtin_Menu_By_MaMenuCha(string mamenucha)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_menu_by_mamenucha");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaMenuCha", mamenucha);
            return DataHelper.GetData(cmd);
        }
        #endregion

        #region Phương thức lấy thông tin menu theo menu con
        public static DataTable Thongtin_Menu_By_MaMenuCon(string mamenucon)
        {
            OleDbCommand cmd = new OleDbCommand("thongtin_menu_by_mamenucon");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaMenuCon", mamenucon);
            return DataHelper.GetData(cmd);
        }
        #endregion
    }
}