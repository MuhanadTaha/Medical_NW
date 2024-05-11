using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace medical_env
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Authorization();
            }

            if (Session["email"] is null)
            {
                btnOut.Visible = false;
            }
            else
            {
                btnOut.Visible = true;
            }




        }

        protected void btnOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Session.RemoveAll();
            Response.Redirect("~/Login.aspx");
        }




        protected void Authorization()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MedicalNWConnectionString"].ConnectionString))
            {
                string str = "select role from users where Email= '" + Session["Email"] + "' ";
                SqlCommand cmd = new SqlCommand(str, con);
                con.Open();
                string Result = Convert.ToString(cmd.ExecuteScalar());

                if (Result == "Doctor")
                {
                    docotrProfile.Visible = true;
                    PatientAppointments.Visible = true;
                }
                else
                {
                    docotrProfile.Visible = false;
                    PatientAppointments.Visible = false;
                }
                con.Close();
            }
        }
    }
}