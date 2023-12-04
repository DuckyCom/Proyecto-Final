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
            return RedirectToAction("Home", new{IdUsuario = ViewBag.Usuario.Id});
        }
    }
        public IActionResult Home(int IdUsuario)
    {
        ViewBag.Usuario = BD.GetUsuario(IdUsuario);

        return View();
    }
}   