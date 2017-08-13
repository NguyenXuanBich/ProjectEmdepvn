<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SanPhamHienThiChiTiet.ascx.cs" Inherits="Database_thaotaccsdl.GiaodienUser.SanPham.SanPhamHienThiChiTiet" %>
<script src="../../cms/admin/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
    /*js xác định xem ảnh ngang hay học
    ================Cấu trúc khu vực chứa ảnh. Trong đó có thể thay khungAnhCrop thành khungAnhCrop0 tùy kiểu cắt ảnh================
    Trong đó item là div ngoài cùng có tác dụng fix width, các khối trong sẽ theo width 100%
    Khi cần tùy chỉnh ở các khu vực khác thì chỉ cần chỉnh width của item và .khungAnh:before{padding-bottom:66%}
    (66% là tỷ lệ height/width của khung ảnh)
    <div class="item3">
        <div class="khungAnh3">
            <a class="khungAnh3Crop" href="#" title="Pic 1">
                <img alt="Pic 1" src="pic_test/1.jpg"/>
            </a>
        </div>
    </div>
    ================Các thông số chỉnh sửa cho phần khung ảnh tùy theo yêu cầu================
    .item{width:30%}
    .khungAnh:before{padding-bottom:66%}
    */
    $(window)
        .load(function () {
            $(".khungAnh3Crop img")
                .each(function () {
                    $(this)
                        .removeClass("wide tall")
                        .addClass((this.width / this.height > $(this).parent().width() / $(this).parent().height())
                            ? "wide"
                            : "tall");
                });
        });
    $(window)
     .load(function () {
         $(".khungAnhCrop1 img")
             .each(function () {
                 $(this)
                     .removeClass("wide tall")
                     .addClass((this.width / this.height > $(this).parent().width() / $(this).parent().height())
                         ? "wide"
                         : "tall");
             });
     });
    /*Gọi qua Ajax thì viết thêm đoạn sau vào chỗ sau khi ajax load thành công để xử lý các ảnh được load về sau khi gọi ajax - đoạn cate_igid là là id của khối có nội dung load về qua ajax*/
    /*
    $("#cate_" + igid + " .khungAnhCrop img").load(function () {
        $(this).removeClass("wide tall").addClass((this.width / this.height > $(this).parent().width() / $(this).parent().height()) ? "wide" : "tall");
    });
    */
</script>
<div class="chiTietCover">
    <div class="hinhAnhSP">
        <%-- <div class="item3">
            <div class="khungAnh3">
                <a class="khungAnh3Crop" href="#" title="Pic 1">--%>
        <asp:Literal ID="ltrAnhSanPham" runat="server"></asp:Literal>
        <%--     </a>
            </div>
        </div>--%>
        <div class='content'>
            <div class='mota2'>
                <asp:Literal ID="ltrMoTa" runat="server"></asp:Literal>
            </div>
        </div>
    </div>

    <div class="chiTietVaDatHang">
        <div class="tenSanPham">
            <h1>
                <asp:Literal ID="ltrTenSanPham" runat="server"></asp:Literal></h1>
        </div>
        <div class="giaSanPham">
            <span>Đơn giá:&nbsp<span style="color: red"><asp:Literal ID="Literal1" runat="server"></asp:Literal></span><asp:Literal ID="ltrGiaSanPham" runat="server"></asp:Literal>
                đồng</span>
        </div>
        <div class="thongTinPhu">
            <div class="size">
                <label>Kích thước:&nbsp</label>
                <asp:Literal ID="ltrKichThuoc" runat="server"></asp:Literal>
            </div>
            <div class="mausac">
                <label>Màu sắc:&nbsp</label>
                <asp:Literal ID="ltrMauSac" runat="server"></asp:Literal>
            </div>
            <div class="chatlieu">
                <label>Chất liệu:&nbsp</label>
                <asp:Literal ID="ltrChatLieu" runat="server"></asp:Literal>
            </div>
            <div class="soluong">
                <label>Số lượng:&nbsp</label>
                <input onchange="ThanhTien()" id="quantity" type="number" name="quantity" min="1" value="1" class="tc item-quantity">&nbsp
                 <label>Thành tiền:&nbsp</label>
                <span class="thanhtien" runat="server">0</span>
                VNĐ
            </div>
        </div>
        <div class="row">
            <div class="giohangsp">
                <a href="javascript:ThemVaoGioHang()" style="text-decoration: none">
                    <div id="add-to-cart" class="btn-detailgiohang btn-color-add" style="width: 200px">Thêm vào giỏ hàng</div>
                </a>
            </div>
            <div class="muangay">
                <a href="javascript:MuaNgay()" style="text-decoration: none">
                    <div id="buy-now" class="btn-detail btn-color-buy" style="width: 200px">Mua ngay</div>
                </a>
            </div>
        </div>

          <style>
            .fb_iframe_widget, .fb_iframe_widget span, .fb_iframe_widget span iframe[style] {
                min-width: 100% !important;
                width: 100% !important;
            }
        </style>
        <div class="row">
            <asp:Literal ID="facebook" runat="server"></asp:Literal>
           <%-- <div class="fb-comments" data-href="http://localhost:13237/GiaodienUser/UserPage.aspx?modul=TinTuc&modulcon=ChiTietTinTuc&id=" data-numposts="10" data-width="100%" data-colorscheme="light"></div>--%>
        </div>
    </div>
    <script type="text/javascript">
        /*js xác định xem ảnh ngang hay học
        ================Cấu trúc khu vực chứa ảnh. Trong đó có thể thay khungAnhCrop thành khungAnhCrop0 tùy kiểu cắt ảnh================
        Trong đó item là div ngoài cùng có tác dụng fix width, các khối trong sẽ theo width 100%
        Khi cần tùy chỉnh ở các khu vực khác thì chỉ cần chỉnh width của item và .khungAnh:before{padding-bottom:66%}
        (66% là tỷ lệ height/width của khung ảnh)
        <div class="item3">
            <div class="khungAnh3">
                <a class="khungAnhCrop3" href="#" title="Pic 1">
                    <img alt="Pic 1" src="pic_test/1.jpg"/>
                </a>
            </div>
        </div>
        ================Các thông số chỉnh sửa cho phần khung ảnh tùy theo yêu cầu================
        .item{width:30%}
        .khungAnh:before{padding-bottom:66%}
        */
        $(window)
            .load(function () {
                $(".khungAnh3Crop img")
                    .each(function () {
                        $(this)
                            .removeClass("wide tall")
                            .addClass((this.width / this.height > $(this).parent().width() / $(this).parent().height())
                                ? "wide"
                                : "tall");
                    });
            });
        $(window)
         .load(function () {
             $(".khungAnhCrop1 img")
                 .each(function () {
                     $(this)
                         .removeClass("wide tall")
                         .addClass((this.width / this.height > $(this).parent().width() / $(this).parent().height())
                             ? "wide"
                             : "tall");
                 });
         });
        /*Gọi qua Ajax thì viết thêm đoạn sau vào chỗ sau khi ajax load thành công để xử lý các ảnh được load về sau khi gọi ajax - đoạn cate_igid là là id của khối có nội dung load về qua ajax*/
        /*
        $("#cate_" + igid + " .khungAnhCrop img").load(function () {
            $(this).removeClass("wide tall").addClass((this.width / this.height > $(this).parent().width() / $(this).parent().height()) ? "wide" : "tall");
        });
        */
    </script>

    <%-- Các script xử lý giỏ hàng--%>
    <script type="text/javascript">
        function ThemVaoGioHang() {
            var id = "<%=id%>";
            var soluong = $("#quantity").val();
            $.post("/GiaodienUser/SanPham/Ajax/SanPhamGioHang.aspx",
                {
                    "ThaoTac": "ThemVaoGioHang",
                    "id": id,
                    "soluong": soluong
                }, function (data, status) {
                    if (data == "") { alert("Đã thêm vào giỏ hàng thành công") } else
                    {
                        alert(data);
                    }
                })
        }

        function MuaNgay() {
            var id = "<%=id%>";
            var soluong = $("#quantity").val();
            $.post("/GiaodienUser/SanPham/Ajax/SanPhamGioHang.aspx",
                {
                    "ThaoTac": "ThemVaoGioHang",
                    "id": id,
                    "soluong": soluong
                }, function (data, status) {
                    if (data == "") {
                        alert("Đã thêm vào giỏ hàng thành công")
                        location.href = "UserPage.aspx?modul=SanPham&modulcon=GioHang";
                    } else
                    {
                        alert(data);
                    }
                })
        }
        function ThanhTien() {
            var id = "<%=id%>";
            var soluong = $("#quantity").val();
                    $.post("/GiaodienUser/SanPham/Ajax/SanPhamGioHang.aspx",
                        {
                            "ThaoTac": "ThanhTien",
                            "id": id,
                            "soluong": soluong
                        }, function (data, status) {                     
                                $(".thanhtien").html(data);                            
                        })
        }
        ThanhTien();

    </script>
    <script>
        window.fbAsyncInit = function () {
            FB.init({
                appId: '376317512764963',
                xfbml: true,
                version: 'v2.5'
            });
        };

        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) { return; }
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>
</div>
