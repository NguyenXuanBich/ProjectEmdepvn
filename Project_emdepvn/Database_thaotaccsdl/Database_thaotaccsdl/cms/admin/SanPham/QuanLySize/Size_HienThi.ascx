<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Size_HienThi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.SanPham.QuanLySize.Size_HienThi" %>
<div class="head">Danh sách size cho sản phẩm đã tạo<a class="themmoi" href="/Admin.aspx?module=SanPham&submodule=Size&action=ThemMoi">Thêm mới</a></div>
<div class="khungChuaBang">
    <%--<asp:GridView ID="GridView1" runat="server"></asp:GridView>--%>
    <table id="example" class="mdl-data-table">
        <thead>
            <tr>
                <th>Mã kích cỡ</th>
                <th>Tên kích cỡ</th>
                <th>Số lượng sản phẩm đang có</th>
                <th>Công cụ</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Mã kích cỡ</th>
                <th>Tên kích cỡ</th>
                <th>Số lượng sản phẩm đang có</th>
                <th>Công cụ</th>
            </tr>
        </tfoot>
        <tbody>
            <asp:Literal ID="ltrSize" runat="server"></asp:Literal>
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
    //1 là: sản phẩm có size này đã đc phát sinh đơn đặt hàng không thể xóa, cần hỏi lại người dùng ?
    //2 là: ... yêu cầu ng dùng xóa từng sp một.
    function XoaSize(Ma) {
        if (confirm("Bạn có chắc muốn xóa thông tin size này không?")) {
            alert("Xóa size có mã: " + Ma);
            $.post("cms/admin/SanPham/QuanLySize/Ajax/Size.aspx",
                {
                    "ThaoTac": "XoaSize", "Ma": Ma
                },
                function (data, status) {
                    //alert("Data: " + data + "\nStatus: " + status);
                    if (data == 1) {
                        $("#maDong_" + Ma).slideUp();
                        alert("Xóa thành công")
                    } else if (data == 2) {
                        //alert("Lỗi phát sinh: Có Sản Phẩm chứa size này, xóa hết Sản Phẩm chứa size này mới có thể xóa size")
                        if (confirm("Lỗi phát sinh: Có Sản Phẩm chứa size này, xóa hết Sản Phẩm chứa size này mới có thể xóa size, bạn có muốn xóa không?")) {
                            alert("Xóa size có mã: " + Ma);
                            $.post("cms/admin/SanPham/QuanLySize/Ajax/Size.aspx",
                                {
                                    "Action": "XoaSanPham", "Ma1": Ma
                                },
                                function (data, status) {
                                    //alert("Data: " + data + "\nStatus: " + status);
                                    if (data == 1) {
                                        $("#maDong_" + Ma).slideUp();
                                        alert("Xóa thành công, tất cả sản phẩm chứa size này cũng bị xóa theo")
                                    } else if (data == 2) {
                                        alert("Lỗi không thể xóa :SP chứa size này đang phát sinh đơn đặt hàng và vì thế bạn phải xóa đơn đặt hàng trước đã")

                                    }
                                    else { alert("size không tồn tại ") }

                                }
                                )
                        }

                    }
                    else { alert("size không tồn tại ") }

                }
                )
        }


    }
</script>
