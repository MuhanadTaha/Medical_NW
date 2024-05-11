<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Doctors.aspx.cs" Inherits="medical_env.Doctors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <div class="container cont pt-2 pb-2 ">


        <asp:DropDownList ID="ddlSpecialist" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlSpecialist_SelectedIndexChanged">
            <asp:ListItem>General Doctor</asp:ListItem>
            <asp:ListItem>Cardiologist</asp:ListItem>
            <asp:ListItem>Optometrist</asp:ListItem>
            <asp:ListItem>Dentist</asp:ListItem>
            <asp:ListItem>Pulmonologist</asp:ListItem>
            <asp:ListItem>ENT doctor</asp:ListItem>
        </asp:DropDownList>

        <asp:DropDownList ID="ddlGovernorate" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlGovernorate_SelectedIndexChanged">
            <asp:ListItem>Ramallah</asp:ListItem>
            <asp:ListItem>Nablus</asp:ListItem>
            <asp:ListItem>Hebron</asp:ListItem>
            <asp:ListItem>Bethlehem</asp:ListItem>
            <asp:ListItem>Jerico</asp:ListItem>
            <asp:ListItem>Tulkarm</asp:ListItem>
            <asp:ListItem>Jeneen</asp:ListItem>
            <asp:ListItem>Qalqilya</asp:ListItem>
        </asp:DropDownList>

        <br />
        <asp:Label ID="msgLabel" runat="server" CssClass="text-danger" Text=""></asp:Label>
        <asp:GridView Width="100%" OnRowCommand="GV_OnRowCommand" ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#0000" BorderWidth="4px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="Governorate" HeaderText="Governorate" SortExpression="Governorate" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Time_from" HeaderText="Time_from" SortExpression="Time_from" />
                <asp:BoundField DataField="Time_to" HeaderText="Time_to" SortExpression="Time_to" />
                <asp:BoundField DataField="Specialist" HeaderText="Specialist" SortExpression="Specialist" />
                <asp:ButtonField ButtonType="Button" Text="Select" CommandName="OkCommand">
                    <ControlStyle CssClass="btn btn-primary btn-sm" />
                </asp:ButtonField>
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MedicalNWConnectionString %>"
            SelectCommand="SELECT * FROM [Docotrs] WHERE ([Specialist] = @Specialist OR @Specialist IS NULL) AND ([Governorate] = @Governorate OR @Governorate IS NULL)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSpecialist" Name="Specialist" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="ddlGovernorate" Name="Governorate" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>

</asp:Content>
