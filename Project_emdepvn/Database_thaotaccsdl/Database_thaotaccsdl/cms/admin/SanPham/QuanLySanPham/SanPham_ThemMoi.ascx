<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SanPham_ThemMoi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.SanPham.QuanLySanPham.SanPham_ThemMoi" %>
<%--<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>--%>
<div class="head">
    Thêm mới, chỉnh sửa sản phẩm 
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
        <div class="tenTruong">Tên sản phẩm</div>
        <div class="oNhap">
            <asp:TextBox ID="tbTenSanPham" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbTenSanPham" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
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
        <div class="tenTruong">Số lượng</div>
        <div class="oNhap">
            <asp:TextBox ID="tbSoLuong" runat="server" MaxLength="4"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbSoLuong" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Số lượng phải nhập kiểu số" ControlToValidate="tbSoLuong" Display="Dynamic" SetFocusOnError="true" ForeColor="red" ValidationExpression="(\d)*"></asp:RegularExpressionValidator>
        </div>
    </div>
       <div class="thongTin">
        <div class="tenTruong">Giá nhập</div>
        <div class="oNhap">
            <asp:TextBox ID="tbGiaNhap" runat="server" MaxLength="8"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbGiaNhap" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Giá phải nhập kiểu số" ControlToValidate="tbGiaNhap" Display="Dynamic" SetFocusOnError="true" ForeColor="red" ValidationExpression="(\d)*"></asp:RegularExpressionValidator>
        </div>
    </div>

    <div class="thongTin">
        <div class="tenTruong">Giá sản phẩm</div>
        <div class="oNhap">
            <asp:TextBox ID="tbGiaSanPham" runat="server" MaxLength="8"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbGiaSanPham" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Giá phải nhập kiểu số" ControlToValidate="tbGiaSanPham" Display="Dynamic" SetFocusOnError="true" ForeColor="red" ValidationExpression="(\d)*"></asp:RegularExpressionValidator>
        </div>
    </div>

    <div class="thongTin">
        <div class="tenTruong">Ngày tạo</div>
        <div class="oNhap">
            <asp:TextBox ID="tbNgayTao" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbNgayTao" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
<%--            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Thứ tự phải nhập kiểu số" ControlToValidate="tbNgayTao" Display="Dynamic" SetFocusOnError="true" ForeColor="red" ValidationExpression="(\d)*"></asp:RegularExpressionValidator>--%>
        </div>
    </div>

    <div class="thongTin">
        <div class="tenTruong">Ngày hủy</div>
        <div class="oNhap">
            <asp:TextBox ID="tbNgayHuy" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbNgayHuy" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
<%--            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Thứ tự phải nhập kiểu số" ControlToValidate="tbNgayHuy" Display="Dynamic" SetFocusOnError="true" ForeColor="red" ValidationExpression="(\d)*"></asp:RegularExpressionValidator>--%>
        </div>
    </div>

    <div class="thongTin">
        <div class="tenTruong">Chọn màu</div>
        <div class="oNhap">
            <asp:DropDownList ID="ddlmau" runat="server"></asp:DropDownList>
            <%--            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="red"  ErrorMessage="*" ControlToValidate="dllDanhMucCha" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
        </div>
    </div>

    <div class="thongTin">
        <div class="tenTruong">Chọn size</div>
        <div class="oNhap">
            <asp:DropDownList ID="ddlsize" runat="server"></asp:DropDownList>
            <%--            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="red"  ErrorMessage="*" ControlToValidate="dllDanhMucCha" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
        </div>
    </div>

    <div class="thongTin">
        <div class="tenTruong">Chọn chất liệu</div>
        <div class="oNhap">
            <asp:DropDownList ID="ddlchatlieu" runat="server"></asp:DropDownList>
            <%--            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="red"  ErrorMessage="*" ControlToValidate="dllDanhMucCha" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
        </div>
    </div>

    <div class="thongTin">
        <div class="tenTruong">Chọn nhóm</div>
        <div class="oNhap">
            <asp:DropDownList ID="ddlnhom" runat="server"></asp:DropDownList>
            <%--            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="red"  ErrorMessage="*" ControlToValidate="dllDanhMucCha" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
        </div>
    </div>

    <div class="thongTin">
        <div class="tenTruong">Mô tả sản phẩm</div>
        <div class="oNhap">
            <asp:TextBox ID="tbMoTaSanPham" runat="server" TextMode="MultiLine" Height="150px"></asp:TextBox>
<%--             <CKEditor:CKEditorControl ID="tbMoTaSanPham" runat="server" BasePath="~/ckeditor"> ></CKEditor:CKEditorControl>--%>
        </div>
    </div>
    <%-- tiếp tục tạo sản phẩm khác sau khi tạo--%>
    <div class="thongTin">
        <div class="tenTruong">&nbsp</div>
        <div class="oNhap">
            <asp:CheckBox ID="cbTiepTuc" runat="server" Text="Tiếp tục tạo thêm sản phẩm khác sau khi tạo thành công" />
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
