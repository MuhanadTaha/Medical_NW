using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace medical_env
{
    public partial class login : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_user(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MedicalNWConnectionString"].ConnectionString))
            {
                con.Open();
                string query = "SELECT COUNT(*) FROM users WHERE email = @Email AND password = @Password";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Email", Email.Text);
                    cmd.Parameters.AddWithValue("@Password", Password.Text);

                    int count = (int)cmd.ExecuteScalar();
                    if (count > 0)
                    {
                        Session["Email"] = Email.Text;
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        ErrorLabel.Text = "Email Already Exists";
                        ErrorLabel.Visible = true;
                    }
                }
            }
        }
    }
}