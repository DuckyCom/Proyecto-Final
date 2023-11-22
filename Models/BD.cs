using System.Data.SqlClient;
using Dapper;
using System.Collections.Generic;
using System.Data;
namespace TPFinal.Models;

public class BD
{
    private static string _connectionString = @"Server=localhost;DataBase=TP09;Trusted_Connection=True;";

    public static List<Usuarios> LoginUsuario(string nombreUsuario, string contraseña)
    {
        List<Usuarios> usuarios = null;

        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "LoginUsuario";
            usuarios = db.Query<Usuarios>(sp, new { sp_Nombre = nombreUsuario, sp_Contraseña = contraseña }, commandType: CommandType.StoredProcedure).ToList();
        }

        return usuarios;
    }

    public static void RegistrarUsuario(Usuarios usuario)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "Registrar-Usuario";
            db.Execute(sp, new { Nombre = usuario.NombreUsuario, Contraseña = usuario.Contraseña, Correo = usuario.Mail }, commandType: CommandType.StoredProcedure);
        }
    }
}
