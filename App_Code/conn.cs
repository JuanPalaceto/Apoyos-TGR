using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de conn
/// </summary>
public class conn
{
	public conn()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    public static SqlConnection Conecta()
    {
        SqlConnection Sqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        //Regresa el ConnectionString
        return Sqlconn;
    }
}