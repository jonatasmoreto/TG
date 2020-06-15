using APITG.Domain.Models;
using APITG.Domain.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace APITG.Controllers
{
  [Route("api/[controller]")]
  [ApiController]
  [Authorize]
  public class ClienteController : Controller
  {
    private readonly IClienteService _clienteService;

    public ClienteController(IClienteService clienteService)
    {
      _clienteService = clienteService;
    }    

    [HttpGet]
    public IEnumerable<Cliente> GetAll()
    {
      return _clienteService.GetAll();
    }

    [HttpGet("{id}", Name = "GetCliente")]
    public IActionResult GetById(int id)
    {
      var cliente = _clienteService.Find(id);

      if (cliente == null)
        return NotFound(new { mensagem = $"Usuário não encontrado!" });

      return new ObjectResult(cliente);
    }

    [HttpPost]
    public IActionResult Create([FromBody] Cliente cliente)
    {
      if (cliente == null)
        return BadRequest();

      if (_clienteService.EmailExiste(cliente.Email) == null)
      {
        _clienteService.Add(cliente);
        return CreatedAtRoute("GetCliente", new { id = cliente.Id }, cliente);
      }
      else
        return NotFound(new {mensagem = $"Email já cadastrado!" } );
    }

    [HttpPut("{id}")]
    public IActionResult Update(int id, [FromBody] Cliente cliente)
    {
      if (cliente == null || cliente.Id != id)
        return BadRequest();

      var _cliente = _clienteService.Find(id);

      if (_cliente == null)
        return NotFound();

      _cliente.Nome = cliente.Nome;
      _cliente.Email = cliente.Email;
      _cliente.Logotipo = cliente.Logotipo;

      _clienteService.Update(_cliente);

      return new NoContentResult();
    }

    [HttpDelete("{id}")]
    public IActionResult Delete(int id)
    {
      var cliente = _clienteService.Find(id);

      if (cliente == null)
        return NotFound();

      _clienteService.Remove(id);
      return new NoContentResult();

    }
  }
}
