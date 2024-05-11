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
    public partial class Doctors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlSpecialist_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataBind(); // إعادة تحميل بيانات GridView عند تغيير اختيار Specialist
        }

        protected void ddlGovernorate_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataBind(); // إعادة تحميل بيانات GridView عند تغيير اختيار Governorate
        }


        protected void GV_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "OkCommand")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selectedRow = GridView1.Rows[index];

                string doctorEmail = selectedRow.Cells[1].Text;
                string appointmentDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                string patientEmail = Session["email"].ToString();

                // Insert data into the Appointments table in the database
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MedicalNWConnectionString"].ConnectionString))
                {
                    string query = "INSERT INTO Appointments (Doctor_Email, Patient_Email, Date_) VALUES (@DoctorEmail, @PatientEmail, @AppointmentDate)";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@DoctorEmail", doctorEmail);
                        cmd.Parameters.AddWithValue("@PatientEmail", patientEmail);
                        cmd.Parameters.AddWithValue("@AppointmentDate", appointmentDate);


                        con.Open();
                        cmd.ExecuteNonQuery();
                        msgLabel.Text = "Success";
                        msgLabel.Visible = true;

                        con.Close();

                    }
                }
            }


        }


    }
}
