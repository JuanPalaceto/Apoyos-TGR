using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Text;

public partial class Inicio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string AgregarSolicitud(string apPat, string apMat, string nombre, DateTime cumpl, string curp, string claveEl, string seccion, string direccion, string cp, int estatus, string apPatBen, string apMatBen, string nombreBen, DateTime cumplBen, string curpBen, string claveElBen, string seccionBen, string direccionBen, string cpBen, int estatusBen, DateTime fecha, int numPer, string apoyo, double montoSol, double montoProp, string gestion, int estado, string desc)
    {
        int Exitoso = 0;
        using (SqlConnection Conn = conn.Conecta())
        {
            using (SqlCommand comand = new SqlCommand("GrabaSolicitud", Conn))
            {
                comand.CommandType = CommandType.StoredProcedure;

                comand.Parameters.Add("@apellidoPaterno", SqlDbType.NVarChar, 50).Value = apPat;
                comand.Parameters.Add("@apellidoMaterno", SqlDbType.NVarChar, 50).Value = apMat;
                comand.Parameters.Add("@nombre", SqlDbType.NVarChar, 50).Value = nombre;
                comand.Parameters.Add("@cumpleanos", SqlDbType.Date).Value = cumpl;
                comand.Parameters.Add("@curp", SqlDbType.Char, 18).Value = curp;
                comand.Parameters.Add("@claveEl", SqlDbType.Char, 18).Value = claveEl;
                comand.Parameters.Add("@seccion", SqlDbType.NVarChar, 50).Value = seccion;
                comand.Parameters.Add("@direccion", SqlDbType.NVarChar, 50).Value = direccion;
                comand.Parameters.Add("@cp", SqlDbType.NChar, 5).Value = cp;
                comand.Parameters.Add("@status", SqlDbType.Bit).Value = estatus;

                comand.Parameters.Add("@apellidoPaternoBen", SqlDbType.NVarChar, 50).Value = apPatBen;
                comand.Parameters.Add("@apellidoMaternoBen", SqlDbType.NVarChar, 50).Value = apMatBen;
                comand.Parameters.Add("@nombreBen", SqlDbType.NVarChar, 50).Value = nombreBen;
                comand.Parameters.Add("@cumpleanosBen", SqlDbType.Date).Value = cumplBen;
                comand.Parameters.Add("@curpBen", SqlDbType.Char, 18).Value = curpBen;
                comand.Parameters.Add("@claveElBen", SqlDbType.Char, 18).Value = claveElBen;
                comand.Parameters.Add("@seccionBen", SqlDbType.NVarChar, 50).Value = seccionBen;
                comand.Parameters.Add("@direccionBen", SqlDbType.NVarChar, 50).Value = direccionBen;
                comand.Parameters.Add("@cpBen", SqlDbType.NChar, 5).Value = cpBen;
                comand.Parameters.Add("@statusBen", SqlDbType.Bit).Value = estatusBen;

                comand.Parameters.Add("@fecha", SqlDbType.Date).Value = fecha;
                comand.Parameters.Add("@numPersonas", SqlDbType.Int).Value = numPer;
                comand.Parameters.Add("@tipoApoyo", SqlDbType.NVarChar, 50).Value = apoyo;
                comand.Parameters.Add("@gestion", SqlDbType.NVarChar, 50).Value = gestion;
                comand.Parameters.Add("@montoSolicitado", SqlDbType.Decimal).Value = montoSol;
                comand.Parameters.Add("@montoProporcionado", SqlDbType.Decimal).Value = montoProp;
                comand.Parameters.Add("@estado", SqlDbType.Bit).Value = estado;
                comand.Parameters.Add("@observaciones", SqlDbType.NVarChar, 500).Value = desc;


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
    public static string Cumples()
    {
        StringBuilder sb = new StringBuilder();
        using (SqlConnection Conn = conn.Conecta())
        {
            using (SqlCommand seldata = new SqlCommand("SelCumpleanos", Conn))
            {
                string ben = "";
                DateTime cumplea;
                seldata.CommandType = CommandType.StoredProcedure;                
                Conn.Open();
                using (SqlDataReader drseldatos = seldata.ExecuteReader())
                {
                    //Empieza encabezadp
                    sb.Append("<table id=\"datatablesSimple\">");
                    sb.Append("<thead>");
                    sb.Append("<tr><th>Apellido Paterno</th>");
                    sb.Append("<th>Apellido Materno</th>");
                    sb.Append("<th>Nombre</th>");
                    sb.Append("<th>Cumpleaños</th>");
                    sb.Append("<th>CURP</th>");
                    sb.Append("<th>Clave de Elector</th>");
                    sb.Append("<th>Sección</th>");
                    sb.Append("<th>Dirección</th>");
                    sb.Append("<th>Código Postal</th>");
                    sb.Append("<th>Beneficiario</th></tr>");
                    sb.Append("</thead>");

                    //sb.Append("<tfoot>");
                    //sb.Append("<tr><th>Apellido Paterno</th>");
                    //sb.Append("<th>Apellido Materno</th>");
                    //sb.Append("<th>Nombre</th>");
                    //sb.Append("<th>Cumpleaños</th>");
                    //sb.Append("<th>CURP</th>");
                    //sb.Append("<th>Clave de Elector</th>");
                    //sb.Append("<th>Sección</th>");
                    //sb.Append("<th>Dirección</th>");
                    //sb.Append("<th>Código Postal</th>");
                    //sb.Append("<th>Beneficiario</th></tr>");
                    //sb.Append("</tfoot>");                    
                    sb.Append("<tbody>");
                    while (drseldatos.Read())
                    {                        
                        cumplea = Convert.ToDateTime(drseldatos["Cumpleanos"]);                        
                        if (drseldatos["Estatus"].ToString() == "True")
                        {
                            ben = "SÍ";
                        } else
                        {
                            ben = "NO";
                        }

                        sb.Append("<tr>");
                        sb.Append("<td>"+drseldatos["ApellidoPaterno"].ToString()+"</td>");
                        sb.Append("<td>"+drseldatos["ApellidoMaterno"].ToString()+"</td>");
                        sb.Append("<td>"+drseldatos["Nombre"].ToString()+"</td>");
                        sb.Append("<td>"+ cumplea.ToShortDateString()+"</td>");
                        sb.Append("<td>"+drseldatos["CURP"].ToString()+"</td>");
                        sb.Append("<td>"+drseldatos["ClaveEl"].ToString()+"</td>");
                        sb.Append("<td>"+drseldatos["Seccion"].ToString()+"</td>");
                        sb.Append("<td>"+drseldatos["Direccion"].ToString()+"</td>");
                        sb.Append("<td>"+drseldatos["CP"].ToString()+"</td>");
                        sb.Append("<td>"+ben+"</td>");
                        sb.Append("</tr>");
                    }
                    //if (drseldatos.HasRows)
                    //{
                    //    //sb.Append("</tbody></table>");
                    //}
                    //else
                    //{
                    //    sb.Append("<li class=\"notification-item\">");
                    //    sb.Append("<div>");
                    //    sb.Append("<h4>Nada en el carrito</h4>");
                    //    sb.Append("</div>");
                    //    sb.Append("<hr class=\"dropdown-divider\">");
                    //    sb.Append("</li>");
                    //}
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