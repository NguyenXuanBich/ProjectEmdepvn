<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChatLieu_HienThi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.SanPham.QuanLyChatLieu.ChatLieu_HienThi" %>
<div class="head">Danh sách chất liệu cho sản phẩm đã tạo<a class="themmoi" href="/Admin.aspx?module=SanPham&submodule=ChatLieu&action=ThemMoi">Thêm mới</a></div>
<div class="khungChuaBang">
    <%--<asp:GridView ID="GridView1" runat="server"></asp:GridView>--%>
    <table id="example" class="mdl-data-table">
        <thead>
            <tr>
                <th>Mã chất liệu</th>
                <th>Tên chất liệu sản phẩm</th>
                <th>Số lượng sản phẩm đang có</th>
                <th>Công cụ</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Mã</th>
                <th>Tên chất liệu sản phẩm</th>
                <th>Số lượng sản phẩm đang có</th>
                <th>Công cụ</th>
            </tr>
        </tfoot>
        <tbody>
            <asp:Literal ID="ltrChatlieu" runat="server"></asp:Literal>
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
    //1 là: sản phẩm có chất liệu này đã đc phát sinh đơn đặt hàng không thể xóa, cần hỏi lại người dùng ?
    //2 là: ... yêu cầu ng dùng xóa từng sp một.
    function XoaChatLieu(Ma) {
        if (confirm("Bạn có chắc muốn xóa thông tin chất liệu này không?")) {
            alert("Xóa chất liệu có mã: " + Ma);
            $.post("cms/admin/SanPham/QuanLyChatLieu/Ajax/ChatLieu.aspx",
                {
                    "ThaoTac": "XoaChatLieu", "Ma": Ma
                },
                function (data, status) {
                    //alert("Data: " + data + "\nStatus: " + status);
                    if (data == 1) {
                        $("#maDong_" + Ma).slideUp();
                        alert("Xóa thành công")
                    } else if (data == 2) {
                        //alert("Lỗi phát sinh: Có Sản Phẩm chứa CHẤT LIỆU này, xóa hết Sản Phẩm chứa CHẤT LIỆU này mới có thể xóa CHẤT LIỆU")
                        if (confirm("Lỗi phát sinh: Có Sản Phẩm chứa CHẤT LIỆU này, xóa hết Sản Phẩm chứa CHẤT LIỆU này mới có thể xóa CHẤT LIỆU, bạn có muốn xóa không?")) {
                            alert("Xóa chất liệu có mã: " + Ma);
                            $.post("cms/admin/SanPham/QuanLyChatLieu/Ajax/ChatLieu.aspx",
                                {
                                    "Action": "XoaSanPham", "Ma1": Ma
                                },
                                function (data, status) {
                                    //alert("Data: " + data + "\nStatus: " + status);
                                    if (data == 1) {
                                        $("#maDong_" + Ma).slideUp();
                                        alert("Xóa thành công, tất cả sản phẩm chứa Chất Liệu này cũng bị xóa theo")
                                    } else if (data == 2) {
                                        alert("Lỗi không thể xóa :SP chứa Chất Liệu này đang phát sinh đơn đặt hàng và vì thế bạn phải xóa đơn đặt hàng trước đã")

                                    }
                                    else { alert("Chất Liệu không tồn tại ") }

                                }
                                )
                        }

                    }
                    else { alert("Không thành công ") }

                }
                )
        }


    }
</script>
