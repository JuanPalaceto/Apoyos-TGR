using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected string NombreUser = "Hola";
    // Línea sistema de carrito
    // Y aquí tendría que declarar name como public para poder acceder a ella en el front public string name = "";
    protected void Page_Load(object sender, EventArgs e)
    {        
        if (Session["idusuario"] != null)
        {
            // Esto es una forma de traer datos, con variables de sesión, se pueden usar en toooodas las páginas
            string usuariologeado = Session["nombreUsuario"].ToString();
            lblSesion.Text = usuariologeado;

            /* string nombreUsuario = Session["nombreUsuario"].ToString();
            lblNombreSesion.Text = "Bienvenido(a), " + nombreUsuario; */

            // Línea sistema carrito
            // Esta es otra forma de mostrar datos, usando directamente la variable en el front
            // name = Convert.ToString(HttpContext.Current.Session["nombreUsuario"]);
            // Entonces en el front en teoría debería ir <%=name %> para recuperar la variable

            // Ejemplo pasando un solo valor, parecido a como se trae los valores de laas tablas y sin variable de sesión, pero con <%=variable %>
            int idUser = Convert.ToInt32(Session["idusuario"]);

            using (SqlConnection Conn = conn.Conecta())
            {
                using (SqlCommand command = new SqlCommand("ObtenerDatosUsuario", Conn))
                {
                    command.CommandType = CommandType.StoredProcedure;                    
                    command.Parameters.Add("@idusuario", SqlDbType.Int).Value = idUser;
                    Conn.Open();

                    using (SqlDataReader dr = command.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            NombreUser = "Bienvenido(a), " + Convert.ToString(dr["Nombre"]);
                        }
                        dr.Close();
                    }
                    Conn.Close();
                }
            }            
        }
        else
        {            
            Response.Redirect("Login.aspx");
        }
    }

    protected void CerrarSesion_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("Login.aspx");    
    }
}
