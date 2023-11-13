using Microsoft.AspNetCore.Mvc;

namespace TPFinal.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Register()
    {
        return View();
    }
}
