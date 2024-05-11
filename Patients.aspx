<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Patients.aspx.cs" Inherits="medical_env.Patients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView Width="100%" ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Patient_Email" HeaderText="Patient_Email" SortExpression="Patient_Email" />
            <%--<asp:BoundField DataField="Doctor_Email" HeaderText="Doctor_Email" SortExpression="Doctor_Email" />--%>
            <asp:BoundField DataField="Date_" HeaderText="Date_" SortExpression="Date_" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MedicalNWConnectionString %>" SelectCommand="SELECT * FROM [Appointments] WHERE ([Doctor_Email] = @Doctor_Email) order by date_">
        <SelectParameters>
            <asp:SessionParameter Name="Doctor_Email" SessionField="Email" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
