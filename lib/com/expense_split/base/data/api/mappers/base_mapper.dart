
abstract class BaseMapper<TOutput, TInput>{

  TOutput convertResponseToEntity(TInput input);

}