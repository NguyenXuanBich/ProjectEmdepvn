<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SanPham_HienThi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.SanPham.QuanLySanPham.SanPham_HienThi" %>

<div class="head">Các sản phẩm đã tạo<a class="themmoi" href="/Admin.aspx?module=SanPham&submodule=QLSanPham&action=ThemMoi">Thêm mới</a></div>
<div class="khungChuaBang">
    <%--<asp:GridView ID="GridView1" runat="server"></asp:GridView>--%>
    <table id="example" class="mdl-data-table">
        <thead>
            <tr>
                <th>Mã</th>
                <th>Tên</th>
                <th>Ảnh</th>
                <th>Màu</th>
                <th>Size</th>
                <th>ChấtLiệu</th>
                <th>Số lượng</th>
                <th>Đơn giá</th>
                <th>Giá nhập</th>
                <%--<th class="cotMoTaSP">Mô tả sản phẩm</th>--%>
                <%-- <th>Ngày tạo</th>
                <th>Ngày hủy</th>--%>
                <th>Các công cụ</th>
                <%--<th class="cotMaDM">Mã d mục</th>
            <th class="cotNhomID">Nhóm ID</th>--%>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Mã</th>
                <th>Tên</th>
                <th>Ảnh</th>
                <th>Màu</th>
                <th>Size</th>
                <th>ChấtLiệu</th>
                <th>Số lượng</th>
                <th>Đơn giá</th>
                <th>Giá nhập</th>
                <%--<th class="cotMoTaSP">Mô tả sản phẩm</th>--%>
                <%-- <th>Ngày tạo</th>
                <th>Ngày hủy</th>--%>
                <th>Các công cụ</th>
                <%--<th class="cotMaDM">Mã d mục</th>
            <th class="cotNhomID">Nhóm ID</th>--%>
            </tr>
        </tfoot>

        <tbody>
            <asp:Literal ID="ltrDanhSachSanPham" runat="server"></asp:Literal>
        </tbody>


    </table>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#example').DataTable({
            columnDefs: [
                {
                    targets: [1, 2, 8],
                    className: 'mdl-data-table__cell--non-numeric'
                }
            ]
        });
    });</script>

<script type="text/javascript">
    function XoaSanPham(MaSP) {

        if (confirm("Bạn có muốn xóa sản phẩm này?")) {
            alert("Xóa id" + MaSP);
            $.post("cms/admin/SanPham/QuanLySanPham/Ajax/SanPham.aspx",
                {
                    "ThaoTac": "XoaSanPham", "MaSP": MaSP
                },
                function (data, status) {
                    //alert("Data: " + data + "\nStatus: " + status);
                    if (data == 1) {
                        $("#MaDong_" + MaSP).slideUp();
                        alert("Xóa thành công")
                    } else if (data == 2) {
                        alert("Lỗi không được xóa: Sản phẩm này đang phát sinh đơn hàng, bạn cần xóa đơn hàng trước")
                    } else {
                        alert("Không tìm thấy id cần xóa")
                    }

                }
                )
        }
    }
</script>
