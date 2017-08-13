<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChiTietTinTuc.ascx.cs" Inherits="Database_thaotaccsdl.GiaodienUser.TinTuc.ChiTietTinTuc" %>
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
        <asp:Literal ID="ltrAnhTinTuc" runat="server"></asp:Literal>
        <%--     </a>
            </div>
        </div>--%>
        <div class='content'>
            <div class='date' style="font: normal 14px HelveticaNeue; color: #ac0a2c; padding-top: 20px">
                Ngày đăng:
                <asp:Literal ID="ltrNgayDang" runat="server"></asp:Literal>
            </div>
            <div class='date' style="font: normal 14px HelveticaNeue; color: #ac0a2c; padding-top: 10px">
                Số lượt theo dõi:
                <asp:Literal ID="ltrLuotXem" runat="server"></asp:Literal>
            </div>
        </div>
    </div>

    <div class="chiTietVaDatHang">
        <div class="tenSanPham">
            <h1>
                <asp:Literal ID="ltrTieuDeTin" runat="server"></asp:Literal></h1>
        </div>
        <p class="titleitem2" style="font: normal 14px HelveticaNeue; color: #ff0000; padding-left: 10px">
            <span></span>Tin cùng chuyên mục :&nbsp
            <asp:Literal ID="ltrTenChuyenMuc" runat="server"></asp:Literal>
        </p>
        <%-- <div class="giaSanPham"><span>Đơn giá:&nbsp<span style="color:red"><asp:Literal ID="Literal1" runat="server" ></asp:Literal></span><asp:Literal ID="ltrGiaSanPham" runat="server" ></asp:Literal> đồng</span></div>--%>
        <asp:Literal ID="ltrTinLienQuan" runat="server"></asp:Literal>
    </div>
    <div class="noiDungTin">
        <div class="thongTinPhu">
            <div class='content'>
                <div class='mota2'>
                    <asp:Literal ID="ltrNoiDungTin" runat="server"></asp:Literal>
                </div>
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

</div>
