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
  public class LogradouroController : Controller
  {
    private readonly ILogradouroService _logradouroService;

    public LogradouroController(ILogradouroService logradouroService)
    {
      _logradouroService = logradouroService;
    }

    [HttpGet]
    public IEnumerable<Logradouro> GetAll()
    {
      return _logradouroService.GetAll();
    }

    [HttpGet("{id}", Name = "GetLogradouro")]
    public IActionResult Get(int id)
    {
      var logradouro = _logradouroService.Find(id);

      if (logradouro == null)
        return NotFound();

      return new ObjectResult(logradouro);
    }

    [HttpPost]
    public IActionResult Create([FromBody] Logradouro logradouro)
    {
      if (logradouro == null)
        return BadRequest();

      _logradouroService.Add(logradouro);

      return CreatedAtRoute("GetLogradouro", new { id = logradouro.Id }, logradouro);
    }

    [HttpPut("{id}")]
    public IActionResult Update(int id, [FromBody] Logradouro logradouro)
    {
      if (logradouro == null || logradouro.Id != id)
        return BadRequest();

      var _logradouro = _logradouroService.Find(id);

      if (_logradouro == null)
        return NotFound();

      _logradouro.Endereco = logradouro.Endereco;

      _logradouroService.Update(_logradouro);
      return new NoContentResult();
    }

    [HttpDelete("{id}")]
    public IActionResult Delete(int id)
    {
      var logradouro = _logradouroService.Find(id);

      if (logradouro == null)
        return NotFound();

      _logradouroService.Remove(id);
      return new NoContentResult();
    }
  }
}
