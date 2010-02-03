namespace Ccs.Contracts
{
  public interface IMapper
  {
    TResult Map<TArg, TResult>(TArg entity);
  }
}