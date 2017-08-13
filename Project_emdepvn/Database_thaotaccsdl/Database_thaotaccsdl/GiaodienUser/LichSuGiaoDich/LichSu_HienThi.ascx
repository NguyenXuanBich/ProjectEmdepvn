<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LichSu_HienThi.ascx.cs" Inherits="Database_thaotaccsdl.GiaodienUser.LichSuGiaoDich.LichSu_HienThi" %>
<div class="cotPhai" style="text-transform:uppercase; color:green; position:relative; right:130px"><div class="head">Sau đây là lịch sử mua sắm của quý khách:</div>
<div class="khungChuaBang">
    <table id="example" class="mdl-data-table">
        <thead>
            <tr>
                <th>ID Đơn hàng</th>
                <th>Ngày giờ giao dịch</th>
                <th>Tổng tiền đơn hàng</th>
                <th>Trạng thái</th> 
                <th>Xem chi tiết</th>

            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>ID Đơn hàng</th>
                <th>Ngày giờ giao dịch</th>
                <th>Tổng tiền đơn hàng</th>
                <th>Trạng thái</th>
                <th>Xem chi tiết</th>
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
                    targets: [0, 1, 2, 3],
                    className: 'mdl-data-table__cell--non-numeric'
                }
            ]
        });
    });</script></div>
