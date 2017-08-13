<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QLTaiKhoan_HienThi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.TaiKhoan.QLTaiKhoan.QLTaiKhoan_HienThi" %>
<div class="head">
    Danh sách các tài khoản đã tạo.
   <a class="themmoi" href="Admin.aspx?module=TaiKhoan&submodule=QLTaiKhoan&action=ThemMoi">Thêm mới</a>
</div>

<div class="khungChuaBang">
    <table id="example" class="mdl-data-table">
        <thead>
            <tr>
                <th>Tên đăng nhập</th>
                <th>Địa chỉ email</th>
                <th>Địa chỉ</th>
                <th>Họ tên</th>
                <th>Ngày sinh</th>
                <th>Giới tính</th>
                <th>Quyền</th>
                <th>Công cụ</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Tên đăng nhập</th>
                <th>Địa chỉ email</th>
                <th>Địa chỉ</th>
                <th>Họ tên</th>
                <th>Ngày sinh</th>
                <th>Giới tính</th>
                <th>Quyền</th>
                <th>Công cụ</th>
            </tr>
        </tfoot>
        <tbody>
            <asp:Literal ID="ltrTaiKhoan" runat="server"></asp:Literal>
        </tbody>

    </table>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#example').DataTable({
            columnDefs: [
                {
                    targets: [0, 1, 2, 3, 5],
                    className: 'mdl-data-table__cell--non-numeric'
                }
            ]
        });
    });</script>
<script type="text/javascript">
    function XoaTaiKhoan(tentaikhoan) {
        if (confirm("Bạn có muốn xóa tài khoản này?")) {
            $.post("cms/admin/TaiKhoan/QLTaiKhoan/Ajax/QLTaiKhoan.aspx",
                {
                    "ThaoTac": "XoaTaiKhoan",
                    "TenTaiKhoan": tentaikhoan
                }, function (data, status) {
                    //alert("Data: " + data + "\nStatus: " + status);
                    if (data == 1) {
                        $("#maDong_" + tentaikhoan).slideUp();
                        alert("Xóa thành công");
                    }
                    else {
                        alert(data);
                    }
                });
        }
    }
</script>
