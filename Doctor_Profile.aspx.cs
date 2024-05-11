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
    public partial class Doctor_Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void add_doctor(object sender, EventArgs e)
        {
            
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MedicalNWConnectionString"].ConnectionString))
                {
                    string query = "INSERT INTO [dbo].[Docotrs] (email, Name, Address, Governorate, Description, Time_from, Time_to, Specialist) " +
                                   "VALUES (@email, @Name, @Address, @Governorate, @Description, @Time_from, @Time_to, @Specialist)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@email", Session["Email"].ToString());
                        cmd.Parameters.AddWithValue("@Name", Name.Text);
                        cmd.Parameters.AddWithValue("@Address", Address.Text);
                        cmd.Parameters.AddWithValue("@Governorate", Governorate.Text);
                        cmd.Parameters.AddWithValue("@Description", Description.Text);
                        cmd.Parameters.AddWithValue("@Time_from", time_from.Text);
                        cmd.Parameters.AddWithValue("@Time_to", time_to.Text);
                        cmd.Parameters.AddWithValue("@Specialist", Specialist.SelectedItem.Text);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                // عرض رسالة نجاح إذا تمت العملية بنجاح
                ErrorLabel.Text = "Doctor added successfully";
                ErrorLabel.Visible = true;
            
           
        }

    }
}