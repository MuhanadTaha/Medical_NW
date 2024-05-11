<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Doctor_Profile.aspx.cs" Inherits="medical_env.Doctor_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-horizontal">
        <h4>Create a new account</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Name" CssClass="col-md-2 control-label">Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Name" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Name"
                    CssClass="text-danger" ErrorMessage="The name field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Address" CssClass="col-md-2 control-label">Address</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Address" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Address"
                    CssClass="text-danger" ErrorMessage="The Address field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Governorate" CssClass="col-md-2 control-label">Governorate</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Governorate" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Governorate"
                    CssClass="text-danger" ErrorMessage="The Governorate field is required." />
            </div>
        </div>


        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Description" CssClass="col-md-2 control-label">Description</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Description" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Description"
                    CssClass="text-danger" ErrorMessage="The Description field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="time_from" CssClass="col-md-2 control-label">Available time from</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" TextMode="time" type="time" ID="time_from" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="time_from"
                    CssClass="text-danger" ErrorMessage="The time from field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="time_to" CssClass="col-md-2 control-label">Available time to</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" TextMode="time" type="time" ID="time_to" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="time_to"
                    CssClass="text-danger" ErrorMessage="The time to Available field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Specialist" CssClass="col-md-2 control-label">Specialist</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="Specialist" runat="server" AutoPostBack="false" CssClass="form-control">
                    <asp:ListItem>General Doctor</asp:ListItem>
                    <asp:ListItem>Cardiologist</asp:ListItem>
                    <asp:ListItem>Optometrist</asp:ListItem>
                    <asp:ListItem>Dentist</asp:ListItem>
                    <asp:ListItem>Pulmonologist</asp:ListItem>
                    <asp:ListItem>ENT doctor</asp:ListItem>
                </asp:DropDownList>

            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server"  OnClick="add_doctor" Text="Send" CssClass="btn btn-success" />
            </div>
        </div>

        <asp:Label ID="ErrorLabel" runat="server" Text="" CssClass="error-message text-danger" Visible="false"></asp:Label>

    </div>
</asp:Content>
