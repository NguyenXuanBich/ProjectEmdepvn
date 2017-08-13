<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuanLyTinTuc_HienThi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.TinTuc.QuanLyTinTuc.QuanLyTinTuc_HienThi" %>
<div class="head">Các tin tức đã tạo<a class="themmoi" href="/Admin.aspx?module=TinTuc&submodule=QLTinTuc&action=ThemMoi">Thêm mới</a></div>
<div class="khungChuaBang">
    <%--<asp:GridView ID="GridView1" runat="server"></asp:GridView>--%>
    <table id="example" class="mdl-data-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Tittle</th>
                <th>Pic</th>
                <th>Describe</th>
                <th>Date</th>
                <th>View</th>
                <th>Ordinal</th>
                <th>DanhMucID</th>
                <th>Tools</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                 <th>ID</th>
                <th>Tittle</th>
                <th>Pic</th>
                <th>Describe</th>
                <th>Date</th>
                <th>View</th>
                <th>Ordinal</th>
                <th>DanhMucID</th>
                <th>Tools</th>
            </tr>
        </tfoot>

        <tbody>
            <asp:Literal ID="ltrDanhSachTinTuc" runat="server"></asp:Literal>
        </tbody>


    </table>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#example').DataTable({
            columnDefs: [
                {
                    targets: [1,2,3],
                    className: 'mdl-data-table__cell--non-numeric'
                }
            ]
        });
    });</script>

<script type="text/javascript">
    function XoaTinTuc(MaTin) {

        if (confirm("Bạn có muốn xóa Tin Tức này?")) {
            alert("Xóa bản tin có mã : " + MaTin);
            $.post("cms/admin/TinTuc/QuanLyTinTuc/Ajax/TinTuc.aspx",
                {
                    "ThaoTac": "XoaTinTuc", "MaTin": MaTin
                },
                function (data, status) {
                    //alert("Data: " + data + "\nStatus: " + status);
                    if (data == 1) {
                        $("#MaDong_" + MaTin).slideUp();
                        alert("Xóa thành công")
                    } else {
                        alert("Không tìm thấy id cần xóa")
                    }

                }
                )
        }
    }
</script>
