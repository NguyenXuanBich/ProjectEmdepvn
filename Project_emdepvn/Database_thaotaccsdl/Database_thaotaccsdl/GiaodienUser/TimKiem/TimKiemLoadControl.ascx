<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TimKiemLoadControl.ascx.cs" Inherits="Database_thaotaccsdl.GiaodienUser.TimKiem.TimKiemLoadControl" %>
<div class="cotPhai">
    <script src="../../cms/admin/js/jquery-1.11.3.min.js"></script>
    <link href="../../cms/admin/css/Default.css" rel="stylesheet" />
    <script type="text/javascript">
        /*js xác định xem ảnh ngang hay học
        ================Cấu trúc khu vực chứa ảnh. Trong đó có thể thay khungAnhCrop thành khungAnhCrop0 tùy kiểu cắt ảnh================
        Trong đó item là div ngoài cùng có tác dụng fix width, các khối trong sẽ theo width 100%
        Khi cần tùy chỉnh ở các khu vực khác thì chỉ cần chỉnh width của item và .khungAnh:before{padding-bottom:66%}
        (66% là tỷ lệ height/width của khung ảnh)
        <div class="item">
            <div class="khungAnh">
                <a class="khungAnhCrop" href="#" title="Pic 1">
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
                $(".khungAnhCrop img")
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
    <div class="hangMoiVeHotNhat">
        <div class="baongoai">
            <link href="../../cms/admin/css/Default.css" rel="stylesheet" />
            <asp:PlaceHolder ID="plSearchByAll" runat="server"></asp:PlaceHolder>
        </div>


    </div>
</div>
