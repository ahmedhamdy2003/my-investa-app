import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';
import 'package:investa4/featurs/transactions/presentation/widgets/tables_model.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text('Recent Transactions', style: AppStyles.vsTitleStyle),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(10),
          child: _buildTable(
            headers: [
              'Month',
              'Net Investment',
              'Payment Amount',
              'Platform fee (4%)',
              'Reinsurance (10%/Q)',
            ],
            dataRows:
                monthlyData
                    .map(
                      (data) => [
                        data.month,
                        data.netInvestment.toStringAsFixed(0),
                        data.paymentAmount.toStringAsFixed(0),
                        data.platformFee.toStringAsFixed(0),
                        data.reinsurance.toStringAsFixed(0),
                      ],
                    )
                    .toList(),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text('Recent Transactions', style: AppStyles.vsTitleStyle),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(10),
          child: _buildTable(
            headers: [
              'Quarter',
              'Reinsurance',
              'Platform fee (4%)',
              'Net Investment',
              'Payment Amount',
            ],
            dataRows: [
              ...quarterlyData.map(
                (data) => [
                  data.quarter,
                  data.reinsurance.toStringAsFixed(0),
                  data.platformFee.toStringAsFixed(0),
                  data.netInvestment.toStringAsFixed(0),
                  data.paymentAmount.toStringAsFixed(0),
                ],
              ),
              ['Annual Amount', '7,200', '2,880', '72,000', '82,080'],
            ],
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }

  Widget _buildTable({
    required List<String> headers,
    required List<List<String>> dataRows,
  }) {
    // number of columns
    final columnCount = headers.length;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Table(
            columnWidths: {
              for (var i in List.generate(columnCount, (i) => i))
                i: const FlexColumnWidth(1),
            },
            children: [
              // Header row with bottom divider
              TableRow(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFF4F5F7), width: 1),
                  ),
                ),
                children:
                    headers
                        .map(
                          (h) => Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 8,
                            ),
                            child: Text(h, style: AppStyles.dashISubtemTitle),
                          ),
                        )
                        .toList(),
              ),
              // Data rows
              for (var rowIndex = 0; rowIndex < dataRows.length; rowIndex++)
                TableRow(
                  children:
                      dataRows[rowIndex]
                          .map(
                            (cell) => Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 8,
                              ),
                              child: Text(
                                cell,
                                style:
                                    cell.contains('Annual Amount')
                                        ? AppStyles.tableDataStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                        )
                                        : AppStyles.tableDataStyle,
                              ),
                            ),
                          )
                          .toList(),
                ),
            ],
          ),
        );
      },
    );
  }
}
