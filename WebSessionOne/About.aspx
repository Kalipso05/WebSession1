<%@ Page Async="true" Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebSessionOne.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" runat="server" Font-Names="Cascadia code" Font-Bold="true" Font-Size="Small">
        <asp:Label ID="Label1" runat="server" Text="Госпитализация пациента" BackColor="DarkOrange" ForeColor="White"></asp:Label>
        <br />
        <br />
        Выберите пациента:<br />
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="LastName" DataValueField="ID" Width="206px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbModel %>" SelectCommand="SELECT [ID], [LastName], [FirstName], [Patronymic] FROM [Patient]"></asp:SqlDataSource>
        <br />
        <br />
        Имя&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Номер полиса<br />
        <asp:TextBox ID="txbFirstName" ReadOnly="true" runat="server" Width="250"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:TextBox ID="txbInsuranseNumber" ReadOnly="true" runat="server" Width="250"></asp:TextBox>
        <br />
        Фамилия&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Срок действия полиса<br />
        <asp:TextBox ID="txbLastName" ReadOnly="true" runat="server" Width="250"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:TextBox ID="txbInsuranseExpiration" ReadOnly="true" TextMode="Date" runat="server" Width="250"></asp:TextBox>
        <br />
        Отчество&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Страховая кампания<br />
        <asp:TextBox ID="txbPatronymic" ReadOnly="true" runat="server" Width="250"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:TextBox ID="txbInsuranseCompany" ReadOnly="true" runat="server" Width="250"></asp:TextBox>
        <br />
        Серия паспорта&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Дата госпитализации<br />
        <asp:TextBox ID="txbPassSeries" ReadOnly="true" runat="server" Width="250"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:TextBox ID="txbDateOfHospitalization" TextMode="Date" runat="server" Width="250"></asp:TextBox>
        <br />
        Номер паспорта&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Время госпитализации<br />
        <asp:TextBox ID="txbPassNumber" ReadOnly="true" runat="server" Width="250"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:TextBox ID="txbTimeOfHospitalization" TextMode="Time" runat="server" Width="250"></asp:TextBox>
        <br />
        Место работы<br />
        <asp:TextBox ID="txbWorkPlace" ReadOnly="true" runat="server" Width="250"></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonAddHospitalization" runat="server" Text="Добавить" Width="250" BackColor="Black" ForeColor="White" OnClick="ButtonAddHospitalization_Click"/>
    </asp:Panel>
</asp:Content>
