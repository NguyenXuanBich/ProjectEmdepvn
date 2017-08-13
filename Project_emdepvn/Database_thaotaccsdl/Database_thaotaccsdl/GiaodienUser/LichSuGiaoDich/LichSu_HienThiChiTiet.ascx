<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LichSu_HienThiChiTiet.ascx.cs" Inherits="Database_thaotaccsdl.GiaodienUser.LichSuGiaoDich.LichSu_HienThiChiTiet" %>
<div class="cotPhai" style="text-transform:uppercase; color:green; position:relative; right:130px"><div class="head"><a class="themmoi" href="/HistoryCustomer.aspx">Quay về</a>Sau đây là chi tiết đơn hàng :</div>

    <div class="khungChuaBang" style="font: normal 15px HelveticaNeue">
        <div class="thongTin" style="text-align: center;">
            <div class="tenTruong" style="color: red; margin-left: 200px">
                Thông tin khách hàng:
            </div>
            <div class="oNhap" style="float: right;">
                <asp:Label ID="Label8" runat="server"></asp:Label>
            </div>
        </div>
        <div class="thongTin" style="text-align: center;">
            <div class="tenTruong" style="left: 300px; position: relative; text-align: right; color: blue">
                Mã đơn đặt hàng:
            </div>
            <div class="oNhap" style="float: right;">
                <asp:Label ID="lbMaDon" runat="server"></asp:Label>
            </div>
        </div>
        <div class="thongTin" style="text-align: center;">
            <div class="tenTruong" style="left: 300px; position: relative; text-align: right; color: blue">
                Ngày tạo:
            </div>
            <div class="oNhap" style="float: right;">
                <asp:Label ID="lbNgayTao" runat="server"></asp:Label>
            </div>
        </div>
        <div class="thongTin" style="text-align: center;">
            <div class="tenTruong" style="left: 300px; position: relative; text-align: right; color: blue">
                Thành tiền:
            </div>
            <div class="oNhap" style="float: right;">
                <asp:Label ID="lbThanhTien" runat="server"></asp:Label>
            </div>
        </div>
        <div class="thongTin" style="text-align: center;">
            <div class="tenTruong" style="left: 300px; position: relative; text-align: right; color: blue">
                Tình trạng đơn hàng:
            </div>
            <div class="oNhap" style="float: right;">
                <asp:Label ID="lbTinhTrang" runat="server"></asp:Label>
            </div>
        </div>
        <div class="thongTin" style="text-align: center;">
            <div class="tenTruong" style="left: 300px; position: relative; text-align: right; color: blue">
                Mã khách hàng:
            </div>
            <div class="oNhap" style="float: right;">
                <asp:Label ID="lbMaKhachHang" runat="server"></asp:Label>
            </div>
        </div>
        <div class="thongTin" style="text-align: center;">
            <div class="tenTruong" style="left: 300px; position: relative; text-align: right; color: blue">
                Tên khách hàng:
            </div>
            <div class="oNhap" style="float: right;">
                <asp:Label ID="lbTenKhachHang" runat="server"></asp:Label>
            </div>
        </div>
        <div class="thongTin" style="text-align: center;">
            <div class="tenTruong" style="left: 300px; position: relative; text-align: right; color: blue">
                Số điện thoại:
            </div>
            <div class="oNhap" style="float: right;">
                <asp:Label ID="lbSoDienThoai" runat="server"></asp:Label>
            </div>
        </div>
        <div class="thongTin" style="text-align: center;">
            <div class="tenTruong" style="left: 300px; position: relative; text-align: right; color: blue">
                Email khách hàng:
            </div>
            <div class="oNhap" style="float: right;">
                <asp:Label ID="lbEmailKhachHang" runat="server"></asp:Label>
            </div>
        </div>
        <div class="thongTin" style="text-align: center;">
            <div class="tenTruong" style="color: red; margin-left: 200px">
                Thông tin sản phẩm:
            </div>
            <div class="oNhap">
                <asp:Label ID="Label9" runat="server"></asp:Label>
            </div>
        </div>
        <table id="example" class="mdl-data-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên Sản Phẩm</th>
                    <th>Số Lượng đặt</th>
                    <th>Đơn giá đặt</th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <th>ID</th>
                    <th>Tên Sản Phẩm</th>
                    <th>Số Lượng đặt</th>
                    <th>Đơn giá đặt</th>
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
</div>
