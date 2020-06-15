using System.ComponentModel.DataAnnotations;

namespace APITG.Domain.Models
{
  public class Usuario
  {
    public int Id { get; set; }
    [Required(ErrorMessage = "Campo obrigatório")]
    public string  Nome { get; set; }
    [Required(ErrorMessage = "Campo obrigatório")]
    public string Senha { get; set; }

  }
}
