<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SanPhamHienThiTrangChu.ascx.cs" Inherits="Database_thaotaccsdl.GiaodienUser.SanPham.SanPhamHienThiTrangChu" %>
<script src="../../cms/admin/js/jquery-1.11.3.min.js"></script>
 <div class="Slide">
            <!-- #region Jssor Slider Begin -->
            <!-- Generator: Jssor Slider Maker -->
            <!-- Source: http://www.jssor.com -->
            <!-- This code works with jquery library. -->
            <script src="../cms/JCaroselSlide/js/jquery-1.11.3.min.js" type="text/javascript"></script>
            <script src="../cms/JCaroselSlide/js/jssor.slider-22.1.9.mini.js" type="text/javascript"></script>
            <script src="../cms/JCaroselSlide/js/jssor.slider-22.1.9.min.js" type="text/javascript"></script>
            <script type="text/javascript">
                jQuery(document).ready(function ($) {

                    var jssor_1_SlideshowTransitions = [
                      { $Duration: 1200, $Opacity: 2 }
                    ];

                    var jssor_1_options = {
                        $AutoPlay: true,
                        $SlideshowOptions: {
                            $Class: $JssorSlideshowRunner$,
                            $Transitions: jssor_1_SlideshowTransitions,
                            $TransitionsOrder: 1
                        },
                        $ArrowNavigatorOptions: {
                            $Class: $JssorArrowNavigator$
                        },
                        $BulletNavigatorOptions: {
                            $Class: $JssorBulletNavigator$
                        }
                    };

                    var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

                    /*responsive code begin*/
                    /*you can remove responsive code if you don't want the slider scales while window resizing*/
                    function ScaleSlider() {
                        var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
                        if (refSize) {
                            refSize = Math.min(refSize, 600);
                            jssor_1_slider.$ScaleWidth(refSize);
                        }
                        else {
                            window.setTimeout(ScaleSlider, 30);
                        }
                    }
                    ScaleSlider();
                    $(window).bind("load", ScaleSlider);
                    $(window).bind("resize", ScaleSlider);
                    $(window).bind("orientationchange", ScaleSlider);
                    /*responsive code end*/
                });
            </script>
            <style>
                /* jssor slider bullet navigator skin 05 css */
                /*
        .jssorb05 div           (normal)
        .jssorb05 div:hover     (normal mouseover)
        .jssorb05 .av           (active)
        .jssorb05 .av:hover     (active mouseover)
        .jssorb05 .dn           (mousedown)
        */
                .jssorb05 {
                    position: absolute;
                }

                    .jssorb05 div, .jssorb05 div:hover, .jssorb05 .av {
                        position: absolute;
                        /* size of bullet elment */
                        width: 16px;
                        height: 16px;
                        background: url('img/b05.png') no-repeat;
                        overflow: hidden;
                        cursor: pointer;
                    }

                    .jssorb05 div {
                        background-position: -7px -7px;
                    }

                        .jssorb05 div:hover, .jssorb05 .av:hover {
                            background-position: -37px -7px;
                        }

                    .jssorb05 .av {
                        background-position: -67px -7px;
                    }

                    .jssorb05 .dn, .jssorb05 .dn:hover {
                        background-position: -97px -7px;
                    }

                /* jssor slider arrow navigator skin 12 css */
                /*
        .jssora12l                  (normal)
        .jssora12r                  (normal)
        .jssora12l:hover            (normal mouseover)
        .jssora12r:hover            (normal mouseover)
        .jssora12l.jssora12ldn      (mousedown)
        .jssora12r.jssora12rdn      (mousedown)
        */
                .jssora12l, .jssora12r {
                    display: block;
                    position: absolute;
                    /* size of arrow element */
                    width: 30px;
                    height: 46px;
                    cursor: pointer;
                    background: url('/cms/JCaroselSlide/img/a12.png') no-repeat;
                    overflow: hidden;
                }

                .jssora12l {
                    background-position: -16px -37px;
                }

                .jssora12r {
                    background-position: -75px -37px;
                }

                .jssora12l:hover {
                    background-position: -136px -37px;
                }

                .jssora12r:hover {
                    background-position: -195px -37px;
                }

                .jssora12l.jssora12ldn {
                    background-position: -256px -37px;
                }

                .jssora12r.jssora12rdn {
                    background-position: -315px -37px;
                }
            </style>

            <div id="jssor_1" style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 600px; height: 300px; overflow: hidden; visibility: hidden;">
                <!-- Loading Screen -->
                <div data-u="loading" style="position: absolute; top: 0px; left: 0px; background-color: rgba(0,0,0,0.7);">
                    <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
                    <div style="position: absolute; display: block; background: url('img/loading.gif') no-repeat center center; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
                </div>
                <div data-u="slides" style="cursor: default; position: relative; top: 0px; left: 0px; width: 600px; height: 300px; overflow: hidden;">
 <%--                   <div>
                        <img data-u="image" src="/cms/JCaroselSlide/img/02.jpg" />
                    </div>--%>
                    <a data-u="any" href="http://www.jssor.com" style="display: none">Simple Fade Slideshow</a>   
                    <asp:Literal ID="ltSlide" runat="server"></asp:Literal>
                </div>
                <!-- Bullet Navigator -->
                <div data-u="navigator" class="jssorb05" style="bottom: 16px; right: 16px;" data-autocenter="1">
                    <!-- bullet navigator item prototype -->
                    <div data-u="prototype" style="width: 16px; height: 16px;"></div>
                </div>
                <!-- Arrow Navigator -->
                <span data-u="arrowleft" class="jssora12l" style="top: 0px; left: 0px; width: 30px; height: 46px;" data-autocenter="2"></span>
                <span data-u="arrowright" class="jssora12r" style="top: 0px; right: 0px; width: 30px; height: 46px;" data-autocenter="2"></span>
            </div>
            <!-- #endregion Jssor Slider End -->
        </div>
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
            
                   <asp:Literal ID="ltrNhomSanPham" runat="server"></asp:Literal>
        
        </div>