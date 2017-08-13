<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DangKy.ascx.cs" Inherits="Database_thaotaccsdl.GiaodienUser.TaiKhoan.DangKy" %>
<script src="../../cms/admin/js/jquery-1.11.3.min.js"></script>
<div class="headdangky" runat="server">
    <div class="tittle">Đăng ký tài khoản mới</div>

</div>
<asp:Literal ID="ltrthongbao" runat="server"></asp:Literal>

<div class="thongTin">

    <div class="tenTruong">Họ và tên</div>
    <div class="oNhap">
        <asp:TextBox ID="tbHoTen" runat="server" placeholder="Tên: VD: BichNguyen"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbHoTen" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
    </div>
</div>

<div class="thongTin">
    <div class="tenTruong">Địa chỉ đăng ký</div>
    <div class="oNhap">
        <asp:TextBox ID="tbDiaChi" runat="server" placeholder="Địa chỉ của bạn"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbDiaChi" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
    </div>
</div>

<div class="thongTin">
    <div class="tenTruong">Số điện thoại</div>
    <div class="oNhap">
        <asp:TextBox ID="tbSDT" runat="server" placeholder="Nhập số điện thoại"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="SĐT phải là số mới gọi được chứ" ControlToValidate="tbSDT" Display="Dynamic" SetFocusOnError="true" ForeColor="red" ValidationExpression="(\d)*"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbSDT" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
    </div>
</div>

<div class="thongTin">
    <div class="tenTruong">Email</div>
    <div class="oNhap">
        <asp:TextBox ID="tbEmail" runat="server" placeholder="Nhập địa chỉ email"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbEmail" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        <div style="clear: both"></div>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="<div style='color:red;padding:3px'>Định dạng email sai</div>" SetFocusOnError="true" Display="Dynamic" ControlToValidate="tbEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </div>
</div>

<div class="thongTin">
    <div class="tenTruong">Mật Khẩu</div>
    <div class="oNhap">
        <asp:TextBox ID="tbMatKhau" runat="server" TextMode="Password" placeholder="Nhập mật khẩu vào đây"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbMatKhau" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
    </div>
</div>


<div class="thongTin">
    <div class="tenTruong">Nhập lại mật khẩu</div>
    <div class="oNhap">
        <asp:TextBox ID="tbNhapLai" runat="server" TextMode="Password" placeholder="Nhập mật khẩu lại lần nữa"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbNhapLai" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="<div style='color:red;padding:3px'>Mật khẩu không trùng khớp</div>" SetFocusOnError="true" Display="Dynamic" ControlToValidate="tbNhapLai" ControlToCompare="tbMatKhau"></asp:CompareValidator>
    </div>
</div>

<div class="thongTin">
    <div class="tenTruong">&nbsp</div>
    <div class="oNhap">
        <div class="row">
            <div class="dangky">
                <asp:Button ID="btDangKy" OnClick="btDangKy_Click" runat="server" Text="Đăng ký" Style=" margin-right:7px ;background: #e7adee; border-radius: 5px; color: white; height: 30px; float: left; width: 100px; box-shadow: 0 0 10px rgba(0,0,0,0.1);" />
            </div>
            <div class="huybo">
                <asp:Button ID="btHuyBo" CausesValidation="false" OnClick="btHuyBo_Click" runat="server" Text="Hủy bỏ" Style="margin-right:7px ;background: #8292f1; border-radius: 5px; color: white; height: 30px; float: left; box-shadow: 0 0 10px rgba(0,0,0,0.1);" />
            </div>
            <div class="huybo">
                <asp:Button ID="btQuayve" CausesValidation="false" OnClick="btQuayve_Click" runat="server" Text="Về trang chủ" Style="background: #8292f1; border-radius: 5px; color: white; height: 30px; float: left; box-shadow: 0 0 10px rgba(0,0,0,0.1);" />
            </div>
        </div>
    </div>
</div>
