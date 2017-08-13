<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Mau_HienThi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.SanPham.QuanLyMau.Mau_HienThi" %>
<div class="head">Danh sách màu cho sản phẩm đã tạo<a class="themmoi" href="/Admin.aspx?module=SanPham&submodule=Mau&action=ThemMoi">Thêm mới</a></div>
<div class="khungChuaBang">
    <%--<asp:GridView ID="GridView1" runat="server"></asp:GridView>--%>
    <table id="example" class="mdl-data-table">
        <thead>
            <tr>
                <th>Mã màu</th>
                <th>Tên màu sản phẩm</th>
                <th>Số lượng sản phẩm đang có</th>
                <th>Công cụ</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Mã</th>
                <th>Tên màu sản phẩm</th>
                <th>Số lượng sản phẩm đang có</th>
                <th>Công cụ</th>
            </tr>
        </tfoot>
        <tbody>
            <asp:Literal ID="ltrMau" runat="server"></asp:Literal>
        </tbody>


    </table>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#example').DataTable({
            columnDefs: [
                {
                    targets: [0],
                    className: 'mdl-data-table__cell--non-numeric'
                }
            ]
        });
    });</script>
<script type="text/javascript">
    //xảy ra 2 khả năng :
    //1 là: sản phẩm có màu này đã đc phát sinh đơn đặt hàng không thể xóa, cần hỏi lại người dùng ?
    //2 là: ... yêu cầu ng dùng xóa từng sp một.
    function XoaMau(Ma) {
        if (confirm("Bạn có chắc muốn xóa thông tin màu này không?")) {
            alert("Xóa màu có mã: " + Ma);
            $.post("cms/admin/SanPham/QuanLyMau/Ajax/Mau.aspx",
                {
                    "ThaoTac": "XoaMau", "Ma": Ma
                },
                function (data, status) {
                    //alert("Data: " + data + "\nStatus: " + status);
                    if (data == 1) {
                        $("#maDong_" + Ma).slideUp();
                        alert("Xóa thành công")
                    } else if (data == 2) {
                        //alert("Lỗi phát sinh: Có Sản Phẩm chứa màu này, xóa hết Sản Phẩm chứa màu này mới có thể xóa màu")
                        if (confirm("Lỗi phát sinh: Có Sản Phẩm chứa màu này, xóa hết Sản Phẩm chứa màu này mới có thể xóa màu, bạn có muốn xóa không?")) {
                            alert("Xóa màu có mã: " + Ma);
                            $.post("cms/admin/SanPham/QuanLyMau/Ajax/Mau.aspx",
                                {
                                    "Action": "XoaSanPham", "Ma1": Ma
                                },
                                function (data, status) {
                                    //alert("Data: " + data + "\nStatus: " + status);
                                    if (data == 1) {
                                        $("#maDong_" + Ma).slideUp();
                                        alert("Xóa thành công, tất cả sản phẩm chứa màu này cũng bị xóa theo")
                                    } else if (data == 2) {
                                        alert("Lỗi không thể xóa :SP chứa màu này đang phát sinh đơn đặt hàng và vì thế bạn phải xóa đơn đặt hàng trước đã")

                                    }
                                    else { alert("Không thấy màu để xóa") }

                                }
                                )
                        }

                    }
                    else { alert("Không thành công") }

                }
                )
        }


    }
</script>
