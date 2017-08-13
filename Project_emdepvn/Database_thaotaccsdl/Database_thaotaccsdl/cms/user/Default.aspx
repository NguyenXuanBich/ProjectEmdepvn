<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Database_thaotaccsdl.cms.user.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Emdep.vn</title>
    <link href="../admin/css/DefaultHome.css" rel="stylesheet" />
    <link href="../admin/css/font-face/font-face.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <%--Hotline--%>
        <div id="Hotline">
            <div class="container">
                <div class="phoneimg">
                    <img src="/pic/icon/phone.jpg" /></div>
                <div class="phonenumber">Tel:  (04) 3664 9424 - (04) 3664 9425</div>
                <!--Tìm kiếm và đăng nhập-->
                <div class="SearchAndLogin">
                    <div class="khoisearchandlogin">
                        <div class="searchAndlogin">
                            <button id="bten">
                                <img src="/pic/icon/english.png" />
                            </button>
                        </div>
                        <div class="searchAndlogin">
                            <button id="btvi">
                                <img src="/pic/icon/vietnamese.png" />
                            </button>
                        </div>
                        <div class="searchAndlogin">
                            <div id="bordersearch">
                                <img src="/pic/icon/border-search.png" /></div>
                        </div>
                        <div class="searchAndlogin">
                            <button id="btsearch">
                                <img src="/pic/icon/entoni_search-24.png" />
                            </button>
                        </div>
                        <div class="searchAndlogin">                            
                             <asp:TextBox ID="tbTimKiem" placeholder="Nhập tin tức hay sản phẩm cần tìm" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--End Hotline--%>
    </form>
</body>
</html>
