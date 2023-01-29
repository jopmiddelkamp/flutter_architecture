abstract class InfrastructureMapper<From, To> {
  To toDto(From entity);
  From toEntity(To dto);
}
