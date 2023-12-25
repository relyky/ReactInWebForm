<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyPage01.aspx.cs" Inherits="ReactInWebForm.MyPage01.MyPage01" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
      <h6>謹適用於單向 render React 元件</h6>
      <asp:Panel ID="MyQRCode" runat="server"></asp:Panel>
      <asp:TextBox ID="TextBox1" runat="server">https://www.asiavista.com.tw</asp:TextBox>
      <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />

      <web-qrcode code="<%= TextBox1.Text %>" />

    </ContentTemplate>
  </asp:UpdatePanel>
</asp:Content>
