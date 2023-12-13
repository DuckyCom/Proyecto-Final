using Microsoft.AspNetCore.Mvc;
using TPFinal.Models;
namespace TPFinal.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }
    public IActionResult MandarRegistro()
    {
        return View("Registro");
    }
    public IActionResult MandarContraseña()
    {
        return View("RecuperarContraseña");
    }
    [HttpPost]
    public IActionResult Login(string Usuario, string Contraseña)
    {
        ViewBag.Error = null;
        ViewBag.Usuario = BD.LoginUsuario(Usuario, Contraseña);
        if (ViewBag.Usuario == null)
        {
            ViewBag.Error = "Usuario o contraseña incorrectos";
            return View("Index");
        }
        else
        {
            
            return RedirectToAction("Home", new{IdUsuario = ViewBag.Usuario.ID});
        }
    }
       
        public IActionResult Registro(Usuarios usuarios)
    {
        BD.RegistrarUsuario(usuarios);
        return View("Index");
    }


    public IActionResult DeletePost(int IDPost, int IdUsuario)
    {
        Console.WriteLine(IdUsuario);
        BD.DeletePost(IDPost);

        return RedirectToAction("Profile", new{IdUsuario});
    }

        public IActionResult Profile(int IdUsuario)
    {
        ViewBag.Feeds = BD.ObtenerFeed();
        ViewBag.Usuario = BD.usuarios;
        return View("Profile");
    }

     public IActionResult Home(int IdUsuario)
    {
        ViewBag.Feeds = BD.ObtenerFeed();
        ViewBag.Usuario = BD.usuarios;
        return View("Home");
    }

      public IActionResult CrearPubli(int IdUsuario)
    {
        ViewBag.Usuario = BD.usuarios;
        return View("CrearPubli");
    }

        [HttpPost]
    public IActionResult GuardarPublicacion(int IdUsuario, string imagen, string descripcion)
    {
        
        BD.InsertarPost(IdUsuario, imagen, descripcion);
        return RedirectToAction("Profile", new{IdUsuario});
    }

     [HttpPost]
public ActionResult ToggleFavorito(int idPubli)
{
    bool si = true; // Cambiar a una variable basada en la acción del usuario
    int contadorLikesActualizado = BD.UpdateLike(idPubli, si);

    var result = new JsonResult(new { ContadorLikes = contadorLikesActualizado });
    return result;
}

 
}   