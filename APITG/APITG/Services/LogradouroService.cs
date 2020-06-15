using APITG.Domain.Models;
using APITG.Domain.Repositories;
using APITG.Domain.Services;
using System;
using System.Collections.Generic;

namespace APITG.Services
{
  public class LogradouroService: ILogradouroService
  {
    private readonly ILogradouroRepository _logradouroRepository;

    public LogradouroService(ILogradouroRepository logradouroRepository)
    {
      _logradouroRepository = logradouroRepository;
    }

    public void Add(Logradouro logradouro)
    {
      _logradouroRepository.Add(logradouro);
    }

    public Logradouro Find(int id)
    {
      return _logradouroRepository.Find(id);
    }

    public IEnumerable<Logradouro> GetAll()
    {
      return _logradouroRepository.GetAll();
    }

    public IEnumerable<Logradouro> GetAll(int clienteId)
    {
      return _logradouroRepository.GetAll(clienteId);
    }

    public void Remove(int id)
    {
      _logradouroRepository.Remove(id);
    }

    public void Update(Logradouro logradouro)
    {
      _logradouroRepository.Update(logradouro);
    }
  }
}
