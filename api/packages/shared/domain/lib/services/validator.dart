abstract class Validator<TIn, TOut> {
  const Validator();

  TOut validate(TIn value);
}
