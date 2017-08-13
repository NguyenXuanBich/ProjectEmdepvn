<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuanLyDonDatHang_HienThi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.BanHang.QuanLyDonDatHang.QuanLyDonDatHang_HienThi" %>
<div class="head">Danh sách đơn đặt hàng của khách<a class="themmoi" href="/Admin.aspx?module=BanHang&submodule=QLDT">Xem doanh thu</a></div>
<div class="khungChuaBang">
    <table id="example" class="mdl-data-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Date</th>
                <th>Totalamount</th>
                <th>Status</th>
                <th>CusID</th>
                <th>CusName</th>
                <th>CusPhone</th>
                <th>CusEmail</th>
                <th>Tools</th>

            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>ID</th>
                <th>Date</th>
                <th>Totalamount</th>
                <th>Status</th>
                <th>CusID</th>
                <th>CusName</th>
                <th>CusPhone</th>
                <th>CusEmail</th>
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
                    targets: [3,5,7,8],
                    className: 'mdl-data-table__cell--non-numeric'
                }
            ]
        });
    });</script>

<script type="text/javascript">
    function XoaDonDatHang(MaDonDatHang) {
        if (confirm("Bạn có chắc muốn xóa không?")) {
            alert("Xóa Đơn có mã là: " + MaDonDatHang);
            $.post("cms/admin/BanHang/QuanLyDonDatHang/Ajax/DonDatHang.aspx",
                {
                    "ThaoTac": "XoaDonDatHang", "MaDonDatHang": MaDonDatHang
                },
                function (data, status) {
                    //alert("Data: " + data + "\nStatus: " + status);
                    if (data == 1) {
                        $("#MaDong_" + MaDonDatHang).slideUp();
                        alert("Xóa thành công")
                    }
                    else { alert("Không thành công.") }

                }
                )
        }


    }
</script>
