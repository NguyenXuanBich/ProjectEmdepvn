<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuanLyQuangCao_HienThi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.QuangCao.QuanLyQuangCao.QuanLyQuangCao_HienThi" %>
<div class="head">Các quảng cáo đã tạo<a class="themmoi" href="/Admin.aspx?module=QuangCao&submodule=QLQuangCao&action=ThemMoi">Thêm mới</a></div>
<div class="khungChuaBang">
    <%--<asp:GridView ID="GridView1" runat="server"></asp:GridView>--%>
    <table id="example" class="mdl-data-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>TênQC</th>
                <th>LoạiQC</th>
                <th>Pic</th>
                <th>Liên kết nhúng</th>
                <th>Thứ tự QC</th>
                <th>Thuộc nhóm</th>
                <th>Tools</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>ID</th>
                <th>TênQC</th>
                <th>LoạiQC</th>
                <th>Pic</th>
                <th>Liên kết nhúng</th>
                <th>Thứ tự QC</th>
                <th>Thuộc nhóm</th>
                <th>Tools</th>
            </tr>
        </tfoot>

        <tbody>
            <asp:Literal ID="ltrDanhSachQuangCao" runat="server"></asp:Literal>
        </tbody>


    </table>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#example').DataTable({
            columnDefs: [
                {
                    targets: [0,4,5,6],
                    className: 'mdl-data-table__cell--non-numeric'
                }
            ]
        });
    });</script>

<script type="text/javascript">
    function XoaQuangCao(MaQuangCao) {

        if (confirm("Bạn có muốn xóa quảng cáo này?")) {
            alert("Xóa quảng cáo có mã : " + MaQuangCao);
            $.post("cms/admin/QuangCao/QuanLyQuangCao/Ajax/QuangCao.aspx",
                {
                    "ThaoTac": "XoaQuangCao", "MaQuangCao": MaQuangCao
                },
                function (data, status) {
                    //alert("Data: " + data + "\nStatus: " + status);
                    if (data == 1) {
                        $("#MaDong_" + MaQuangCao).slideUp();
                        alert("Xóa thành công")
                    } else {
                        alert("Lỗi!Không xóa được")
                    }

                }
                )
        }
    }
</script>
