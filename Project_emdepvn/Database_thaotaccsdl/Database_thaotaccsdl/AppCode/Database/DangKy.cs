using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

namespace Database_thaotaccsdl.AppCode.Database
{
    public class DangKy
    {
        #region Insert
        public static void DangKy_Inser(
                                string tendangnhap,
                                string matkhau,
                                string emaildk,
                                string diachidk,
                                string tendaydu,
                                string cauhoibaomat,
                                string ngaysinh,
                                string gioitinhdk,
                                string maquyen,
                                string ret)
        {
            OleDbCommand cmd = new OleDbCommand("dangky_inser");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("string tendangnhap", tendangnhap);
            cmd.Parameters.AddWithValue("string matkhau", matkhau);
            cmd.Parameters.AddWithValue("string emaildk", emaildk);
            cmd.Parameters.AddWithValue("string diachidk", diachidk);
            cmd.Parameters.AddWithValue("string tendaydu", tendaydu);
            cmd.Parameters.AddWithValue("string cauhoibaomat", cauhoibaomat);
            cmd.Parameters.AddWithValue("string ngaysinh", ngaysinh);
            cmd.Parameters.AddWithValue("string gioitinhdk", gioitinhdk);
            cmd.Parameters.AddWithValue("string maquyen", maquyen);
            cmd.Parameters.AddWithValue("string ret", ret);

            DataHelper.ExecuteNoneQuery(cmd);
        }
        #endregion
    }
}