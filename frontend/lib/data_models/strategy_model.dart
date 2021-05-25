class InvestmentStrategy {
  final int strategyId;
  final String strategyName;
  final double lowerRiskBound;
  final double upperRiskBound;
  final String description;

  InvestmentStrategy({
    this.strategyId,
    this.strategyName,
    this.lowerRiskBound,
    this.upperRiskBound,
    this.description,
  });
}
