<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuanLyQuangCao_ThemMoi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.QuangCao.QuanLyQuangCao.QuanLyQuangCao_ThemMoi" %>

<div class="head">
    Thêm mới, chỉnh sửa Quảng Cáo
</div>
<div class="formThemMoi">
    <asp:Literal ID="ltrthongbao" runat="server"></asp:Literal>
    <div class="thongTin">
        <div class="tenTruong">Chọn Nhóm</div>
        <div class="oNhap">
            <asp:DropDownList ID="dllNhomQuangCao" runat="server"></asp:DropDownList>
        </div>
    </div>

    <div class="thongTin">
        <div class="tenTruong">Tên quảng cáo</div>
        <div class="oNhap">
            <asp:TextBox ID="tbtenqc" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbtenqc" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Loại Quảng Cáo</div>
        <div class="oNhap">
            <asp:TextBox ID="tbloaiqc" runat="server"></asp:TextBox>
        </div>
    </div>

    <div class="thongTin">
        <div class="tenTruong">Ảnh Quảng Cáo</div>
        <div class="oNhap">
            <div>
                <asp:HiddenField ID="hdtenanhqccu" runat="server" />
                <asp:Literal ID="ltrAnhQC" runat="server"></asp:Literal>
            </div>
            <div class="flAnhDaiDien">
                <asp:FileUpload ID="flAnhQC" runat="server" />
            </div>
        </div>
    </div>

    <div class="thongTin">
        <div class="tenTruong">Liên kết nhúng</div>
        <div class="oNhap">
            <asp:TextBox ID="tblienket" runat="server" TextMode="MultiLine" Height="150px"></asp:TextBox>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Thứ Tự</div>
        <div class="oNhap">
            <asp:TextBox ID="tbthutu" runat="server" MaxLength="4"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbthutu" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Thứ tự phải là số" ControlToValidate="tbthutu" Display="Dynamic" SetFocusOnError="true" ForeColor="red" ValidationExpression="(\d)*"></asp:RegularExpressionValidator>

        </div>
    </div>

    <%-- tiếp tục tạo tin tức khác sau khi tạo thành công tin này--%>
    <div class="thongTin">
        <div class="tenTruong">&nbsp</div>
        <div class="oNhap">
            <asp:CheckBox ID="cbTiepTuc" runat="server" Text="Tiếp tục tạo thêm quảng cáo khác sau khi tạo thành công ?" />
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">&nbsp</div>
        <div class="oNhap">
            <asp:Button ID="btThemMoi" runat="server" Text="Thêm mới" CssClass="btThemMoi" OnClick="btThemMoi_Click" />
            <asp:Button ID="btHuyBo" runat="server" Text="Hủy bỏ" CssClass="btHuyBo" OnClick="btHuyBo_Click" CausesValidation="false" />
        </div>
    </div>


</div>
