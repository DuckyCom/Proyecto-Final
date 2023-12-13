using System.Data.SqlClient;
using Dapper;
using System.Collections.Generic;
using System.Data;
namespace TPFinal.Models;

public class BD
{
    private static string _connectionString = @"Server=DESKTOP-E3OHN6P\SQLEXPRESS01;DataBase=DBPetNex;Trusted_Connection=True;";
    public static Usuarios usuarios = null;
    public static Usuarios LoginUsuario(string nombreUsuario, string contraseña)
    {

        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "Login-Usuario";
            usuarios = db.QueryFirstOrDefault<Usuarios>(sp, new { @sp_Nombre = nombreUsuario, @sp_Contraseña = contraseña }, commandType: CommandType.StoredProcedure);
        }

        return usuarios;
    }

   
    public static void RegistrarUsuario(Usuarios usuario)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "Registrar-Usuario";
            db.Execute(sp, new { @Nombre = usuario.Nombre, @Contraseña = usuario.Contraseña, @Correo = usuario.Mail }, commandType: CommandType.StoredProcedure);
        }
    }
    public static List<PostsFeed> ObtenerFeed()
    {
        string sp = "select P.ID, P.UsuarioID, P.Imagen, P.Descripcion, P.ContadorLikes, U.Nombre from PostsFeed P inner join Usuarios U ON P.UsuarioID = U.ID";
        using (SqlConnection db = new SqlConnection(_connectionString)){
           return db.Query<PostsFeed>(sp).ToList();
        }
    }

        public static void DeletePost(int id)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "Delete from PostsFeed Where ID = @deletepostID";
            db.Execute(sp, new { deletepostID = id });
        }
    }

    public static void InsertarPost(int usuarioID, string imagen, string descripcion)
{
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
            string sp = "Insert Into PostsFeed (UsuarioID,Imagen,Descripcion) Values (@pusuario,@pimagen,@pdescripcion)";
            db.Execute(sp, new { pusuario = usuarioID,pimagen = imagen, pdescripcion = descripcion});
    }
}



//     public static List<Favorito> GuardarFavoritos(int idUsuario, int idpublicacion)
// {
//     List<Favorito> guardarFav = null;
//     using (SqlConnection DB = new SqlConnection(_connectionString))
//     {
//         string SP = "GuardarFavoritos";
//         guardarFav = DB.Query<Favorito>(SP, new { IdUser = idUsu, IdCasa = idCasa },
//             commandType: CommandType.StoredProcedure).ToList();
//     }
//     return guardarFav;
// }

}
