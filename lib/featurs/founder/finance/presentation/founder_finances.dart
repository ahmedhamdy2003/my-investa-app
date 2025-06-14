import 'package:flutter/material.dart';
import 'package:investa4/core/widgets/founder_side_bar.dart';
import 'package:investa4/core/widgets/standard_founder_scaffold.dart';

TextStyle _headerTextStyle = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w800,
  color: Color(0xFF343C6A),
);

class FounderFinance extends StatelessWidget {
  const FounderFinance({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for DailyTransaction
    final List<DailyTransaction> dailyTransactions = [
      DailyTransaction(
        type: 'Income',
        description: 'freelance',
        amount: '\$1200',
        paymentMethod: 'pay pal',
        responsible: 'ahmed mo',
      ),
      DailyTransaction(
        type: 'Expense',
        description: 'internet Bill',
        amount: '\$1000',
        paymentMethod: 'Bank',
        responsible: 'belal amir',
      ),
      DailyTransaction(
        type: 'Income',
        description: 'freelance',
        amount: '\$800',
        paymentMethod: 'Cash',
        responsible: 'Mo ahmed',
      ),
      DailyTransaction(
        type: 'Expense',
        description: 'office Rent',
        amount: '\$30',
        paymentMethod: 'Credit',
        responsible: 'adam amir',
      ),
      DailyTransaction(
        type: 'Expense',
        description: 'internet Bill',
        amount: '\$300',
        paymentMethod: 'pay pal',
        responsible: 'so moslah',
      ),
      DailyTransaction(
        type: 'Income',
        description: 'freelance',
        amount: '\$60',
        paymentMethod: 'Bank',
        responsible: 'ahmed mo',
      ),
      DailyTransaction(
        type: 'Income',
        description: 'office Rent',
        amount: '\$250',
        paymentMethod: 'Cash',
        responsible: 'Mo ahmed',
      ),
    ];

    // Mock data for MonthlySummary
    final List<MonthlySummary> monthlySummaries = [
      MonthlySummary(
        month: 'January',
        totalIncome: '\$5000',
        totalExpenses: '\$2000',
        netProfit: '\$3000',
        profitPercentage: '60%',
      ),
      MonthlySummary(
        month: 'February',
        totalIncome: '\$6000',
        totalExpenses: '\$6240',
        netProfit: '\$2400',
        profitPercentage: '50%',
      ),
      MonthlySummary(
        month: 'March',
        totalIncome: '\$2000',
        totalExpenses: '\$500',
        netProfit: '\$1000',
        profitPercentage: '20%',
      ),
    ];

    return StandardFounderScaffold(
      screenType: FounderSideMenuScreen.finance,
      isMain: false,
      title: 'Finance',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Daily Transaction', style: _headerTextStyle),
                  ElevatedButton(
                    onPressed: () {
                      showAddTransactionDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text(
                      'Add New Transaction',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              DailyTransactionTableWidget(transactions: dailyTransactions),
              const SizedBox(height: 30),
              Text('Monthly Summary', style: _headerTextStyle),
              const SizedBox(height: 10),
              MonthlySummaryTableWidget(summaries: monthlySummaries),
            ],
          ),
        ),
      ),
    );
  }
}

void showAddTransactionDialog(
  BuildContext context,
  // void Function(Product product) onSave,
) {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final roiController = TextEditingController();
  final availableQtyController = TextEditingController();
  final soldQtyController = TextEditingController();
  final responsibleController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios, size: 18),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'Add New Transaction',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildTextField('Type', nameController),
                _buildTextField('Description', priceController),
                _buildTextField('Amount', roiController),
                _buildTextField('Available Qty', availableQtyController),
                _buildTextField('Payment Method', soldQtyController),
                _buildTextField('Responsible', responsibleController),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // final product = Product(
                      //   name: nameController.text,
                      //   price: priceController.text,
                      //   roi: roiController.text,
                      //   availableQty:
                      //       int.tryParse(availableQtyController.text) ?? 0,
                      //   soldQty: int.tryParse(soldQtyController.text) ?? 0,
                      // );
                      // onSave(product);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo[900],
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _buildTextField(String label, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    ),
  );
}

class DailyTransaction {
  final String type;
  final String description;
  final String amount;
  final String paymentMethod;
  final String responsible;

  DailyTransaction({
    required this.type,
    required this.description,
    required this.amount,
    required this.paymentMethod,
    required this.responsible,
  });
}

class MonthlySummary {
  final String month;
  final String totalIncome;
  final String totalExpenses;
  final String netProfit;
  final String profitPercentage;

  MonthlySummary({
    required this.month,
    required this.totalIncome,
    required this.totalExpenses,
    required this.netProfit,
    required this.profitPercentage,
  });
}

class DailyTransactionTableWidget extends StatelessWidget {
  final List<DailyTransaction> transactions;

  const DailyTransactionTableWidget({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(1.5),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(1.5),
          3: FlexColumnWidth(2),
          4: FlexColumnWidth(2),
        },
        children: [
          _buildHeaderRow(),
          _buildDividerRow(),
          ...transactions.map((t) => _buildDataRow(t)).toList(),
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
      children: [
        _TableCellText('Type', isHeader: true),
        _TableCellText('Description', isHeader: true),
        _TableCellText('Amount (\$)', isHeader: true),
        _TableCellText('Payment Method', isHeader: true),
        _TableCellText('Responsible', isHeader: true),
      ],
    );
  }

  TableRow _buildDataRow(DailyTransaction t) {
    return TableRow(
      children: [
        _TableCellText(t.type),
        _TableCellText(t.description),
        _TableCellText(t.amount),
        _TableCellText(t.paymentMethod),
        _TableCellText(t.responsible),
      ],
    );
  }
}

class MonthlySummaryTableWidget extends StatelessWidget {
  final List<MonthlySummary> summaries;

  const MonthlySummaryTableWidget({super.key, required this.summaries});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Table(
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
          ...summaries.map((s) => _buildDataRow(s)).toList(),
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
      children: [
        _TableCellText('Month', isHeader: true),
        _TableCellText('Total Income(\$)', isHeader: true),
        _TableCellText('Total Expenses', isHeader: true),
        _TableCellText('Net Profit(\$)', isHeader: true),
        _TableCellText('Profit %', isHeader: true),
      ],
    );
  }

  TableRow _buildDataRow(MonthlySummary s) {
    return TableRow(
      children: [
        _TableCellText(s.month),
        _TableCellText(s.totalIncome),
        _TableCellText(s.totalExpenses),
        _TableCellText(s.netProfit),
        _TableCellText(s.profitPercentage),
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
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: 14,
          color: isHeader ? const Color(0xFF718EBF) : Colors.black,
        ),
      ),
    );
  }
}
