using System.Data.SqlClient;
using Dapper;
using System.Collections.Generic;
using System.Data;
namespace TPFinal.Models;

public class BD
{
    private static string _connectionString = @"Server=localhost;DataBase=DBPetNex;Trusted_Connection=True;";

    public static Usuarios LoginUsuario(string nombreUsuario, string contraseña)
    {
        Usuarios usuarios = null;

        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "Login-Usuario";
            usuarios = db.QueryFirstOrDefault<Usuarios>(sp, new { sp_Nombre = nombreUsuario, sp_Contraseña = contraseña }, commandType: CommandType.StoredProcedure);
        }

        return usuarios;
    }

        public static Usuarios GetUsuario(int IdUsuario_){
        Usuarios Usuarios = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "GetUsuario";
            Usuarios = db.QueryFirstOrDefault<Usuarios>(sp, new{IdUsuario = IdUsuario_}, commandType: CommandType.StoredProcedure);
        }
        return Usuarios;
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
