<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DanhMuc_HienThi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.SanPham.QuanLyDanhMuc.DanhMuc_HienThi" %>
<div class="head">Các danh mục sản phẩm đã tạo<a class="themmoi" href="/Admin.aspx?module=SanPham&submodule=DanhMuc&action=ThemMoi">Thêm mới</a></div>
<div class="khungChuaBang">
    <%--<asp:GridView ID="GridView1" runat="server"></asp:GridView>--%>
    <table id="example" class="mdl-data-table">
        <thead>
            <tr>
                <th>Mã</th>
                <th>Tên danh mục</th>
                <th>Tổng lượng sản phẩm</th>
                <th>Lượng sản phẩm riêng</th>
                <th>Ảnh đại diện</th>
                <th>Thứ tự</th>
                <th>Công cụ</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Mã</th>
                <th>Tên danh mục</th>
                <th>Tổng lượng sản phẩm</th>
                <th>Lượng sản phẩm riêng</th>
                <th>Ảnh đại diện</th>
                <th>Thứ tự</th>
                <th>Công cụ</th>
            </tr>
        </tfoot>
        <%-- <tr>
            <th class="cotMa">Mã</th>
            <th class="cotTen">Tên danh mục</th>
            <th class="cotAnh">Ảnh đại diện</th>
            <th class="cotThuTu">Thứ tự</th>       
            <th class="cotCongCu">Công cụ</th>    
        </tr>--%>
        <tbody>
            <asp:Literal ID="ltrDanhMuc" runat="server"></asp:Literal>
        </tbody>


    </table>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#example').DataTable({
            columnDefs: [
                {
                    targets: [],
                    className: 'mdl-data-table__cell--non-numeric'
                }
            ]
        });
    });</script>
<script type="text/javascript">
    //xảy ra 2 khả năng :
    //1 là: sản phẩm trong danh mục này đã đc phát sinh đơn đặt hàng không thể xóa, cần hỏi lại người dùng ?
    //2 là: Danh mục này có danh mục con và + TH1
    function XoaDanhMuc(MaDM) {
        if (confirm("Bạn có chắc muốn xóa không?")) {
            alert("Xóa danh mục" + MaDM);
            $.post("cms/admin/SanPham/QuanLyDanhMuc/Ajax/DanhMuc.aspx",
                {
                    "ThaoTac": "XoaDanhMuc", "MaDM": MaDM
                },
                function (data, status) {
                    //alert("Data: " + data + "\nStatus: " + status);
                    if (data == 1) {
                        $("#MaDong_" + MaDM).slideUp();
                        alert("Xóa thành công")
                    }
                    else if (data == 3) {
                        alert("Danh mục này có danh mục con bên trong, xóa hết danh mục con mới được hoàn tất thao tác này")
                    }
                    else if (data == 2) {
                        //alert("Lỗi phát sinh: Có Sản Phẩm trong danh mục này, xóa hết Sản Phẩm của DM này mới có thể xóa DM này")
                        if (confirm("Lỗi phát sinh: Có Sản Phẩm trong danh mục này, xóa hết Sản Phẩm của DM này mới có thể xóa DM này, bạn có muốn xóa không?")) {
                            alert("Xóa danh mục" + MaDM);
                            $.post("cms/admin/SanPham/QuanLyDanhMuc/Ajax/DanhMuc.aspx",
                                {
                                    "Action": "XoaSanPham", "Ma": MaDM
                                },
                                function (data, status) {
                                    //alert("Data: " + data + "\nStatus: " + status);
                                    if (data == 1) {
                                        $("#MaDong_" + MaDM).slideUp();
                                        alert("Xóa thành công, tất cả sản phẩm trong danh mục cũng bị xóa theo")
                                    } else if (data == 2) {
                                        alert("Lỗi không thể xóa :SP trong DM này đang phát sinh đơn đặt hàng và vì thế bạn phải xóa đơn đặt hàng mới có thể xóa danh mục này")

                                    }
                                    else { alert("Danh mục không tồn tại") }

                                }
                                )
                        }

                    }
                    else { alert("Không thành công.") }

                }
                )
        }


    }
</script>
