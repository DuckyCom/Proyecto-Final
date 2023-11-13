using System.Data.SqlClient;
using Dapper;
using System.Collections.Generic;

public class BD{
    private static string _connectionString = @"Server=localhost;DataBase=TP09;Trusted_Connection=True;";
    
    public static List<Usuarios> LoginUsuario(string Nombre, string Contraseña){
        List<Usuarios> Usuarios = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "LoginUsuario";
            Usuarios = db.Query<Usuarios>(sp, new{Nombre = Nombre, Contraseña = Contraseña}, commandType: CommandType.StoredProcedure).ToList();
        }
        return Usuarios;
    }

     public static void RegistrarUsuario(Usuarios Usuario){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "RegistrarUsuario";
            db.Execute(sp, new{Nombre = Usuarios.NombreUsuario, Contraseña = Usuarios.Contraseña,
            Correo = Usuarios.Mail}, commandType: CommandType.StoredProcedure);
        }
    }

}