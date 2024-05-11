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
    public partial class register : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MedicalNWConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void add_user(object sender, EventArgs e)
        {

            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "SELECT COUNT(*) FROM users WHERE email = @Email";
                cmd.Parameters.AddWithValue("@Email", Email.Text);

                int count = (int)cmd.ExecuteScalar();
                if (count > 0)
                {
                    ErrorLabel.Text = "Email Already Exists";
                    ErrorLabel.Visible = true;
                }
                else
                {
                    string role = "User";
                    if (rolebutton.Checked)
                    {
                        role = "Doctor";
                    }

                    cmd.CommandText = "INSERT INTO users VALUES (@Email, @Password, @ConfirmPassword, @Role)";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@Email", Email.Text);
                    cmd.Parameters.AddWithValue("@Password", Password.Text);
                    cmd.Parameters.AddWithValue("@ConfirmPassword", ConfirmPassword.Text);
                    cmd.Parameters.AddWithValue("@Role", role);

                    cmd.ExecuteNonQuery();

                    Response.Redirect("Login.aspx");
                }
            }
            con.Close();

        }


    }

}