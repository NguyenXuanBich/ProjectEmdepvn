<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NhomSanPham_HienThi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.SanPham.QuanLyNhomSanPham.NhomSanPham_HienThi" %>
<div class="head">Các Nhóm sản phẩm đã tạo<a class="themmoi" href="/Admin.aspx?module=SanPham&submodule=Nhom&action=ThemMoi">Thêm mới</a></div>
<div class="khungChuaBang">
    <%--<asp:GridView ID="GridView1" runat="server"></asp:GridView>--%>
    <table id="example" class="mdl-data-table">
        <thead>
            <tr>
                <th>Mã</th>
                <th>Tên Nhóm</th>
                <th>Tổng lượng sản phẩm</th>
                <th>Ảnh đại diện</th>
                <th>Thứ tự</th>
                <th>Số SP Hiển thị</th>
                <th>Công cụ</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Mã</th>
                <th>Tên Nhóm</th>
                <th>Tổng lượng sản phẩm</th>
                <th>Ảnh đại diện</th>
                <th>Thứ tự</th>
                <th>Số SP Hiển thị</th>
                <th>Công cụ</th>
            </tr>
        </tfoot>
        <tbody>
            <asp:Literal ID="ltrNhomSP" runat="server"></asp:Literal>
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
    //1 là: sản phẩm trong Nhóm này đã đc phát sinh đơn đặt hàng không thể xóa, cần hỏi lại người dùng ?
    //2 là: Nhóm này có Nhóm con và + TH1
    function XoaNhomSanPham(MaNhom) {
        if (confirm("Bạn có chắc muốn xóa không?")) {
            alert("Xóa Nhóm" + MaNhom);
            $.post("cms/admin/SanPham/QuanLyNhomSanPham/Ajax/NhomSanPham.aspx",
                {
                    "ThaoTac": "XoaNhomSanPham", "MaNhom": MaNhom
                },
                function (data, status) {
                    //alert("Data: " + data + "\nStatus: " + status);
                    if (data == 1) {
                        $("#MaDong_" + MaNhom).slideUp();
                        alert("Xóa thành công")
                    }
                    else if (data == 2) {
                        //alert("Lỗi phát sinh: Có Sản Phẩm trong Nhóm này, xóa hết Sản Phẩm của DM này mới có thể xóa DM này")
                        if (confirm("Lỗi phát sinh: Có Sản Phẩm trong Nhóm này, xóa hết Sản Phẩm của Nhóm này mới có thể xóa Nhóm này, bạn có muốn xóa không?")) {
                            alert("Xóa Nhóm" + MaNhom);
                            $.post("cms/admin/SanPham/QuanLyNhomSanPham/Ajax/NhomSanPham.aspx",
                                {
                                    "Action": "XoaSanPham", "Ma": MaNhom
                                },
                                function (data, status) {
                                    //alert("Data: " + data + "\nStatus: " + status);
                                    if (data == 1) {
                                        $("#MaDong_" + MaNhom).slideUp();
                                        alert("Xóa thành công, tất cả sản phẩm trong Nhóm cũng bị xóa theo")
                                    } else if (data == 2) {
                                        alert("Lỗi không thể xóa :SP trong Nhóm này đang phát sinh đơn đặt hàng và vì thế bạn phải xóa đơn đặt hàng mới có thể xóa Nhóm này")

                                    }
                                    else { alert("Nhóm không tồn tại") }

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
