<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QLTaiKhoan_ThemMoi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.TaiKhoan.QLTaiKhoan.QLTaiKhoan_ThemMoi" %>
<%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
<div class="head">
    Thêm mới, chỉnh sửa tài khoản
</div>
<div class="formThemMoi">
    <asp:Literal ID="ltrthongbao" runat="server"></asp:Literal>
    <div class="thongTin">
        <div class="tenTruong">Chọn quyền</div>
        <div class="oNhap">
            <asp:DropDownList ID="ddlQuyenDN" runat="server"></asp:DropDownList>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Tên đăng nhập</div>
        <div class="oNhap">
            <asp:TextBox ID="tbTenDangNhap" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="red" ErrorMessage="Không để trống"
                ControlToValidate="tbTenDangNhap" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Mật khẩu</div>
        <div class="oNhap">
            <asp:HiddenField ID="hdMatKhauCu" runat="server" />
            <asp:TextBox ID="tbMatKhau" runat="server" MaxLength="10" placeholder="Mật khẩu là 10 kí tự chữ hoặc số" Style="width: 50%; padding: 5px; border: 1px solid #dfdfdf"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="red" ErrorMessage="Không để trống"
                ControlToValidate="tbMatKhau" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Email</div>
        <div class="oNhap">
            <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbEmail" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <div style="clear: both"></div>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="<div style='color:red;padding:3px'>Định dạng email sai</div>" SetFocusOnError="true" Display="Dynamic" ControlToValidate="tbEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Địa chỉ</div>
        <div class="oNhap">
            <asp:TextBox ID="tbDiaChi" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbDiaChi" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Tên đầy đủ</div>
        <div class="oNhap">
            <asp:TextBox ID="tbTenDayDu" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbTenDayDu" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>

        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Ngày sinh</div>
        <div class="oNhap">
            <%--    <asp:TextBox ID="tbNgaySinh" runat="server"></asp:TextBox>--%>
            <asp:Calendar ID="cdNgaySinh" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px" CellPadding="1" DayNameFormat="Shortest">
                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#009999" ForeColor="#CCFF99" Font-Bold="True" />
                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                <WeekendDayStyle BackColor="#CCCCFF" />
            </asp:Calendar>
            <asp:TextBox ID="tbNgay" CssClass="btNgay" runat="server" placeholder="Năm nhỏ hơn 10000" MaxLength="4"></asp:TextBox>
            <asp:RequiredFieldValidator ID="BatloiDateTime2" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbNgay" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="BatloiDateTime" runat="server" ForeColor="red" ErrorMessage="Nhập định dạng năm VD: 1994"
                ControlToValidate="tbNgay" Display="Dynamic" SetFocusOnError="true" ValidationExpression="(\d)*"></asp:RegularExpressionValidator>
            <asp:Button ID="btNgay" runat="server" Text="Đi tới" CssClass="btThemMoi Ngay" OnClick="btNgay_Click" CausesValidation="true" />

        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Giới tính</div>
        <div class="oNhap">
            <asp:DropDownList ID="ddlGioiTinh" runat="server">
                <asp:ListItem Text="Nam" Value="Nam"></asp:ListItem>
                <asp:ListItem Text="Nữ" Value="Nữ"></asp:ListItem>
                <asp:ListItem Text="Khác" Value="Khác"></asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>


    <div class="thongTin">
        <div class="tenTruong">&nbsp</div>
        <div class="oNhap">
            <asp:CheckBox ID="cbThemNhieuTK" runat="server" Text="Tiếp tục tạo tài khoản khác sau khi tạo tài khoản này" />
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">&nbsp;</div>
        <div class="oNhap">
            <asp:Button ID="btThemMoi" runat="server" Text="Thêm mới" CssClass="btThemMoi" OnClick="btThemMoi_Click" />
            <asp:Button ID="btHuy" runat="server" Text="Hủy bỏ" CssClass="btHuyBo" OnClick="btHuy_Click" CausesValidation="false" />
        </div>
    </div>
</div>
