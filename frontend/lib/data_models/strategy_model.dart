class InvestmentStrategy {
  final String id;
  final String strategyName;
  final String lowerRiskBound;
  final String upperRiskBound;
  final String description;

  InvestmentStrategy({
    this.id,
    this.strategyName,
    this.lowerRiskBound,
    this.upperRiskBound,
    this.description,
  });
}
