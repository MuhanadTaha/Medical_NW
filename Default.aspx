<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="medical_env._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">




    <div class="w3-content w3-display-container">
        <img class="mySlides" src="image/slider3.jpg" style="width: 100%">
        <img class="mySlides" src="image/slider2.jpg" style="width: 100%">


        <script>
            var myIndex = 0;
            carousel();

            function carousel() {
                var i;
                var x = document.getElementsByClassName("mySlides");
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                myIndex++;
                if (myIndex > x.length) { myIndex = 1 }
                x[myIndex - 1].style.display = "block";
                setTimeout(carousel, 5000); // Change image every 5 seconds
            }
        </script>
    </div>


    <hr />
    <div class="row">
        <div class="col-md-4">
            <h2>Latest Docotor</h2>
            <p>
                When you click this button you will see a list of all the dormotories rooms listed on this site, so you can find your desired requirments. 
            </p>
            <p>
                <a class="btn btn-default" href="Search.aspx">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Choosen Dcotor</h2>
            <p>
                all dormotories have reservations criteria that control all docotr process.all candidates must carefully read all policies
            </p>
            <p>
                <a class="btn btn-default" href="Search.aspx">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">

            <h2>login as</h2>
            <p>

                <a class="btn btn-success" href="login">Login</a>
            </p>
            <p>
                <a class="btn btn-default" href="Search.aspx">Learn more &raquo;</a>
            </p>
            <p>
                &nbsp;
            </p>
            <p>
                &nbsp;
            </p>

        </div>
    </div>


</asp:Content>
