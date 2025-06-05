
// models.dart

class MonthlyTransaction {
  final String month;
  final double netInvestment;
  final double paymentAmount;
  final double platformFee;
  final double reinsurance;

  MonthlyTransaction({
    required this.month,
    required this.netInvestment,
    required this.paymentAmount,
    required this.platformFee,
    required this.reinsurance,
  });
}

class QuarterlyTransaction {
  final String quarter;
  final double reinsurance;
  final double platformFee;
  final double netInvestment;
  final double paymentAmount;

  QuarterlyTransaction({
    required this.quarter,
    required this.reinsurance,
    required this.platformFee,
    required this.netInvestment,
    required this.paymentAmount,
  });
}

  final List<MonthlyTransaction> monthlyData = [
    MonthlyTransaction(
        month: 'January',
        netInvestment: 6000,
        paymentAmount: 8040,
        platformFee: 240,
        reinsurance: 1800),
    MonthlyTransaction(
        month: 'February',
        netInvestment: 6000,
        paymentAmount: 6240,
        platformFee: 240,
        reinsurance: 0),
    MonthlyTransaction(
        month: 'March',
        netInvestment: 6000,
        paymentAmount: 6240,
        platformFee: 240,
        reinsurance: 0),
    MonthlyTransaction(
        month: 'April',
        netInvestment: 6000,
        paymentAmount: 8040,
        platformFee: 240,
        reinsurance: 1800),
    MonthlyTransaction(
        month: 'May',
        netInvestment: 6000,
        paymentAmount: 6240,
        platformFee: 240,
        reinsurance: 0),
    MonthlyTransaction(
        month: 'June',
        netInvestment: 6000,
        paymentAmount: 6240,
        platformFee: 240,
        reinsurance: 0),
    MonthlyTransaction(
        month: 'July',
        netInvestment: 6000,
        paymentAmount: 8040,
        platformFee: 240,
        reinsurance: 1800),
  ];

  final List<QuarterlyTransaction> quarterlyData = [
    QuarterlyTransaction(
        quarter: 'Q1',
        reinsurance: 1800,
        platformFee: 720,
        netInvestment: 18000,
        paymentAmount: 20520),
    QuarterlyTransaction(
        quarter: 'Q2',
        reinsurance: 1800,
        platformFee: 720,
        netInvestment: 18000,
        paymentAmount: 20520),
    QuarterlyTransaction(
        quarter: 'Q3',
        reinsurance: 1800,
        platformFee: 720,
        netInvestment: 18000,
        paymentAmount: 20520),
    QuarterlyTransaction(
        quarter: 'Q4',
        reinsurance: 1800,
        platformFee: 720,
        netInvestment: 18000,
        paymentAmount: 20520),
  ];


class AnnualSummary {
  final double reinsurance;
  final double platformFee;
  final double netInvestment;
  final double paymentAmount;

  AnnualSummary({
    required this.reinsurance,
    required this.platformFee,
    required this.netInvestment,
    required this.paymentAmount,
  });
}
