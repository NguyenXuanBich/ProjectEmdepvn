<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SanPhamLoadControl.ascx.cs" Inherits="Database_thaotaccsdl.GiaodienUser.SanPham.SanPhamLoadControl" %>
<link href="../../cms/admin/css/Default.css" rel="stylesheet" />
 <%--Cột Trái--%>
                <div class="cotTrai">
                    <div class="danhMuc">
                        <div class="head">
                            <asp:Literal ID="ltrName" runat="server"></asp:Literal>
                        </div>
                        <div class="content">
                            <ul>
                                <%--    <asp:PlaceHolder ID="ContentCottrai_top" runat="server"></asp:PlaceHolder>--%>
                                <asp:Literal ID="ltrDMSanPham" runat="server"></asp:Literal>
                                <asp:Literal ID="ltrDMTinTuc" runat="server"></asp:Literal>
                            </ul>
                        </div>
                    </div>
                    <div class="hoTro">
                        <div class="head">
                            <div class="anhhotro">
                                <img src="/pic/Supporter/Capture.JPG" />
                            </div>
                            <h3 style="text-align: center; color: #ffffff; border-bottom: 1px solid #ffffff; padding-bottom: 5px">Chăm sóc khách hàng</h3>
                        </div>
                        <div class="support">
                            <div class="text-center">
                                <p>
                                    <span class="supp-name">Emdep's Administrator</span>
                                    <br />
                                    <span class="phone">01236332429</span>
                                </p>
                            </div>
                            <div class="text-center">
                                <p>
                                    <span class="supp-name">Số điện thoại trực</span>
                                    <br />
                                    <span class="phone">01236332429</span>
                                </p>
                            </div>
                            <div class="text-center">
                                <p>
                                    <span class="supp-name">Thời gian làm việc</span>
                                    <br />
                                    <span class="phone">Tất cả các ngày trong tuần</span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <%--<div class="danhMuc">
                        <div class="head">
                            Thông tin giao dịch     
                        </div>
                        <div class="thongtinnganhang">
                            <div class="nganhang">
                                <img width="120" src="/pic/Banks/vietcombank.JPG" />
                                <p>
                                    <strong>Ngân hàng Vietcômbank</strong>
                                    <br />
                                    Số TK:0909 9209 09028
                                    <br />
                                    Chủ TK: Bích đại ca
                                    <br />
                                    Chi nhánh Hưng Yên- Hà Nội
                                </p>
                            </div>
                            <div class="nganhang">
                                <img width="170" src="/pic/Banks/agibank.JPG" />
                                <p>
                                    <strong>Ngân hàng Agibank</strong>
                                    <br />
                                    Số TK:0909 9209 09028
                                    <br />
                                    Chủ TK: Bích đại ca
                                    <br />
                                    Chi nhánh Hưng Yên- Hà Nội
                                </p>
                            </div>
                            <div class="nganhang">
                                <img width="150" src="/pic/Banks/vietinbank.JPG" />
                                <p>
                                    <strong>Ngân hàng Vietimbank</strong>
                                    <br />
                                    Số TK:0909 9209 09028
                                    <br />
                                    Chủ TK: Bích đại ca
                                    <br />
                                    Chi nhánh Hưng Yên- Hà Nội
                                </p>
                            </div>
                        </div>
                    </div>--%>
                </div>
                <%--End cột trái--%>

                <%--Cột phải--%>
                <div class="cotPhai">
                   <asp:PlaceHolder ID="plSanPhamLoadControl" runat="server"></asp:PlaceHolder>
                </div>

                <%--End cột phải--%>

