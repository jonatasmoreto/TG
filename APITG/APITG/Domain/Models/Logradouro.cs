using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace APITG.Domain.Models
{
  public class Logradouro
  {
    public int Id { get; set; }

    [Required(ErrorMessage = "Campo obrigatório")]
    public string Endereco { get; set; }

    [Required(ErrorMessage = "Campo obrigatório")]
    public int ClienteId { get; set; }

    [NotMapped]
    public Cliente cliente { get; set; }
  }
}
