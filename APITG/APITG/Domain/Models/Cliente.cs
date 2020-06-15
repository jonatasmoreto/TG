using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace APITG.Domain.Models
{
  public class Cliente
  { 
    public int Id { get; set; }
    [Required(ErrorMessage = "Campo obrigatório")]
    public string Nome { get; set; }
    [Required(ErrorMessage = "Campo obrigatório")]
    public string Email { get; set; }
    [Required(ErrorMessage = "Campo obrigatório")]
    public string Logotipo { get; set; }
    public IEnumerable<Logradouro> Enderecos { get; set; }
  }
}
