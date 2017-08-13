<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="KhachHang_HienThi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.KhachHang.KhachHang_HienThi" %>
<div class="head">Danh sách các khách hàng<a class="themmoi" href="/Admin.aspx?module=KhachHang&action=ThemKhachHang">Thêm mới</a></div>
<div class="khungChuaBang">
    <%--<asp:GridView ID="GridView1" runat="server"></asp:GridView>--%>
    <table id="example" class="mdl-data-table">
        <thead>
            <tr>
                <th>Mã khách hàng</th>
                <th>Tên khách hàng</th>
                <th>Địa chỉ khách hàng</th>
                <th>Số phone</th>
                <th>Địa chỉ email khách hàng</th>
                <th>Só đơn đặt hàng</th>
                <th>Công cụ</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Mã khách hàng</th>
                <th>Tên khách hàng</th>
                <th>Địa chỉ khách hàng</th>
                <th>Số phone</th>
                <th>Địa chỉ email khách hàng</th>
                <th>Só đơn đặt hàng</th>
                <th>Công cụ</th>
            </tr>
        </tfoot>
        <tbody>
            <asp:Literal ID="ltrKhachHang" runat="server"></asp:Literal>
        </tbody>


    </table>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#example').DataTable({
            columnDefs: [
                {
                    targets: [0,1,2,4,5],
                    className: 'mdl-data-table__cell--non-numeric'
                }
            ]
        });
    });</script>
<script type="text/javascript">
    function XoaKhachHang(MaKH) {
        if (confirm("Bạn có chắc muốn xóa không?")) {
            alert("Xóa danh mục" + MaKH);
            $.post("cms/admin/KhachHang/Ajax/KhachHang.aspx",
                {
                    "ThaoTac": "XoaKhachHang", "MaKH": MaKH
                },
                function (data, status) {
                    //alert("Data: " + data + "\nStatus: " + status);
                    if (data == 1) {
                        $("#maDong_" + MaKH).slideUp();
                        alert("Xóa thành công")
                    }
                    else if (data == 2) {
                        alert("Lỗi phát sinh: Có hóa đơn và đơn hàng liên kết với khách hàng này. Trước tiên, bạn cần xóa đơn hàng có mã KH là " + MaKH);
                    }
                    else { alert("Không thành công.") }

                }
                )
        }


    }
</script>
