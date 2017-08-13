using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WebApplication2;
using Database_thaotaccsdl.AppCode;

namespace Database_thaotaccsdl.GiaodienUser.SanPham.Ajax
{
    public partial class SanPhamGioHang : System.Web.UI.Page
    {
        private string thaotac = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            thaotac = Request.Params["ThaoTac"];
            switch (thaotac)
            {
                case "ThemVaoGioHang": ThemVaoGioHang(); break;
                case "ThanhTien": ThanhTien(); break;
                case "LayThongTinGioHang": LayThongTinGioHang(); break;
                case "LayTongSoSPTrongGioHang": LayTongSoSPTrongGioHang(); break;
                case "LayTongTienGioHang": LayTongTienGioHang(); break;
                case "XoaSPTrongGioHang": XoaSPTrongGioHang(); break;
                case "CapNhapSoLuongVaoGioHang": CapNhapSoLuongVaoGioHang(); break;
                case "GuiDonHang": GuiDonHang(); break;

            }
        }

        private void GuiDonHang()
        {
            string ketqua = "";
            //Lấy thông tin gửi từ khách lên
            string hoten = Request.Params["hoTen"];
            string diachi = Request.Params["diaChi"];
            string sodienthoai = Request.Params["soDienthoai"];
            string email = Request.Params["email"];
            string phuongthucthanhtoan = Request.Params["phuongThucThanhToan"];
            //Nếu tồn tại giỏ hàng thì mới xử lý đặt hàng
            if (Session["GioHang"] != null)
            {
                //Khai báo datatable để chọn giỏ hàng
                DataTable dtGioHang = new DataTable();
                dtGioHang = (DataTable)Session["GioHang"];
                #region Lấy ra tổng tiền
                double tongtien = 0;
                for (int i = 0; i < dtGioHang.Rows.Count; i++)
                {
                    tongtien += int.Parse(dtGioHang.Rows[i]["SoLuongSP"].ToString()) * double.Parse(dtGioHang.Rows[i]["GiaSP"].ToString());
                }
                #endregion

                #region Kiểm tra và thêm thông tin vào bảng khách hàng
                string maKH = XuLyThongTinKhachHang(hoten, diachi, sodienthoai, email);
                #endregion

                string mathanhtoantructuyen = DateTime.Now.Ticks.ToString();

                #region Thêm thông tin vào bảng đơn đặt hàng
                //tạo Đơn đặt hàng
                string ngaytao = DateTime.Now.ToString();
                Database_thaotaccsdl.AppCode.Database.DonDatHang.DonDatHang_Insert(ngaytao, tongtien.ToString(), mathanhtoantructuyen, maKH, hoten, sodienthoai, email, "");

                //lấy ra thông tin đơn đặt hàng vừa tạo
                DataTable dtdondathang = Database_thaotaccsdl.AppCode.Database.DonDatHang.Thongtin_DonDatHang_desc();
                string madondathang = dtdondathang.Rows[0]["MaDonDatHang"].ToString();
                #endregion

                #region Thêm thông tin sản phẩm vào bảng chi tiết đơn hàng rồi trừ số lượng sp đi.
                for (int i = 0; i < dtGioHang.Rows.Count; i++)
                {
                    Database_thaotaccsdl.AppCode.Database.ChiTietDonDatHang.ChiTietDonDatHang_Insert(dtGioHang.Rows[i]["MaSP"].ToString(), madondathang, dtGioHang.Rows[i]["SoLuongSP"].ToString(), dtGioHang.Rows[i]["GiaSP"].ToString(), "");
                    DataTable dt = new DataTable();
                    dt = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_Sanpham_ByID(dtGioHang.Rows[i]["MaSP"].ToString());
                    int sl = ((Convert.ToInt32(dt.Rows[0]["SoLuongSP"].ToString()) - (Convert.ToInt32(dtGioHang.Rows[i]["SoLuongSP"].ToString()))));
                    Database_thaotaccsdl.AppCode.Database.SanPham.SanPham_UpdateSL(dtGioHang.Rows[i]["MaSP"].ToString(), sl.ToString());
                }
                #endregion

                #region Xóa session giỏ hàng đi
                Session["GioHang"] = null;
                #endregion
                #region Xử lý tương ứng cho các hình thức thanh toán


                switch (phuongthucthanhtoan)
                {
                    case "ChuyenKhoan":
                        break;

                    case "Onepay":
                        #region Chuyển sang trang Onepay
                        string SECURE_SECRET = Database_thaotaccsdl.AppCode.Onepay.OnepayNoiDiaCode.SECURE_SECRET;//Hòa: cần thanh bằng mã thật cấu hình trong app_code
                        // Khoi tao lop thu vien va gan gia tri cac tham so gui sang cong thanh toan
                        VPCRequest conn = new VPCRequest(Database_thaotaccsdl.AppCode.Onepay.OnepayNoiDiaCode.VPCRequest);//Hòa: Cần thay bằng cổng thật cấu hình trong app_code
                        conn.SetSecureSecret(SECURE_SECRET);
                        // Add the Digital Order Fields for the functionality you wish to use
                        // Core Transaction Fields
                        conn.AddDigitalOrderField("Title", "onepay paygate");
                        conn.AddDigitalOrderField("vpc_Locale", "vn");//Chon ngon ngu hien thi tren cong thanh toan (vn/en)
                        conn.AddDigitalOrderField("vpc_Version", "2");
                        conn.AddDigitalOrderField("vpc_Command", "pay");
                        conn.AddDigitalOrderField("vpc_Merchant", Database_thaotaccsdl.AppCode.Onepay.OnepayNoiDiaCode.Merchant);//Hòa: cần thanh bằng mã thật cấu hình trong app_code
                        conn.AddDigitalOrderField("vpc_AccessCode", Database_thaotaccsdl.AppCode.Onepay.OnepayNoiDiaCode.AccessCode);//Hòa: cần thanh bằng mã thật cấu hình trong app_code
                        conn.AddDigitalOrderField("vpc_MerchTxnRef", mathanhtoantructuyen);//Hòa: mã thanh toán
                        conn.AddDigitalOrderField("vpc_OrderInfo", mathanhtoantructuyen);//Hòa: thông tin đơn hàng
                        conn.AddDigitalOrderField("vpc_Amount", (tongtien * 100).ToString());//Hòa: chi phí cần nhân 100 theo yêu cầu của onepay
                        conn.AddDigitalOrderField("vpc_Currency", "VND");
                        conn.AddDigitalOrderField("vpc_ReturnURL", Database_thaotaccsdl.AppCode.Onepay.OnepayNoiDiaCode.ReturnURL);//Hòa: địa chỉ nhận kết quả trả về
                        // Thong tin them ve khach hang. De trong neu khong co thong tin
                        conn.AddDigitalOrderField("vpc_SHIP_Street01", "");
                        conn.AddDigitalOrderField("vpc_SHIP_Provice", "");
                        conn.AddDigitalOrderField("vpc_SHIP_City", "");
                        conn.AddDigitalOrderField("vpc_SHIP_Country", "");
                        conn.AddDigitalOrderField("vpc_Customer_Phone", "");
                        conn.AddDigitalOrderField("vpc_Customer_Email", "");
                        conn.AddDigitalOrderField("vpc_Customer_Id", "");
                        // Dia chi IP cua khach hang
                        conn.AddDigitalOrderField("vpc_TicketNo", Request.UserHostAddress);
                        // Chuyen huong trinh duyet sang cong thanh toan
                        String url = conn.Create3PartyQueryString();
                        #endregion

                        ketqua = url;

                        break;
                    case "OnepayQuocTe":
                        string SECURE_SECRET1 = Database_thaotaccsdl.AppCode.Onepay.OnePayQuocTeCode.SECURE_SECRET;//Hòa: cần thanh bằng mã thật cấu hình trong app_code; 
                        // Khoi tao lop thu vien va gan gia tri cac tham so gui sang cong thanh toan
                        VPCRequest conn1 = new VPCRequest(Database_thaotaccsdl.AppCode.Onepay.OnePayQuocTeCode.VPCRequest);//Hòa: Cần thay bằng cổng thật
                        conn1.SetSecureSecret(SECURE_SECRET1);
                        // Add the Digital Order Fields for the functionality you wish to use
                        // Core Transaction Fields
                        conn1.AddDigitalOrderField("AgainLink", "http://onepay.vn");
                        conn1.AddDigitalOrderField("Title", "onepay paygate");
                        conn1.AddDigitalOrderField("vpc_Locale", "en");//Chon ngon ngu hien thi tren cong thanh toan (vn/en)
                        conn1.AddDigitalOrderField("vpc_Version", "2");
                        conn1.AddDigitalOrderField("vpc_Command", "pay");
                        conn1.AddDigitalOrderField("vpc_Merchant", Database_thaotaccsdl.AppCode.Onepay.OnePayQuocTeCode.Merchant);//Hòa: cần thanh bằng mã thật cấu hình trong app_code
                        conn1.AddDigitalOrderField("vpc_AccessCode", Database_thaotaccsdl.AppCode.Onepay.OnePayQuocTeCode.AccessCode);//Hòa: cần thanh bằng mã thật cấu hình trong app_code
                        conn1.AddDigitalOrderField("vpc_MerchTxnRef", mathanhtoantructuyen);//Hòa: mã thanh toán
                        conn1.AddDigitalOrderField("vpc_OrderInfo", mathanhtoantructuyen);//Hòa: mã thanh toán
                        conn1.AddDigitalOrderField("vpc_Amount", (tongtien * 100).ToString());//Hòa: chi phí cần nhân 100 theo yêu cầu của onepay

                        conn1.AddDigitalOrderField("vpc_ReturnURL", Database_thaotaccsdl.AppCode.Onepay.OnePayQuocTeCode.ReturnURL);//Hòa: địa chỉ nhận kết quả trả về
                        // Thong tin them ve khach hang. De trong neu khong co thong tin
                        conn1.AddDigitalOrderField("vpc_SHIP_Street01", "");
                        conn1.AddDigitalOrderField("vpc_SHIP_Provice", "");
                        conn1.AddDigitalOrderField("vpc_SHIP_City", "");
                        conn1.AddDigitalOrderField("vpc_SHIP_Country", "");
                        conn1.AddDigitalOrderField("vpc_Customer_Phone", "");
                        conn1.AddDigitalOrderField("vpc_Customer_Email", "");
                        conn1.AddDigitalOrderField("vpc_Customer_Id", "");
                        // Dia chi IP cua khach hang
                        conn1.AddDigitalOrderField("vpc_TicketNo", Request.UserHostAddress);
                        // Chuyen huong trinh duyet sang cong thanh toan
                        String url1 = conn1.Create3PartyQueryString();
                        ketqua = url1;

                        break;
                }
                #endregion
            }
            else
                ketqua = "false";
            Response.Write(ketqua);
        }

        #region Xử lí thông tin khách hàng
        private string XuLyThongTinKhachHang(string hoten, string diachi, string sodienthoai, string email)
        {
            //lấy danh sách khách hàng theo email->nếu chưa có email thì thêm mới khách hàng, còn có rồi thì thôi
            DataTable dt = Database_thaotaccsdl.AppCode.Database.KhachHang.ThongTin_KhachHang_By_Email(email);
            if (dt.Rows.Count == 0)
            {
                string matkhau = Database_thaotaccsdl.AppCode.Chucnang.MaHoa.MaHoaMD5(email);
                Database_thaotaccsdl.AppCode.Database.KhachHang.KhachHang_Insert(hoten, diachi, sodienthoai, email, matkhau, "");

                dt = Database_thaotaccsdl.AppCode.Database.KhachHang.ThongTin_KhachHang_By_Email(email);
                return dt.Rows[0]["MaKH"].ToString();
            }
            else
            {
                return dt.Rows[0]["MaKH"].ToString();
            }
        }
        #endregion

        #region Hàm cập nhật số lượng vào giỏ hàng
        private void CapNhapSoLuongVaoGioHang()
        {
            string ss = "";
            string idSanPham = Request.Params["idSanPham"];
            string soluongmoi = Request.Params["soluongmoi"];
            //Nếu có tồn tại giỏ hàng thì mới lấy ra kết quả
            if (Session["GioHang"] != null)
            {
                //Khai báo một đối tượng datatable để truyền vào giỏ hàng
                DataTable dtGioHang = new DataTable();
                dtGioHang = (DataTable)Session["GioHang"];
                //Lặp để cập nhật số lượng sản phẩm mới
                for (int i = 0; i < dtGioHang.Rows.Count; i++)
                {
                    //So sánh số lượng xem có còn đủ không
                    DataTable dt = new DataTable();
                    dt = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_Sanpham_ByID(dtGioHang.Rows[i]["MaSP"].ToString());
                    if (Convert.ToInt32(dt.Rows[0]["SoLuongSP"].ToString()) >= int.Parse(soluongmoi))
                    {
                        if (dtGioHang.Rows[i]["MaSP"].ToString() == idSanPham)
                        {
                            dtGioHang.Rows[i]["SoLuongSP"] = soluongmoi;
                        }
                        Session["GioHang"] = dtGioHang;
                    }
                    //else Response.Write("Không đủ số lượng trong kho nữa");
                    else ss = "Không đủ hàng, chỉ còn " + dt.Rows[0]["SoLuongSP"] + @" sản phẩm";
                  
                }
                Response.Write(ss);
            }
        }
        #endregion

        #region Hàm xóa SP trong GH
        private void XoaSPTrongGioHang()
        {
            string idSanPham = Request.Params["idSanPham"];
            //Nếu có tồn tại giỏ hàng thì mới lấy ra kết quả
            if (Session["GioHang"] != null)
            {
                //Khai báo một đối tượng datatable để truyền vào giỏ hàng
                DataTable dtGioHang = new DataTable();
                dtGioHang = (DataTable)Session["GioHang"];
                //Chạy vòng lặp và xuất dữ liệu ra dạng bảng
                for (int i = 0; i < dtGioHang.Rows.Count; i++)
                {
                    if (dtGioHang.Rows[i]["MaSP"].ToString() == idSanPham)
                    {
                        dtGioHang.Rows[i].Delete();
                    }
                }
                Session["GioHang"] = dtGioHang;
            }
            Response.Write("");
        }
        #endregion

        #region Hàm lấy tổng tiền trong giỏ hàng
        private void LayTongTienGioHang()
        {
            double tongtien = 0;
            //Nếu có tồn tại giỏ hàng thì mới lấy ra kết quả
            if (Session["GioHang"] != null)
            {
                //Khai báo datatable để truyền giỏ hàng vào
                DataTable dtGioHang = new DataTable();
                dtGioHang = (DataTable)Session["GioHang"];
                //Chạy vòng lặp và tình tiền từng món
                for (int i = 0; i < dtGioHang.Rows.Count; i++)
                {
                    tongtien += int.Parse(dtGioHang.Rows[i]["SoLuongSP"].ToString()) * double.Parse(dtGioHang.Rows[i]["GiaSP"].ToString());
                }
            }
            Response.Write(tongtien);
        }
        #endregion

        #region Hàm lấy tổng số sản phâm trong giỏ hàng
        private void LayTongSoSPTrongGioHang()
        {

            int tongso = 0;
            //Nếu tồn tại giỏ hàng thì mới lấy ra kết quả
            if (Session["GioHang"] != null)
            {
                //Khai báo datatable để chọn giỏ hàng
                DataTable dtGioHang = new DataTable();
                dtGioHang = (DataTable)Session["GioHang"];

                //chạy vòng lặp và xuất dữ liệu trong giỏ hàng ra dạng bảng
                for (int i = 0; i < dtGioHang.Rows.Count; i++)
                {
                    //tongso += int.Parse(dtGioHang.Rows[i]["SoLuongSP"].ToString());
                   
                }
                //hiện số lượng SP
                tongso = dtGioHang.Rows.Count;
            }
            Response.Write(tongso);
        }
        #endregion

        private void LayThongTinGioHang()
        {
            string ketqua = "";
            //Nếu tồn tại giỏ hàng thì mới lấy ra kết quả
            if (Session["GioHang"] != null)
            {
                //Khai báo datatable để chọn giỏ hàng
                DataTable dtGioHang = new DataTable();
                dtGioHang = (DataTable)Session["GioHang"];

                ketqua += @"

<table style='width:100%' id='cart-table'>
    <tbody>
        <tr style='height:50px;'>
            <th></th>
            <th>Tên sản phẩm</th>
            <th>Số lượng</th>
            <th>Đơn giá</th>
            <th></th>
        </tr>
        <tr class='line-item original'>
            <td class='item-image'></td>
            <td class='item-title'><a></a></td>
            <td class='item-quantity'></td>
            <td class='item-price'></td>
            <td class='item-delete'></td>
        </tr>";

                //chạy vòng lặp và xuất dữ liệu trong giỏ hàng ra dạng bảng
                for (int i = 0; i < dtGioHang.Rows.Count; i++)
                {
                    ketqua += @"

                        <tr class='lint-item' id='tr_" + dtGioHang.Rows[i]["MaSP"] + @"'>
                            <td class='item-image'><img class='anhSPGioHang' src='/pic/SanPham/" + dtGioHang.Rows[i]["AnhSP"] + @"' /></td>
                            <td class='item-title'>
                                <a href='/GiaodienUser/UserPage.aspx?modul=SanPham&modulcon=ChiTietSP&id=" + dtGioHang.Rows[i]["MaSP"] + @"'>" + dtGioHang.Rows[i]["TenSP"] + @"</a>
                            </td>
                            <td class='item-quantity'>
                                <input onchange='CapNhapSoLuongVaoGioHang(" + dtGioHang.Rows[i]["MaSP"] + @")' id='quantity_" + dtGioHang.Rows[i]["MaSP"] + @"' name='updates[]' min='1' type='number' value='" + dtGioHang.Rows[i]["SoLuongSP"] + @"' class=''>
                            </td>
                            <td class='item-price'>" + dtGioHang.Rows[i]["GiaSP"] + @"</td>
                            <td class='item-delete'>
                                <a href='javascript://' onclick='XoaSPTrongGioHang(" + dtGioHang.Rows[i]["MaSP"] + @")'>Xóa</a>
                            </td>
                        </tr>   
                    ";

                }
                ketqua += @"
    </tbody>
</table>
";
            }
            Response.Write(ketqua);
        }

        private void ThanhTien()
        {
            string id = Request.Params["id"];
            string soluong = Request.Params["soluong"];
            string ketqua2 = "";
            int thanhtien;
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_Sanpham_ByID(id);
            if (dt.Rows.Count > 0)
            {
                thanhtien = (int.Parse((dt.Rows[0]["GiaSP"]).ToString())) * (int.Parse(soluong));
                ketqua2 = thanhtien.ToString();
            }
            Response.Write(ketqua2);
        }

        private void ThemVaoGioHang()
        {
            //KHAI BÁO CÁC BIẾN
            string ketqua = "";
            string id = Request.Params["id"];
            string soluong = Request.Params["soluong"];
            //LẤY RA THÔNG TIN CHI TIẾT CỦA SẢN PHẨM ĐƯỢC LƯU VÀO GIỎ HÀNG
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_Sanpham_ByID(id);
            //Kiểm tra số lượng có thỏa mãn không, nếu có mới cho thực hiện không thì thôi
            if (Convert.ToInt32(soluong) <= Convert.ToInt32(dt.Rows[0]["SoLuongSP"].ToString()))
            {
                //Kiểm tra sản phẩm có tồn tại không, nếu có mới cho thực hiện không thì thôi
                if (dt.Rows.Count > 0)
                {
                    //Tạo một session giỏ hàng nếu chưa có
                    if (Session["GioHang"] == null)
                    {
                        //Liu thông tin sản phẩm được chọn lần đầu tiên vào giỏ hàng
                        DataTable dtGioHang = new DataTable();
                        dtGioHang.Columns.Add("MaSP");
                        dtGioHang.Columns.Add("TenSP");
                        dtGioHang.Columns.Add("AnhSP");
                        dtGioHang.Columns.Add("GiaSP");
                        dtGioHang.Columns.Add("SoLuongSP");
                        //Lưu thông tin các giá trị vào một bảng tạm database
                        dtGioHang.Rows.Add(dt.Rows[0]["MaSP"].ToString(), dt.Rows[0]["TenSP"].ToString(), dt.Rows[0]["AnhSP"].ToString(), dt.Rows[0]["GiaSP"].ToString(), soluong);
                        //Gán giá trị của bảng tạm trong database vào bảng trong session giỏ hàng
                        Session["GioHang"] = dtGioHang;
                    }
                    else
                    {
                        //Trường hợp có giỏ hàng rồi
                        //Khai báo DataTable để chứa giỏ hàng
                        DataTable dtGioHang = new DataTable();
                        dtGioHang = (DataTable)Session["GioHang"];
                        //Kiểm tra xem đã có sản phẩm nào trong giỏ hàng chưa
                        //Nếu có --- chỉ việc tăng số lượng lên
                        //Nếu chưa ---- Thêm một dòng nữa cho sản phẩm đó
                        int vitrisanphamtronggiohang = -1;
                        for (int i = 0; i < dtGioHang.Rows.Count; i++)
                        {
                            if (dtGioHang.Rows[i]["MaSP"].ToString() == id)
                            {
                                vitrisanphamtronggiohang = i;
                                break;
                            }
                        }
                        if (vitrisanphamtronggiohang != -1)
                        {
                            //lấy ra số lượng hiện tại
                            int soluonghientai = int.Parse(dtGioHang.Rows[vitrisanphamtronggiohang]["SoLuongSP"].ToString());

                            soluonghientai += int.Parse(soluong);
                            if (int.Parse(dt.Rows[0]["SoLuongSP"].ToString()) >= soluonghientai)
                            {
                                //gán lại
                                dtGioHang.Rows[vitrisanphamtronggiohang]["SoLuongSP"] = soluonghientai;
                                //gán lại vào session
                                Session["GioHang"] = dtGioHang;
                            }
                            else
                            {
                                ketqua = "Số lượng trong kho không đủ. Chỉ còn " + dt.Rows[0]["SoLuongSP"] + @" sản phẩm";
                            }

                        }
                        else
                        {
                            dtGioHang.Rows.Add(dt.Rows[0]["MaSP"].ToString(), dt.Rows[0]["TenSP"].ToString(), dt.Rows[0]["AnhSP"].ToString(), dt.Rows[0]["GiaSP"].ToString(), soluong);
                            Session["GioHang"] = dtGioHang;
                        }

                    }

                }
                else
                {
                    ketqua = "không tồn tại sản phẩm này.";
                }
            }
            else
            {
                ketqua = "Số lượng trong kho không đủ. Chỉ còn " + dt.Rows[0]["SoLuongSP"] + @" sản phẩm";
            }

            Response.Write(ketqua);
        }
    }
}