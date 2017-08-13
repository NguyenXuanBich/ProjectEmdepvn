<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Database_thaotaccsdl.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Đăng nhập hệ thống</title>
    <link href="cms/admin/css/Login.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="FormDangNhap">
            <div class="head">Đăng nhập hệ thống quản trị</div>
            <div class="formcon">
                <div class="rows">
                    <div class="ten">Tên đăng nhập</div>
                    <div class="onhap">
                        <asp:TextBox ID="tbTenDangNhap" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="red"
                            SetFocusOnError="true" Display="Dynamic" ControlToValidate="tbTenDangNhap"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="rows">
                    <div class="ten">Mật khẩu</div>
                    <div class="onhap">
                        <asp:TextBox ID="tbMatKhau" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="red"
                            SetFocusOnError="true" Display="Dynamic" ControlToValidate="tbMatKhau"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="rows">
                    <div class="ten">&nbsp</div>
                    <div class="onhap">
                        <asp:LinkButton ID="lbtDangNhap" runat="server" CssClass="btDangNhap" OnClick="lbtDangNhap_Click">Đăng nhập</asp:LinkButton>
                        <asp:LinkButton ID="lbtBack" runat="server" CssClass="btBack" OnClick="lbtBack_Click" CausesValidation="false">Quay về</asp:LinkButton>
                    </div>
                </div>
                <button onclick="Thongbao()">Help</button>
              
                <div>
                    <asp:Literal ID="ltrThongBao" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
    </form>
</body>
    <script lang="javascript" type="text/javascript">
        function Thongbao() {
            alert("Tên đăng nhập là Bichbon, mất khẩu 12345")
        }
    </script>
</html>
