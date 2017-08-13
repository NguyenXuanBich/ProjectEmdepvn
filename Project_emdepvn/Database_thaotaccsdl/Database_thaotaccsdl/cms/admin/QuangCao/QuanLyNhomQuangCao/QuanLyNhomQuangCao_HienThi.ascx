<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuanLyNhomQuangCao_HienThi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.QuangCao.QuanLyNhomQuangCao.QuanLyNhomQuangCao_HienThi" %>
<div class="head">Các nhóm quảng cáo đã tạo<a class="themmoi" href="/Admin.aspx?module=QuangCao&submodule=QLNhomQuangCao&action=ThemMoi">Thêm mới</a></div>
<div class="khungChuaBang">
    <%--<asp:GridView ID="GridView1" runat="server"></asp:GridView>--%>
    <table id="example" class="mdl-data-table">
        <thead>
            <tr>
                <th>ID Nhóm</th>
                <th>Tên Nhóm Quảng Cáo</th>
                <th>Vị trí Nhóm</th>               
                <th>Ảnh Nhóm</th>
                <th>Thứ tự nhóm</th>
                <th>Số lượng quảng cáo</th>
                <th>Tools</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>ID Nhóm</th>
                <th>Tên Nhóm Quảng Cáo</th>
                <th>Vị trí Nhóm</th>               
                <th>Ảnh Nhóm</th>
                <th>Thứ tự nhóm</th>
                <th>Số lượng quảng cáo</th>
                <th>Tools</th>
            </tr>
        </tfoot>

        <tbody>
            <asp:Literal ID="ltrDanhSachNhomQuangCao" runat="server"></asp:Literal>
        </tbody>


    </table>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#example').DataTable({
            columnDefs: [
                {
                    targets: [0, 1,2,3],
                    className: 'mdl-data-table__cell--non-numeric'
                }
            ]
        });
    });</script>

<script type="text/javascript">
    function XoaNhomQuangCao(MaNhom) {
        if (confirm("Bạn có chắc muốn xóa không?")) {
            alert("Xóa Nhóm" + MaNhom);
            $.post("cms/admin/QuangCao/QuanLyNhomQuangCao/Ajax/NhomQuangCao.aspx",
                {
                    "ThaoTac": "XoaNhomQuangCao", "MaNhom": MaNhom
                },
                function (data, status) {
                    //alert("Data: " + data + "\nStatus: " + status);
                    if (data == 1) {
                        $("#MaDong_" + MaNhom).slideUp();
                        alert("Xóa thành công")
                    }
                    else if (data == 2) {
                        //alert("Lỗi phát sinh: Có Sản Phẩm trong Nhóm này, xóa hết Sản Phẩm của DM này mới có thể xóa DM này")
                        if (confirm("Lỗi phát sinh: Có quảng cáo trong Nhóm này, xóa hết quảng cáo của Nhóm này mới có thể xóa Nhóm này, bạn có muốn xóa không?")) {
                            alert("Xóa Nhóm" + MaNhom);
                            $.post("cms/admin/QuangCao/QuanLyNhomQuangCao/Ajax/NhomQuangCao.aspx",
                                {
                                    "Action": "XoaQC", "Ma": MaNhom
                                },
                                function (data, status) {
                                    //alert("Data: " + data + "\nStatus: " + status);
                                    if (data == 1) {
                                        $("#MaDong_" + MaNhom).slideUp();
                                        alert("Xóa thành công, tất cả quảng cáo trong Nhóm cũng bị xóa theo")
                                    }
                                    else { alert("Nhóm không tồn tại") }

                                }
                                )
                        }

                    }
                    else { alert("Không thành công.") }

                }
                )
        }


    }
</script>
