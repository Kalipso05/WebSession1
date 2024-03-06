<%@ Page Async="true" Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebSessionOne._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel ID="Panel1" runat="server" Font-Names="Cascadia code" Font-Bold="true" Font-Size="Small">
        <asp:Label ID="Label1" runat="server" Text="Регистрация пациента" BackColor="DarkOrange" ForeColor="White"></asp:Label>

        <br />
        <br />
        Имя&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Номер полиса<br />
        <asp:TextBox ID="txbFirstName" runat="server" Width="250"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:TextBox ID="txbInsuranseNumber" runat="server" Width="250"></asp:TextBox>
        <br />
        Фамилия&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Срок действия полиса<br />
        <asp:TextBox ID="txbLastName" runat="server" Width="250"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:TextBox ID="txbInsuranseExpiration" TextMode="Date" runat="server" Width="250"></asp:TextBox>
        <br />
        Отчество&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Страховая кампания<br />
        <asp:TextBox ID="txbPatronymic" runat="server" Width="250"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:TextBox ID="txbInsuranseCompany" runat="server" Width="250"></asp:TextBox>
        <br />
        Серия паспорта&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Номер мед.карты<br />
        <asp:TextBox ID="txbPassSeries" runat="server" Width="250"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:TextBox ID="txbMedicalCardNumber" runat="server" Width="250"></asp:TextBox>
        <br />
        Номер паспорта&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Идентификационный код мед.карты<br />
        <asp:TextBox ID="txbPassNumber" runat="server" Width="250"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:TextBox ID="txbMedicalCardCode" runat="server" ReadOnly="true" Width="250"></asp:TextBox>
        &nbsp;<asp:Button ID="ButtonGenerateCode" runat="server" Height="24px" Text="Сгенерировать" Width="180px" OnClick="ButtonGenerateCode_Click" />
        <br />
        Место работы<br />
        <asp:TextBox ID="txbWorkPlace" runat="server" Width="250"></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonAddPatient" runat="server" Text="Добавить" Width="250" BackColor="Black" ForeColor="White" OnClick="ButtonAddPatient_Click"/>
        <br />
        <br />

    </asp:Panel>

</asp:Content>
