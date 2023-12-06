using System.Data.SqlClient;
using Dapper;
using System.Collections.Generic;
using System.Data;
namespace TPFinal.Models;

public class BD
{
    private static string _connectionString = @"Server=DESKTOP-E3OHN6P\SQLEXPRESS01;DataBase=DBPetNex;Trusted_Connection=True;";

    public static Usuarios LoginUsuario(string nombreUsuario, string contraseña)
    {
        Usuarios usuarios = null;

        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "Login-Usuario";
            usuarios = db.QueryFirstOrDefault<Usuarios>(sp, new { @Nombre = nombreUsuario, @Contraseña = contraseña }, commandType: CommandType.StoredProcedure);
        }

        return usuarios;
    }

        public static Usuarios GetUsuario(int IdUsuario_){
        Usuarios Usuarios = null;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "Select Nombre from Usuarios where ID = @pIdUsuario";
            Usuarios = db.QueryFirstOrDefault<Usuarios>(sp, new{pIdUsuario = IdUsuario_});
        }
        return Usuarios;
    }

    public static void RegistrarUsuario(Usuarios usuario)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "Registrar-Usuario";
            db.Execute(sp, new { @Nombre = usuario.Nombre, @Contraseña = usuario.Contrasenia, @Correo = usuario.Mail }, commandType: CommandType.StoredProcedure);
        }
    }
    public  static List<PostsFeed> ObtenerFeed()
    {
        string sp = "Select * From PostsFeed";
        using (SqlConnection db = new SqlConnection(_connectionString)){
           return db.Query<PostsFeed>(sp).ToList();
        }
    }
}
