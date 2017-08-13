<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="Database_thaotaccsdl.DangKy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <div class="head" runat="server">
  
    Đăng ký tài khoản mới
</div>
    <asp:Literal ID="ltrthongbao" runat="server"></asp:Literal>

    <div class="thongTin">
        <div class="tenTruong">Tên đăng nhập</div>
        <div class="oNhap">
            <asp:TextBox ID="tbTenDangNhap" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbTenDangNhap" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="thongTin">
        <div class="tenTruong">Mật Khẩu</div>
        <div class="oNhap">
            <asp:TextBox ID="tbMatKhau" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbMatKhau" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="thongTin">
        <div class="tenTruong">Email</div>
        <div class="oNhap">
            <asp:TextBox ID="tbEmailDK" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbEmailDK" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="thongTin">
        <div class="tenTruong">Địa chỉ đăng ký</div>
        <div class="oNhap">
            <asp:TextBox ID="tbDiaChiDK" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbDiaChiDK" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="thongTin">
        <div class="tenTruong">Tên đầy đủ</div>
        <div class="oNhap">
            <asp:TextBox ID="tbTenDayDu" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbTenDayDu" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>

      <div class="thongTin">
        <div class="tenTruong">Câu hỏi bảo mật</div>
        <div class="oNhap">
            <asp:TextBox ID="tbCauHoiBaoMat" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbCauHoiBaoMat" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>

        <div class="thongTin">
        <div class="tenTruong">Ngày sinh</div>
        <div class="oNhap">
            <asp:TextBox ID="tbNgaySinh" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbNgaySinh" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>

        <div class="thongTin">
        <div class="tenTruong">Giới tính</div>
        <div class="oNhap">
            <asp:TextBox ID="tbGioiTinh" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbGioiTinh" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>

        <div class="thongTin">
        <div class="tenTruong">Mã quyền</div>
        <div class="oNhap">
            <asp:TextBox ID="tbMaQuyen" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbMaQuyen" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>

    <%-- tiếp tục đăng kí tài khoản khác sau khi đã đăng kí thành công--%>
    <div class="thongTin">
        <div class="tenTruong">&nbsp</div>
        <div class="oNhap">
            <asp:CheckBox ID="cbTiepTuc" runat="server" Text="Tiếp tục đăng ký tài khoản khác sau khi đã đăng kí thành công?" />
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">&nbsp</div>
        <div class="oNhap">
            <asp:Button ID="btThemMoi" runat="server" Text="Đăng ký" CssClass="btThemMoi" OnClick="btThemMoi_Click" />
            <asp:Button ID="btHuyBo" runat="server" Text="Hủy bỏ" CssClass="btHuyBo" OnClick="btHuyBo_Click" CausesValidation="false" />
        </div>
    </div>



    </div>
    </form>
</body>
</html>
