<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuanLyTinTuc_ThemMoi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.TinTuc.QuanLyTinTuc.QuanLyTinTuc_ThemMoi" %>
<%--<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>--%>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<div class="head">
    Thêm mới, chỉnh sửa Tin Tức 
</div>
<div class="formThemMoi">
    <asp:Literal ID="ltrthongbao" runat="server"></asp:Literal>
    <div class="thongTin">
        <div class="tenTruong">Chọn danh mục</div>
        <div class="oNhap">
            <asp:DropDownList ID="dllDanhMucCha" runat="server"></asp:DropDownList>
            <%--            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="red"  ErrorMessage="*" ControlToValidate="dllDanhMucCha" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
        </div>
    </div>

    <div class="thongTin">
        <div class="tenTruong">Tiêu đề tin</div>
        <div class="oNhap">
            <asp:TextBox ID="tbTieudetin" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbTieudetin" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="thongTin">
        <div class="tenTruong">Ảnh Đại Diện</div>
        <div class="oNhap">
            <div>
                <asp:HiddenField ID="hdtenanhdaidiencu" runat="server" />
                <asp:Literal ID="ltrAnhDaiDien" runat="server"></asp:Literal>
            </div>
            <div class="flAnhDaiDien">
                <asp:FileUpload ID="flAnhDaiDien" runat="server" />
            </div>
            <%--            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="flAnhDaiDien" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Thông tin mô tả</div>
        <div class="oNhap">
            <asp:TextBox ID="tbMota" runat="server" TextMode="MultiLine" Height="150px"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="red" ErrorMessage="Chưa nhập mô tả" ControlToValidate="tbMota" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <%--             <CKEditor:CKEditorControl ID="tbMoTaSanPham" runat="server" BasePath="~/ckeditor"> ></CKEditor:CKEditorControl>--%>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Ngày đăng</div>
        <div class="oNhap">
            <asp:TextBox ID="tbNgaydang" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbNgaydang" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <%--            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Thứ tự phải nhập kiểu số" ControlToValidate="tbNgayTao" Display="Dynamic" SetFocusOnError="true" ForeColor="red" ValidationExpression="(\d)*"></asp:RegularExpressionValidator>--%>
        </div>
    </div>

    <div class="thongTin">
        <div class="tenTruong">Số lượt xem</div>
        <div class="oNhap">
            <asp:TextBox ID="tbSoluotxem" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Lượt xem phải nhập kiểu số" ControlToValidate="tbSoluotxem" Display="Dynamic" SetFocusOnError="true" ForeColor="red" ValidationExpression="(\d)*"></asp:RegularExpressionValidator>
        </div>
    </div>

    <div class="thongTin">
        <div class="tenTruong">Thứ tự</div>
        <div class="oNhap">
            <asp:TextBox ID="tbThutu" runat="server" MaxLength="4"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbThutu" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Thứ tự phải nhập kiểu số" ControlToValidate="tbThutu" Display="Dynamic" SetFocusOnError="true" ForeColor="red" ValidationExpression="(\d)*"></asp:RegularExpressionValidator>
        </div>
    </div>

    <div class="thongTin">
        <div class="tenTruong">Nội dung chi tiết</div>
        <div class="oNhap">
            <CKEditor:CKEditorControl ID="tbNoidungchitiet" runat="server"></CKEditor:CKEditorControl>
        </div>
    </div>
    <%-- tiếp tục tạo tin tức khác sau khi tạo thành công tin này--%>
    <div class="thongTin">
        <div class="tenTruong">&nbsp</div>
        <div class="oNhap">
            <asp:CheckBox ID="cbTiepTuc" runat="server" Text="Tiếp tục tạo thêm bản tin khác sau khi tạo thành công ?" />
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
