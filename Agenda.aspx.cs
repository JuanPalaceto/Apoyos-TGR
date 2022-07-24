using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Text;

public partial class Agenda : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string AgregarContacto(string apPat, string apMat, string nombre,  DateTime cumpl, string direccion, string telefono, string sector, string seccion, string asociacion)
    {
        int Exitoso = 0;
        using (SqlConnection Conn = conn.Conecta())
        {
            using (SqlCommand comand = new SqlCommand("GrabarContacto", Conn))
            {
                comand.CommandType = CommandType.StoredProcedure;

                comand.Parameters.Add("@apellidoPaterno", SqlDbType.NVarChar, 50).Value = apPat;
                comand.Parameters.Add("@apellidoMaterno", SqlDbType.NVarChar, 50).Value = apMat;
                comand.Parameters.Add("@nombre", SqlDbType.NVarChar, 50).Value = nombre;
                comand.Parameters.Add("@cumpleanos", SqlDbType.Date).Value = cumpl;
                comand.Parameters.Add("@direccion", SqlDbType.NVarChar, 50).Value = direccion;
                comand.Parameters.Add("@telefono", SqlDbType.NChar, 10).Value = telefono;
                comand.Parameters.Add("@sector", SqlDbType.NVarChar, 50).Value = sector;
                comand.Parameters.Add("@seccion", SqlDbType.NVarChar, 50).Value = seccion;
                comand.Parameters.Add("@asociacion", SqlDbType.NVarChar, 50).Value = asociacion;             

                SqlParameter pexitoso = comand.Parameters.Add("@Exitoso", SqlDbType.Int);
                pexitoso.Direction = ParameterDirection.Output;
                Conn.Open();
                comand.ExecuteNonQuery();
                Exitoso = int.Parse(pexitoso.Value.ToString());
            }
            Conn.Close();
            return "{\"success\": \"" + Exitoso + "\"}";
        }
    }

    [WebMethod]
    public static string Contactos()
    {
        StringBuilder sb = new StringBuilder();
        using (SqlConnection Conn = conn.Conecta())
        {
            using (SqlCommand seldata = new SqlCommand("SelContactos", Conn))
            {
                string nombre = "";
                DateTime cumplea;
                seldata.CommandType = CommandType.StoredProcedure;
                Conn.Open();
                using (SqlDataReader drseldatos = seldata.ExecuteReader())
                {
                    //Empieza encabezadp
                    sb.Append("<table id=\"tablaContactos\">");
                    sb.Append("<thead>");
                    sb.Append("<tr><th>Nombre</th>");
                    sb.Append("<th>Cumpleaños</th>");   
                    sb.Append("<th>Dirección</th>");                    
                    sb.Append("<th>Teléfono</th>");
                    sb.Append("<th>Sector</th>");
                    sb.Append("<th>Sección</th>");
                    sb.Append("<th>Asociación</th></tr>");
                    sb.Append("</thead>");

                    sb.Append("<tbody>");
                    while (drseldatos.Read())
                    {
                        cumplea = Convert.ToDateTime(drseldatos["Cumpleanos"]);
                        nombre = drseldatos["ApellidoPaterno"].ToString() + " " + drseldatos["ApellidoMaterno"].ToString() + " " + drseldatos["Nombre"].ToString();

                        sb.Append("<tr>");
                        sb.Append("<td>" + nombre + "</td>");
                        sb.Append("<td>" + cumplea.ToShortDateString() + "</td>");
                        sb.Append("<td>" + drseldatos["Direccion"].ToString() + "</td>");
                        sb.Append("<td>" + drseldatos["Telefono"].ToString() + "</td>");
                        sb.Append("<td>" + drseldatos["Sector"].ToString() + "</td>");
                        sb.Append("<td>" + drseldatos["Seccion"].ToString() + "</td>");
                        sb.Append("<td>" + drseldatos["Asociacion"].ToString() + "</td>");
                        sb.Append("</tr>");                        
                    }
                    
                    sb.Append("</tbody>");
                    sb.Append("</table>");
                    drseldatos.Close();
                }
            }
            Conn.Close();
            return sb.ToString();
        }
    }
}