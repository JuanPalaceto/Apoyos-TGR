using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Text;

public partial class Solicitudes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string atend = "", noatend = "";
        using (SqlConnection Conn = conn.Conecta())
        {
            using (SqlCommand command = new SqlCommand("PorcentajeSolicitudes", Conn))
            {
                command.CommandType = CommandType.StoredProcedure;
                // Esto es para traer variables de salida del proc, hacer uno por cada uno
                SqlParameter prmAtendidas = new SqlParameter("@Atendidas", SqlDbType.Int);
                prmAtendidas.Direction = ParameterDirection.Output;
                command.Parameters.Add(prmAtendidas);

                SqlParameter prmNoAtendidas = new SqlParameter("@NoAtendidas", SqlDbType.Int);
                prmNoAtendidas.Direction = ParameterDirection.Output;
                command.Parameters.Add(prmNoAtendidas);

                Conn.Open();
                // Qué hace esta línea y por qué sin ella no pasa el valor del output?¿, creo que esto es lo que hace que se ejecute el procedimiento            
                command.ExecuteNonQuery();

                atend = Convert.ToString(prmAtendidas.Value);
                // Para arreglar el error del carrito donde le decía que no se puede convertir de dbnull a otro tipo, sin ir a hacer condiciones en sql, se puede validar desde aquí con is DBNull ? 0 : parametro-aquí, el cual creo que funciona como si el valor es nulo, es decir, que no encontró un registro en la BD con ese id, y pues lo marca como nulo, se le asigna el valor 0 (Que no existe), pero así no lo marca como Nulo :') (Al parecer solo tiene problemas con los tipos int, los nvarchar no...
                noatend = Convert.ToString(prmNoAtendidas.Value);

                lblAtendida.Text = atend;
                lblNoAtendida.Text = noatend;    

                Conn.Close();
            }
        }
    }
}