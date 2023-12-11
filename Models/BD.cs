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
            usuarios = db.QueryFirstOrDefault<Usuarios>(sp, new { @sp_Nombre = nombreUsuario, @sp_Contraseña = contraseña }, commandType: CommandType.StoredProcedure);
        }

        return usuarios;
    }

        public static Usuarios GetUsuario(int IdUsuario_){
        Usuarios Usuarios = null;
            using(SqlConnection db = new SqlConnection(_connectionString)){
            string sp = "Select Nombre, ID, Contraseña from Usuarios where ID = @pIdUsuario";
            Usuarios = db.QueryFirstOrDefault<Usuarios>(sp, new{pIdUsuario = IdUsuario_});
        }
        return Usuarios;
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
            string sp = "EliminarFilaPorID";
            db.Execute(sp, new { @ID = id }, commandType: CommandType.StoredProcedure);
        }
    }

    public void InsertarPost(int usuarioID, string imagen, string descripcion)
{
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        db.Open();

        string sp = "InsertarPost";

        // Utiliza Dapper para llamar al SP
        db.Execute(sp, new { UsuarioID = usuarioID, Imagen = imagen, Descripcion = descripcion }, commandType: CommandType.StoredProcedure);
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
