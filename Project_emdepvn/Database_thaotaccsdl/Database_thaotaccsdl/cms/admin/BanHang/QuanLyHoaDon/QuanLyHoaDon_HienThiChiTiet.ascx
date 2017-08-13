<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuanLyHoaDon_HienThiChiTiet.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.BanHang.QuanLyHoaDon.QuanLyHoaDon_HienThiChiTiet" %>
<div class="head" style="color: red !important; text-align: center !important; text-transform: uppercase">Chi tiết Hóa đơn<a class="themmoi" href="/Admin.aspx?module=BanHang&submodule=QLHoaDon">Quay về</a></div>

<div class="khungChuaBang" style="font: normal 15px HelveticaNeue">
    
    <div class="thongTin" style="text-align: center;">
        <div class="tenTruong" style="color: red; margin-left: 200px">
            Thông tin chi tiết:
        </div>
        <div class="oNhap">
            <asp:Label ID="Label9" runat="server"></asp:Label>
        </div>
    </div>
    <table id="example" class="mdl-data-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Mã SP</th>
                <th>Tên SP</th>
                <th>Số Lượng</th>
                <th>Đơn giá</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>ID</th>
                <th>Mã SP</th>
                <th>Tên SP</th>
                <th>Số Lượng</th>
                <th>Đơn giá</th>
            </tr>
        </tfoot>

        <tbody>
            <asp:Literal ID="ltrDanhSach" runat="server"></asp:Literal>
        </tbody>


    </table>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#example').DataTable({
                columnDefs: [
                    {
                        targets: [1, 2, 3],
                        className: 'mdl-data-table__cell--non-numeric'
                    }
                ]
            });
        });</script>
</div>
