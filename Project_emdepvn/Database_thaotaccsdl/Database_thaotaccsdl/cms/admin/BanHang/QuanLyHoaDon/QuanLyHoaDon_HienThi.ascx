<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuanLyHoaDon_HienThi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.BanHang.QuanLyHoaDon.QuanLyHoaDon_HienThi" %>
<div class="head">Danh sách hóa đơn<a class="themmoi" href="/Admin.aspx?module=BanHang&submodule=QLDT">Xem doanh thu</a></div>
<div class="khungChuaBang">
    <table id="example" class="mdl-data-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Date</th>
                <th>Totalamount</th>
                <th>NhanVienID</th>
                <th>TenNhanVien</th>
                <th>MaKH</th>
                <th>TenKH</th>
                <th>Tools</th>

            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>ID</th>
                <th>Date</th>
                <th>Totalamount</th>
                <th>NhanVienID</th>
                <th>TenNhanVien</th>
                <th>MaKH</th>
                <th>TenKH</th>
                <th>Tools</th>
            </tr>
        </tfoot>

        <tbody>
            <asp:Literal ID="ltrDanhSach" runat="server"></asp:Literal>
        </tbody>


    </table>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#example').DataTable({
            columnDefs: [
                {
                    targets: [0,1,2,5,6],
                    className: 'mdl-data-table__cell--non-numeric'
                }
            ]
        });
    });</script>

<script type="text/javascript">
    function Xoa(MaHD) {
        if (confirm("Bạn có chắc muốn xóa không?")) {
            alert("Xóa Hóa Đơn có mã là: " + MaHD);
            $.post("cms/admin/BanHang/QuanLyHoaDon/Ajax/HoaDon.aspx",
                {
                    "ThaoTac": "XoaDon", "MaHD": MaHD
                },
                function (data, status) {
                    if (data == 1) {
                        $("#MaDong_" + MaHD).slideUp();
                        alert("Xóa thành công")
                    }
                    else { alert("Không thành công.") }

                }
                )
        }


    }
</script>
