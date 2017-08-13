<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuanLyDanhMucTin_HienThi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.TinTuc.QuanLyDanhMucTin.QuanLyDanhMucTin_HienThi" %>
<div class="head">Các danh mục Tin Tức đã tạo<a class="themmoi" href="/Admin.aspx?module=TinTuc&submodule=DanhMucTin&action=ThemMoi">Thêm mới</a></div>
<div class="khungChuaBang">
    <%--<asp:GridView ID="GridView1" runat="server"></asp:GridView>--%>
    <table id="example" class="mdl-data-table">
        <thead>
            <tr>
                <th>Mã danh mục</th>
                <th>Tên danh mục</th>
                <th>Tổng số bản tin</th>
                <th>Số bản tin riêng</th>
                <th>Ảnh đại diện</th>
                <th>Thứ tự</th>
                <th>Công cụ</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Mã</th>
                <th>Tên danh mục</th>
                <th>Tổng số bản tin</th>
                <th>Số bản tin riêng</th>
                <th>Ảnh đại diện</th>
                <th>Thứ tự</th>
                <th>Công cụ</th>
            </tr>
        </tfoot>
        <tbody>
            <asp:Literal ID="ltrDanhMucTin" runat="server"></asp:Literal>
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
    function XoaDanhMuc(MaDM) {
        if (confirm("Bạn có chắc muốn xóa không?")) {
            alert("Xóa danh mục" + MaDM);
            $.post("cms/admin/TinTuc/QuanLyDanhMucTin/Ajax/DanhMucTin.aspx",
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
                        //alert("Lỗi phát sinh: Có Tin Tức trong danh mục này, xóa hết Tin Tức của DM này mới có thể xóa DM này")
                        if (confirm("Lỗi phát sinh: Có Tin Tức trong danh mục này, xóa hết Tin Tức của DM này mới có thể xóa DM này, bạn có muốn xóa không?")) {
                            alert("Xóa danh mục" + MaDM);
                            $.post("cms/admin/TinTuc/QuanLyDanhMucTin/Ajax/DanhMucTin.aspx",
                                {
                                    "Action": "XoaTinTuc", "Ma": MaDM
                                },
                                function (data, status) {
                                    //alert("Data: " + data + "\nStatus: " + status);
                                    if (data == 1) {
                                        $("#MaDong_" + MaDM).slideUp();
                                        alert("Xóa thành công, tất cả Tin Tức trong danh mục cũng bị xóa theo")
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