<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginUser.aspx.cs" Inherits="Database_thaotaccsdl.LoginUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="cms/admin/css/Login.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
   <div class="FormDangNhap">
            <div class="head">Vui lòng điền thông tin đăng nhập</div>
            <div class="formcon">
                <div class="rows">
                    <div class="ten">Email</div>
                    <div class="onhap">
                        <asp:TextBox ID="tbEmail" runat="server" placeholder="Nhập địa chỉ Email - bich94@gmail.com" defaultbutton="lbtDangNhap" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="red"
                            SetFocusOnError="true" Display="Dynamic" ControlToValidate="tbEmail"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="<div style='color:red;padding:3px'>Không đúng định dạng email. mời nhập lại</div>" SetFocusOnError="true" Display="Dynamic" ControlToValidate="tbEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="rows">
                    <div class="ten">Mật khẩu</div>
                    <div class="onhap">
                        <asp:TextBox ID="tbMatKhau" runat="server" TextMode="Password" placeholder="Nhập mật khẩu - 12345" defaultbutton="lbtDangNhap"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="red"
                            SetFocusOnError="true" Display="Dynamic" ControlToValidate="tbMatKhau"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="rows">
                    <div class="ten">&nbsp</div>
                    <div class="onhap">
                        <asp:LinkButton ID="lbtDangNhap" runat="server" CssClass="btDangNhap" OnClick="lbtDangNhap_Click" TabIndex="10" >Đăng nhập</asp:LinkButton>
                        <asp:LinkButton ID="lbtBack" runat="server" CssClass="btBack" OnClick="lbtBack_Click" CausesValidation="false" >Home</asp:LinkButton>
                    </div>
                </div>
              
                <div>
                    <asp:Literal ID="ltrThongBao" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
