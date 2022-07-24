using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Text;

public partial class Beneficiarios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string Benefs()
    {
        StringBuilder sb = new StringBuilder();
        using (SqlConnection Conn = conn.Conecta())
        {
            using (SqlCommand seldata = new SqlCommand("SelBenefs", Conn))
            {
                DateTime cumplea;
                string nombre;
                seldata.CommandType = CommandType.StoredProcedure;
                Conn.Open();
                using (SqlDataReader drseldatos = seldata.ExecuteReader())
                {
                    //Empieza encabezadp
                    sb.Append("<table id=\"tablaBenfs\">");
                    sb.Append("<thead>");         
                    sb.Append("<tr><th>Nombre</th>");
                    sb.Append("<th>Cumpleaños</th>");
                    sb.Append("<th>CURP</th>");
                    sb.Append("<th>Clave de Elector</th>");
                    sb.Append("<th>Sección</th>");
                    sb.Append("<th>Dirección</th>");
                    sb.Append("<th>Código Postal</th></tr>");        
                    sb.Append("</thead>");
                                       
                    sb.Append("<tbody>");
                    while (drseldatos.Read())
                    {
                        cumplea = Convert.ToDateTime(drseldatos["Cumpleanos"]);
                        nombre = drseldatos["ApellidoPaterno"].ToString() + " " + drseldatos["ApellidoMaterno"].ToString() + " " + drseldatos["Nombre"].ToString();

                        sb.Append("<tr>");
                        sb.Append("<td>" + nombre + "</td>");
                        sb.Append("<td>" + cumplea.ToShortDateString() + "</td>");
                        sb.Append("<td>" + drseldatos["CURP"].ToString() + "</td>");
                        sb.Append("<td>" + drseldatos["ClaveEl"].ToString() + "</td>");
                        sb.Append("<td>" + drseldatos["Seccion"].ToString() + "</td>");
                        sb.Append("<td>" + drseldatos["Direccion"].ToString() + "</td>");
                        sb.Append("<td>" + drseldatos["CP"].ToString() + "</td>");
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