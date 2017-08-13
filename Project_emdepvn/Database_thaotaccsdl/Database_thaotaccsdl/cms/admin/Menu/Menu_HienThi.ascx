<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Menu_HienThi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.Menu.Menu_HienThi" %>
<div class="head">Các danh mục Menu đã tạo<a class="themmoi" href="/Admin.aspx?module=Menu&action=ThemMenu">Thêm mới</a></div>
<div class="khungChuaBang">
    <%--<asp:GridView ID="GridView1" runat="server"></asp:GridView>--%>
    <table id="example" class="mdl-data-table">
        <thead>
            <tr>
                <th>Mã Menu</th>
                <th>Tên Menu</th>
                <th>Liên kết link</th>
                <th>Mã menu cha</th>
                <th>Thứ tự menu</th>
                <th>Công cụ</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Mã Menu</th>
                <th>Tên Menu</th>
                <th>Liên kết link</th>
                <th>Mã menu cha</th>
                <th>Thứ tự menu</th>
                <th>Công cụ</th>
            </tr>
        </tfoot>
        <tbody>
            <asp:Literal ID="ltrMenu" runat="server"></asp:Literal>
        </tbody>


    </table>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#example').DataTable({
            columnDefs: [
                {
                    targets: [0,1,2,3,4],
                    className: 'mdl-data-table__cell--non-numeric'
                }
            ]
        });
    });</script>
<script type="text/javascript">
    function XoaMenu(MaMenu) {
        if (confirm("Bạn có chắc muốn xóa không?")) {
            alert("Xóa Menu" + MaMenu);
            $.post("cms/admin/Menu/Ajax/Menu.aspx",
                {
                    "ThaoTac": "XoaMenu", "MaMenu": MaMenu
                },
                function (data, status) {
                    //alert("Data: " + data + "\nStatus: " + status);
                    if (data == 1) {
                        $("#MaDong_" + MaMenu).slideUp();
                        alert("Xóa thành công")
                    }
                   
                    else if (data == 2) {
                        alert("Menu này có menu con bên trong, xóa hết menu con rồi quay lại xóa menu này.")
                    }
                    else { alert("Không thành công.") }

                }
                )
        }


    }
</script>