<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuyenDangNhap_HienThi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.TaiKhoan.QuyenDangNhap.QuyenDangNhap_HienThi" %>
<div class="head">Danh sách quyền đã tạo <a class="themmoi" href="/Admin.aspx?module=TaiKhoan&submodule=QuyenDangNhap&action=ThemMoi">Thêm mới</a></div>
<div class="khungChuaBang">
    <%--<asp:GridView ID="GridView1" runat="server"></asp:GridView>--%>
    <table id="example" class="mdl-data-table">
        <thead>
            <tr>
                <th>Mã quyền</th>
                <th>Tên quyền</th>
                <th>Số lượng nhân viên</th>
                <th>Công cụ</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Mã quyền</th>
                <th>Tên quyền</th>
                <th>Số lượng nhân viên</th>
                <th>Công cụ</th>
            </tr>
        </tfoot>
        <tbody>
            <asp:Literal ID="ltrQuyen" runat="server"></asp:Literal>
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
    function XoaQuyen(Ma) {
        if (confirm("Bạn có chắc muốn xóa quyền này không?")) {
            alert("Xóa quyền có mã: " + Ma);
            $.post("cms/admin/TaiKhoan/QuyenDangNhap/Ajax/QuyenDangNhap.aspx",
                {
                    "ThaoTac": "XoaQuyen", "Ma": Ma
                },
                function (data, status) {
                    //alert("Data: " + data + "\nStatus: " + status);
                    if (data == 1) {
                        $("#maDong_" + Ma).slideUp();
                        alert("Xóa thành công")
                    } else if (data == 4) {
                        if (confirm("Lỗi phát sinh: Có quản trị viên mang quyền này, xóa quản trị viên hoặc sửa quyền quản trị viên trước, vẫn xóa?")) {
                            alert("Xóa tất cả nhân viên mang mã quyền: " + Ma);
                            $.post("cms/admin/TaiKhoan/QuyenDangNhap/Ajax/QuyenDangNhap.aspx",
                                {
                                    "Action": "XoaNhanVien", "Ma1": Ma
                                },
                                function (data, status) {
                                    //alert("Data: " + data + "\nStatus: " + status);
                                    if (data == 1) {
                                        $("#maDong_" + Ma).slideUp();
                                        alert("Xóa thành công, tất cả quản trị viên mang quyền này cũng bị xóa theo")
                                    } else if (data == 3) { alert("Không được xóa quyền Administrator") }
                                    else if (data == 2) { alert("Bạn không đủ quyền để xóa") }
                                    else { alert("Không thấy thông tin quyền để xóa") }

                                }
                                )
                        }

                    }
                    else if (data == 3) { alert("Không được xóa quyền Administrator") }
                    else if (data == 2) { alert("Bạn không đủ quyền để xóa") }
                    else { alert("Không thấy thông tin quyền để xóa") }

                }
                )
        }


    }
</script>
