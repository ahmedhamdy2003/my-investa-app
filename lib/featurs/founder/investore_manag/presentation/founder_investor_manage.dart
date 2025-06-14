import 'package:flutter/material.dart';
import 'package:investa4/core/widgets/founder_side_bar.dart';
import 'package:investa4/core/widgets/standard_founder_scaffold.dart';

class FounderInvestorManage extends StatelessWidget {
  const FounderInvestorManage({super.key});

  @override
  Widget build(BuildContext context) {
    return StandardFounderScaffold(
      screenType: FounderSideMenuScreen.investorManage,
      isMain: false,
      title: 'Investor Management',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InvestmentTableWidget(
              investors: [
                Investor(
                  name: "ahmed mo",
                  totalInvestment: "\$50000",
                  returns: "\$7000",
                  investmentDate: "10-1-2025",
                  status: "Active",
                ),
                Investor(
                  name: "sara ali",
                  totalInvestment: "\$30000",
                  returns: "\$5000",
                  investmentDate: "15-2-2025",
                  status: "Active",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InvestmentTableWidget extends StatelessWidget {
  final List<Investor> investors;

  const InvestmentTableWidget({super.key, required this.investors});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(10),
      ),
      child: Table(
        // border: TableBorder.symmetric(
        //   inside: BorderSide(color: Colors.grey.shade300),
        // ),
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(2),
          3: FlexColumnWidth(2),
          4: FlexColumnWidth(1.5),
        },
        children: [
          _buildHeaderRow(),
          _buildDividerRow(),
          ...investors.map((i) => _buildDataRow(i)).toList(),
        ],
      ),
    );
  }

  TableRow _buildDividerRow() {
    return TableRow(
      children: List.generate(5, (_) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          height: 1,
          color: Colors.grey.shade300,
        );
      }),
    );
  }

  TableRow _buildHeaderRow() {
    return const TableRow(
      // decoration: BoxDecoration(color: Colors.blue.shade50),
      children: [
        _TableCellText('Investor', isHeader: true),
        _TableCellText('Total Investment', isHeader: true),
        _TableCellText('Returns', isHeader: true),
        _TableCellText('Investment Date', isHeader: true),
        _TableCellText('Status', isHeader: true),
      ],
    );
  }

  TableRow _buildDataRow(Investor i) {
    return TableRow(
      children: [
        _TableCellText(i.name),
        _TableCellText(i.totalInvestment),
        _TableCellText(i.returns),
        _TableCellText(i.investmentDate),
        _TableCellText(i.status),
      ],
    );
  }
}

class _TableCellText extends StatelessWidget {
  final String text;
  final bool isHeader;

  const _TableCellText(this.text, {this.isHeader = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          color: isHeader ? const Color(0xFF718EBF) : Colors.black87,
        ),
      ),
    );
  }
}

class Investor {
  final String name;
  final String totalInvestment;
  final String returns;
  final String investmentDate;
  final String status;

  Investor({
    required this.name,
    required this.totalInvestment,
    required this.returns,
    required this.investmentDate,
    required this.status,
  });
}
