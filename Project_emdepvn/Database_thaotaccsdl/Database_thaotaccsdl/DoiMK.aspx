<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoiMK.aspx.cs" Inherits="Database_thaotaccsdl.DoiMK" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="cms/admin/css/Login.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="FormDangNhap">
            <div class="head">Đổi mật khẩu</div>
            <div class="formcon">
                <div class="rows">
                    <div class="ten">Mật khẩu cũ</div>
                    <div class="onhap">
                        <asp:TextBox ID="tbMKCu" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="red"
                            SetFocusOnError="true" Display="Dynamic" ControlToValidate="tbMKCu"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="rows">
                    <div class="ten">Mật khẩu mới</div>
                    <div class="onhap">
                        <asp:TextBox ID="tbMatKhau" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="red"
                            SetFocusOnError="true" Display="Dynamic" ControlToValidate="tbMatKhau"></asp:RequiredFieldValidator>
                    </div>
                </div>
                   <div class="rows">
                    <div class="ten">Nhập lại mk mới</div>
                    <div class="onhap">
                        <asp:TextBox ID="tbMKMoi" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="red"
                            SetFocusOnError="true" Display="Dynamic" ControlToValidate="tbMKMoi"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="<div style='color:red;padding:3px'>Mật khẩu không trùng khớp</div>" SetFocusOnError="true" Display="Dynamic" ControlToValidate="tbMKMoi" ControlToCompare="tbMatKhau"></asp:CompareValidator>

                    </div>
                </div>
                <div class="rows">
                    <div class="ten">&nbsp</div>
                    <div class="onhap">
                        <asp:LinkButton ID="lbtDangNhap" runat="server" CssClass="btDangNhap" OnClick="lbtDoi_Click">Đổi</asp:LinkButton>
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
            alert("Bạn tiến hành nhập MK cũ vào, sau đó nhập MK mới và nhập lại MK mới đó, sau đó ấn đổi")
        }
    </script>
</html>