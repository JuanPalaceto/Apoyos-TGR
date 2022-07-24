using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Login :  System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnIngresar_Click(object sender, EventArgs e)
    {
        string user = txtUsuario.Text;
        string pass = txtPass.Text;

        string nombre = "";
        int idusu = 0;

        using (SqlConnection Conn = conn.Conecta())
        {
            using (SqlCommand command = new SqlCommand("ValidarUsuario", Conn))
            {
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@usuario", SqlDbType.NVarChar, 50).Value=user;
                command.Parameters.Add("@pass", SqlDbType.NVarChar, 50).Value = pass;
                
                // Esto es para traer variables de salida del proc, hacer uno por cada uno
                SqlParameter prmNombreUsuario = new SqlParameter("@nombre", SqlDbType.NVarChar, 50);
                prmNombreUsuario.Direction = ParameterDirection.Output;
                command.Parameters.Add(prmNombreUsuario);

                SqlParameter prmIdUsuario = new SqlParameter("@idusuario", SqlDbType.Int);
                prmIdUsuario.Direction = ParameterDirection.Output;
                command.Parameters.Add(prmIdUsuario);

                Conn.Open();
                // Qué hace esta línea y por qué sin ella no pasa el valor del output?¿, creo que esto es lo que hace que se ejecute el procedimiento            
                command.ExecuteNonQuery();

                nombre = Convert.ToString(prmNombreUsuario.Value);        
                // Para arreglar el error del carrito donde le decía que no se puede convertir de dbnull a otro tipo, sin ir a hacer condiciones en sql, se puede validar desde aquí con is DBNull ? 0 : parametro-aquí, el cual creo que funciona como si el valor es nulo, es decir, que no encontró un registro en la BD con ese id, y pues lo marca como nulo, se le asigna el valor 0 (Que no existe), pero así no lo marca como Nulo :') (Al parecer solo tiene problemas con los tipos int, los nvarchar no...
                idusu = Convert.ToInt32(prmIdUsuario.Value is DBNull ? 0 : prmIdUsuario.Value);
 
                SqlDataReader dr = command.ExecuteReader();
                if (dr.Read())
                {
                    // Sesión de usuario aquí
                    Session["idusuario"] = idusu;
                    Session["nombreUsuario"] = nombre;
                    // Esto ni sirve, era para quitar el mensaje de error según xD
                    divError.Attributes.Add("class", "d-none");
                    // Esto es para redirigir
                    Response.Redirect("Inicio.aspx");              
                } else
                {      
                    lblError.Text = "Error, el Usuario o la Contraseña son Incorrectos !";    
                    // Esto sirve para quitar al div la clase d-none y que se haga visible, el div debe llevar runat="server" para poder usarse aquí
                    divError.Attributes["class"] = divError.Attributes["class"].Replace("d-none", "").Trim();               
                }
                Conn.Close();
            }
        }
    }
}