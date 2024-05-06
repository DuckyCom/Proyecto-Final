using System.Data.SqlClient;
using Dapper;
using System.Collections.Generic;
using System.Data;
namespace TPFinal.Models;

public class BD
{
    private static string _connectionString = @"Server=localhost;DataBase=DBPetNex;Trusted_Connection=True;";
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
            string sp = "Insert Into PostsFeed (UsuarioID,Imagen,Descripcion,ContadorLikes) Values (@pusuario,@pimagen,@pdescripcion, @pcontadorlikes)";
            db.Execute(sp, new { pusuario = usuarioID,pimagen = imagen, pdescripcion = descripcion, pcontadorlikes = 0}); //0 porque no usamos bots
    }
}


public static int UpdateLike(int idPubli, bool PorSiOPorNo)
{
    int contadorActualizado;

    if (PorSiOPorNo)
    {
        using (SqlConnection DB = new SqlConnection(_connectionString))
        {
            string sp = "Update PostsFeed set ContadorLikes = ContadorLikes + 1 output INSERTED.ContadorLikes where ID = @pidPubli";
            contadorActualizado = DB.ExecuteScalar<int>(sp, new { pidPubli = idPubli });
        }
    }
    else
    {
        using (SqlConnection DB = new SqlConnection(_connectionString))
        {
            string sp = "Update PostsFeed set ContadorLikes = ContadorLikes - 1 output INSERTED.ContadorLikes where ID = @pidPubli";
            contadorActualizado = DB.ExecuteScalar<int>(sp, new { pidPubli = idPubli });
        }
    }

    return contadorActualizado;
}

public static List<PostsSeguidores> ObtenerFeedSeguidores(int IdUsuario)
{   
    string sp = @"
        SELECT PF.ID, PF.UsuarioID, PF.Imagen, PF.Descripcion, PF.ContadorLikes, U.Nombre 
        FROM [dbo].[PostsFeed] PF 
        INNER JOIN [dbo].[Usuarios] U ON PF.UsuarioID = U.ID 
        INNER JOIN [dbo].[Seguidores] S ON PF.UsuarioID = S.UsuarioID
        WHERE S.SeguidorID = @pIdUsuario;";
    
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        return db.Query<PostsSeguidores>(sp, new { pIdUsuario = IdUsuario }).ToList();
    }
}




}




