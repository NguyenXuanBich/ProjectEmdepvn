<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TrangChuLoadControl.ascx.cs" Inherits="Database_thaotaccsdl.GiaodienUser.TrangChuHienThi.TrangChuLoadControl" %>
<link href="../../cms/admin/css/Default.css" rel="stylesheet" />
<script src="../../cms/admin/js/jquery-1.11.3.min.js"></script>
<link href="../../cms/jCarousel/style.css" rel="stylesheet" />
<script type="text/javascript">
    /*CSS dùng chung Công ty cổ phần dịch vụ Tất Thành
    js xác định xem ảnh ngang hay dọc
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
<script type="text/javascript">
    /*CSS dùng chung Công ty cổ phần dịch vụ Tất Thành
    js xác định xem ảnh ngang hay dọc
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
            $(".khungAnhhotCrop img")
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
<div id="hotAndadvertisement">
    <div class="container980">
        <div class="hotAndadvertisementTop">
            <div class="hotNew">
                <div class="titleitem">
                    Tin mới  
                    <div class="timetoday">
                        <script type="text/javascript">
                            dayName = new Array("C-nhật", "Thứ hai", "Thứ ba", "Thứ tư", "Thứ năm", "Thứ sáu", "Thứ bảy")
                            monName = new Array("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12")
                            now = new Date
                            document.write("<font id=timedate color=#808080></b> Tin mới ngày " + dayName[now.getDay()] + ", " + now.getDate() + "-" + monName[now.getMonth()] + "-" + now.getFullYear() + "</b></font>")
                        </script>
                    </div>
                    <span></span>
                </div>
                <div class="contentitem">
                    <div class="slideproduce">
                        <script src="/cms/jCarousel/js/jssor.slider-22.0.15.min.js" type="text/javascript" data-library="jssor.slider" data-version="22.0.15"></script>
                        <script type="text/javascript">
                            jssor_1_slider_init = function () {

                                var jssor_2_options = {
                                    $AutoPlay: true,
                                    $AutoPlaySteps: 1,
                                    $SlideDuration: 960,
                                    $SlideWidth: 490,
                                    $SlideSpacing: 20,
                                    $Cols: 1,
                                    $ArrowNavigatorOptions: {
                                        $Class: $JssorArrowNavigator$,
                                        $Steps: 1
                                    },
                                    $BulletNavigatorOptions: {
                                        $Class: $JssorBulletNavigator$,
                                        $SpacingX: 1,
                                        $SpacingY: 1
                                    }
                                };

                                var jssor_2_slider = new $JssorSlider$("jssor_2", jssor_2_options);

                                /*responsive code begin*/
                                /*you can remove responsive code if you don't want the slider scales while window resizing*/
                                function ScaleSlider() {
                                    var refSize = jssor_2_slider.$Elmt.parentNode.clientWidth;
                                    if (refSize) {
                                        refSize = Math.min(refSize, 980);
                                        jssor_2_slider.$ScaleWidth(refSize);
                                    }
                                    else {
                                        window.setTimeout(ScaleSlider, 30);
                                    }
                                }
                                ScaleSlider();
                                $Jssor$.$AddEvent(window, "load", ScaleSlider);
                                $Jssor$.$AddEvent(window, "resize", ScaleSlider);
                                $Jssor$.$AddEvent(window, "orientationchange", ScaleSlider);
                                /*responsive code end*/
                            };
                        </script>

                        <div id="jssor_2" style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 490px; height: 340px; overflow: hidden; visibility: hidden;">
                            <!-- Loading Screen -->
                            <div data-u="loading" style="position: absolute; top: 0px; left: 0px;">
                                <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
                                <div style="position: absolute; display: block; background: url('jCarousel/img/loading.gif') no-repeat center center; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
                            </div>
                            <div data-u="slides" style="cursor: default; position: relative; top: 0px; left: 0px; width: 980px; height: 307px; overflow: hidden;">
                                <a data-u="any" href="http://www.jssor.com" style="display: none">Carousel</a>
                                <%--  <div class="eachproduce">
                                    <img data-u="image" src="/cms/jCarousel/img/sp1.png" />
                                    <div class="more">
                                        <a class="title" href="#">Ghế ô tô</a>
                                        <a class="learnmore" href="#">Tìm hiểu thêm</a>
                                    </div>
                                </div>--%>
                                <%--  <div class="item">
                                    <div class="khungAnhhot">
                                        <a class="khungAnhhotCrop" href="#" title="Pic 1">
                                             <img data-u="image" src="/cms/jCarousel/img/sp1.png" />
                                        </a>
                                         <div class="more">
                                        <a class="title" href="#">Ghế ô tô</a>
                                        <a class="learnmore" href="#">Xem chi tiết</a>
                                    </div>
                                    </div>                                  
                                </div>--%>
                                <asp:Literal ID="ltrTinHot" runat="server"></asp:Literal>
                                <%--         <div style="display: none;">
                                    <img data-u="image" src="/cms/jCarousel/img/sp2.png" />
                                    <div class="more">
                                        <a class="title" href="#">Ghế Sofa</a>
                                        <a class="learnmore" href="#">Tìm hiểu thêm</a>
                                    </div>
                                </div>
                                <div style="display: none;">
                                    <img data-u="image" src="/cms/jCarousel/img/sp3.png" />
                                    <div class="more">
                                        <a class="title" href="#">Giày</a>
                                        <a class="learnmore" href="#">Tìm hiểu thêm</a>
                                    </div>
                                </div>
                                <div style="display: none;">
                                    <img data-u="image" src="/cms/jCarousel/img/sp4.png" />
                                    <div class="more">
                                        <a class="title" href="#">Túi xách</a>
                                        <a class="learnmore" href="#">Tìm hiểu thêm</a>
                                    </div>
                                </div>
                                <div>
                                    <img data-u="image" src="/cms/jCarousel/img/sp5.png" />
                                    <div class="more">
                                        <a class="title" href="#">Ghế ô tô</a>
                                        <a class="learnmore" href="#">Tìm hiểu thêm</a>
                                    </div>
                                </div>
                                <div style="display: none;">
                                    <img data-u="image" src="/cms/jCarousel/img/sp6.png" />
                                    <div class="more">
                                        <a class="title" href="#">Ghế ô tô</a>
                                        <a class="learnmore" href="#">Tìm hiểu thêm</a>
                                    </div>
                                </div>
                                <div style="display: none;">
                                    <img data-u="image" src="/cms/jCarousel/img/sp7.png" />
                                    <div class="more">
                                        <a class="title" href="#">Ghế ô tô</a>
                                        <a class="learnmore" href="#">Tìm hiểu thêm</a>
                                    </div>
                                </div>
                                <div style="display: none;">
                                    <img data-u="image" src="/cms/jCarousel/img/sp8.png" />
                                    <div class="more">
                                        <a class="title" href="#">Ghế ô tô</a>
                                        <a class="learnmore" href="#">Tìm hiểu thêm</a>
                                    </div>
                                </div>--%>
                            </div>
                            <!-- Bullet Navigator -->
                            <div data-u="navigator" class="jssorb03" style="bottom: 10px; right: 10px;">
                                <!-- bullet navigator item prototype -->
                                <div data-u="prototype" style="width: 21px; height: 21px;">
                                    <div data-u="numbertemplate"></div>
                                </div>
                            </div>
                            <!-- Arrow Navigator -->
                            <span data-u="arrowleft" class="jssora03l" data-autocenter="2"></span>
                            <span data-u="arrowright" class="jssora03r" data-autocenter="2"></span>
                        </div>
                        <script type="text/javascript">jssor_1_slider_init();</script>

                        <!--HẾT SLIDE -->


                    </div>
                </div>
            </div>
            <div class="xemNhieu">
                <div class="titleitem">Tin xem nhiều<span></span></div>
                <div class="contentitem">
                    <asp:Literal ID="ltrTinXemNhieu" runat="server"></asp:Literal>
                </div>
            </div>

            <%--quảng cáo phải--%>
            <div class="advertisement1">
                <div class="itemquangcaotrai">
                    <div class="khungAnh" style="height: 385px">
                        <asp:Literal ID="ltquangcaotraitop" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>
            <%-- end quảng cáo--%>
        </div>
    </div>
</div>
<div class="hotAndadvertisementBottom">
    <div class="container980 adngang">
        <div class="advertisement2" style="background: blue">
            <div class="itemquangcaongang">
                <div class="khungAnh" style="height: 128px">
                    <asp:Literal ID="ltrquangcaongang" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="clear"></div>
<div id="lifeAndmarket">
    <div class="container980">
        <div class="lifeAndmarketLeft">
            <div class="lifebig">
                <div class="titleitem" style="padding-left: 10px">
                    Nhịp sống
                        <span></span>
                </div>
                <asp:Literal ID="ltrlifebig" runat="server"></asp:Literal>

            </div>
            <div class="lifesmall">
                <asp:Literal ID="ltrlifesmall" runat="server"></asp:Literal>
            </div>
        </div>


        <div class="lifeAndmarketRight">
            <div class="titleitem" style="padding-left: 10px">
                Thị trường
                        <span></span>
            </div>
            <asp:Literal ID="ltThitruong" runat="server"></asp:Literal>
        </div>
    </div>
</div>
<div class="clear"></div>
<div id="entertaimentAndpreen">
    <div class="container980">
        <div class="entertaiment">
            <div class="titleitem" style="padding-left: 10px">
                Giải trí
                        <span></span>
            </div>
            <asp:Literal ID="ltgiaitri" runat="server"></asp:Literal>

        </div>
        <div class="fashion">
            <div class="titleitem" style="padding-left: 10px">
                Thời trang
                        <span></span>
            </div>
            <asp:Literal ID="ltthoitrang" runat="server"></asp:Literal>

        </div>
        <div class="preen">
            <div class="titleitem" style="padding-left: 10px">
                Làm đẹp
                        <span></span>
            </div>
            <asp:Literal ID="ltlamdep" runat="server"></asp:Literal>

        </div>
    </div>
</div>
<div class="clear"></div>
<div id="healthAndfood">
    <div class="container980">
        <div class="play">
            <div class="titleitem" style="padding-left: 10px">
                Chơi
                        <span></span>
            </div>
            <asp:Literal ID="ltchoi" runat="server"></asp:Literal>

        </div>
        <div class="food">
            <div class="titleitem" style="padding-left: 10px">
                Ăn ngon
                        <span></span>
            </div>
            <asp:Literal ID="ltanngon" runat="server"></asp:Literal>

        </div>
        <div class="health">
            <div class="titleitem" style="padding-left: 10px">
                Sức khỏe
                        <span></span>
            </div>
            <asp:Literal ID="ltsuckhoe" runat="server"></asp:Literal>

        </div>
    </div>
</div>
