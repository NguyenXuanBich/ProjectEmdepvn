<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SanPhamHienThiGioHang.ascx.cs" Inherits="Database_thaotaccsdl.GiaodienUser.SanPham.SanPhamHienThiGioHang" %>


<script src="../../cms/admin/js/jquery-1.11.3.min.js"></script>
<div class="modal-content">
    <div class="modal-header">
        <a class="modal-title" id="exampleModalLabel">BẠN HIỆN CÓ <span class="TongSoSPTrongGioHang">0</span> SẢN PHẨM TRONG GIỎ HÀNG</a>
        <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <a aria-hidden="true"></a>
        </button>--%>
    </div>
    <div>
        <div class="modal-body" id="BangThongTinGioHang">

        </div>
        <div class="modal-forter">
            <div style="line-height:20px;padding-left:10px;">Quý khách vui lòng điền đầy đủ thông tin theo form phía dưới, nếu quý khách đã đăng nhập, thông tin sẽ tự động được điền, sau đó nhấn nút "Đặt Hàng".
                <br />Lưu ý: Nếu quý khách điền vào ô Email, chúng tôi sẽ tạo mới cho quý khách một tài khoản thành viên với tài khoản và mật khẩu chính là email của quý khách để lần sau đặt hàng dễ hơn.</div>
            <div class="row">
                <div class="col-lg-3">
                    <div class="modal-title-note">
                        Họ tên :
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="modal-note">
                        <input id="tbHoTen" type="text" style="width:450px;" value="<%=hoten %>" />
                    </div>
                </div>
                <div style="clear:both"></div>
            </div>
            <div class="row">
                <div class="col-lg-3">
                    <div class="modal-title-note">
                        Địa chỉ :
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="modal-note">
                        <input id="tbDiachi" type="text" style="width:450px;" value="<%=diachi %>" />
                    </div>
                </div>
                <div style="clear:both"></div>
            </div>
            <div class="row">
                <div class="col-lg-3">
                    <div class="modal-title-note">
                        Số điện thoại :
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="modal-note">
                        <input id="tbSoDienThoai" type="text" style="width:450px;" value="<%=sodienthoai%>" />
                    </div>
                </div>
                <div style="clear:both"></div>
            </div>
            <div class="row">
                <div class="col-lg-3">
                    <div class="modal-title-note">
                        Email :
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="modal-note">
                        <input id="tbEmail" type="text" style="width:450px;" value="<%=email%>" />
                    </div>
                </div>
                <div style="clear:both"></div>
            </div>

            <div class="col-lg-5">
                    <div class="total-price-modal">
                        Tổng cộng: <span class="item-total TongTienTrongGioHang">0</span>&nbsp VNĐ
                    </div>
                </div>
            <div class="CacHinhThucThanhToan">
                <div>
                    Quý khách vui lòng chọn một trong các hình thức thanh toán dưới đây để thanh toán cho đơn hàng của mình.
                </div>
                <div>
                    <input id="rbOnepayQuocTe" type="radio" name="rbHinhThucThanhToan"/>
                    <label for="rbOnepayQuocTe">Thanh toán trực tuyến qua thẻ Visa, Master, American Express,...</label>
                    <div class="paymentInfo">       
                        <script type="text/javascript"src="http://202.9.84.88/documents/payment/logoscript.jsp?logos=v,m,a,j,u&lang=en"></script> 
                        <div class="cb"><!----></div>
                    </div>
                </div><br />
                <div>                    
                    <input id="rbOnepay" type="radio" name="rbHinhThucThanhToan" checked="checked"/><label for="rbOnepay">Thanh toán trực tuyến qua thẻ ATM</label>
                    <div class="paymentInfo">       
                        <script type="text/javascript"src="http://202.9.84.88/documents/payment/logoscript.jsp?logos=at&lang=vi"></script> 
                        <div class="cb"><!----></div>
                    </div>                                      
                </div><br/>
                <div>                    
                    <input id="rbChuyenKhoan" type="radio" name="rbHinhThucThanhToan"/><label for="rbChuyenKhoan">Thanh toán chuyển khoản</label>
                    <div class="paymentInfo">
                        Tên tài khoản: Nguyễn Xuân Bích<br/>
                        Số tài khoản: 1305201005711<br/>
                        Ngân hàng nông nghiệp và phát triển nông thôn Việt Nam - Chi nhánh Hưng Yên
                    </div>
                </div><br/>
            </div>
            <div class="row" style="margin-top:10px">
                <div class="col-lg-6">
                    <div class="comeback">
                        <a class="comeback1" href="/GiaodienUser/UserPage.aspx?modul=SanPham">Tiếp tục mua hàng</a>
                    </div>
                </div>
                <div class="col-lg-7">
                   <%-- <div class="dathang">--%>
                        <a class="nutdathang" href="javascript://" onclick="GuiDonHang()"> <div class="dathang">Đặt hàng</div></a>
                  <%--  </div>--%>
                    <div class="col-lg-7">
                        <a class="nutdathang" id="update-cart-modal" href="/GiaodienUser/UserPage.aspx?modul=SanPham&modulcon=GioHang" ><div class="dathang">Cập nhật</div></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    //Viết ajax lấy thông tin giỏ hàng từ session
    function LayThongTinGioHang() {
        $.post("/GiaodienUser/SanPham/Ajax/SanPhamGioHang.aspx",
        {
            "ThaoTac": "LayThongTinGioHang"
        },
        function (data, status) {
            $("#BangThongTinGioHang").html(data);
        });
    }

    function LayTongSoSPTrongGioHang() {
        $.post("/GiaodienUser/SanPham/Ajax/SanPhamGioHang.aspx",
        {
            "ThaoTac": "LayTongSoSPTrongGioHang"
        },
        function (data, status) {
            $(".TongSoSPTrongGioHang").html(data);
        });
    }

    function LayTongTienGioHang() {
        $.post("/GiaodienUser/SanPham/Ajax/SanPhamGioHang.aspx",
        {
            "ThaoTac": "LayTongTienGioHang"
        },
        function (data, status) {
            $(".TongTienTrongGioHang").html(data);
        });
    }

    $(document)
        .ready(function () {
            LayThongTinGioHang();
            LayTongSoSPTrongGioHang();
            LayTongTienGioHang();
        });

    //Xóa 1 sản phẩm trong giỏ hàng
    function XoaSPTrongGioHang(idSanPham) {
        if (confirm("Bạn có muốn xóa sản phẩm này khỏi giỏ hàng?")) {
            $.post("/GiaodienUser/SanPham/Ajax/SanPhamGioHang.aspx",
            {
                "ThaoTac": "XoaSPTrongGioHang",
                "idSanPham": idSanPham
            },
            function (data, status) {
                //Xóa thành công--> Ẩn dòng chứa sản phẩm đã xóa rồi cập nhập lại số lượng với tổng tiền
                if (data === "") {
                    $("#tr_" + idSanPham).remove();
                    LayTongSoSPTrongGioHang();
                    LayTongTienGioHang();
                }
            });
        }
    }

    //Cập nhập số lượng cho 1 sản phẩm trong giỏ hàng
    function CapNhapSoLuongVaoGioHang(idSanPham) {
        var soluongmoi = $("#quantity_" + idSanPham).val();
        $.post("/GiaodienUser/SanPham/Ajax/SanPhamGioHang.aspx",
        {
            "ThaoTac": "CapNhapSoLuongVaoGioHang",
            "idSanPham": idSanPham,
            "soluongmoi": soluongmoi
        },
        function (data, status) {
            //Cập nhật lại số lượng và tổng tiền
            if (data === "") {
                LayTongSoSPTrongGioHang();
                LayTongTienGioHang();
            } else if (data != "") alert(data)
        });
    }
    //gửi Đơn hàng
    function GuiDonHang() {
        if ($("#tbHoTen").val() !== "" && $("tbSoDienThoai").val !== "") {
            var phuongthucthanhtoan = "";
            if ($("#rbChuyenKhoan").is(":checked")) phuongthucthanhtoan = "ChuyenKhoan";
            if ($("#rbOnepay").is(":checked")) phuongthucthanhtoan = "Onepay";
            if ($("#rbOnepayQuocTe").is(":checked")) phuongthucthanhtoan = "OnepayQuocTe";
            $.post("/GiaodienUser/SanPham/Ajax/SanPhamGioHang.aspx",
            {
                "ThaoTac": "GuiDonHang",
                "hoTen": $("#tbHoTen").val(),
                "diaChi": $("#tbDiachi").val(),
                "soDienthoai": $("#tbSoDienThoai").val(),
                "email": $("#tbEmail").val(),
                "phuongThucThanhToan": phuongthucthanhtoan

            },
            function (data, status) {
                //Nếu thành công-->thông báo đặt hàng thành công
                if (phuongthucthanhtoan === "ChuyenKhoan") {
                    if (data === "") {
                        alert("Bạn đã gửi đơn hàng thành công. Hãy chờ điện thoại xác nhận")
                        location.href = "/GiaodienUser/UserPage.aspx?modul=SanPham";
                    }

                    if (data === "false") {
                        alert("Giỏ hàng đã hết hạn hoặc chưa có sản phẩm nào, vui lòng chọn mua lại sản phẩm và đặt hàng lại.")
                        location.href = "/GiaodienUser/UserPage.aspx?modul=SanPham";
                    }
                } else {
                    //trường hợp thanh toán online
                    location.href = data;
                }
            });
        }
        else {
            alert("Vui lòng nhập đầy đủ họ tên và số điện thoại để đặt hàng.");
        }
    }

    LayTongSoSPTrongGioHang()
    LayThongTinGioHang();
    LayTongSoSPTrongGioHang();
    LayTongTienGioHang();
</script>