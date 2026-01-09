import 'package:expose_corruption_app/components/bottom_navbar.dart';
import 'package:expose_corruption_app/utils/app_theme.dart';
import 'package:flutter/material.dart';

class ReportDetails extends StatefulWidget {
  const ReportDetails({super.key});

  @override
  State<ReportDetails> createState() => _ReportDetailsState();
}

class _ReportDetailsState extends State<ReportDetails> {
  final List<Map<String, dynamic>> _reports = [
    {
      'id': 'RPT-001',
      'category': 'Bribery',
      'description': 'Police officer demanding bribe at checkpoint',
      'location': 'Nairobi, Kenya',
      'date': '2026-01-05',
      'status': 'Under Review',
    },
    {
      'id': 'RPT-002',
      'category': 'Embezzlement',
      'description': 'Missing funds from community project',
      'location': 'Mombasa, Kenya',
      'date': '2025-12-28',
      'status': 'Investigating',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.primaryColor,
        title: const Text(
          'My Reports',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(currentIndex: 2),
      body: ListView.builder(
        padding: const EdgeInsets.all(AppTheme.spacing16),
        itemCount: _reports.length,
        itemBuilder: (context, index) {
          final report = _reports[index];
          return _buildReportCard(report);
        },
      ),
    );
  }

  Widget _buildReportCard(Map<String, dynamic> report) {
    Color statusColor = report['status'] == 'Under Review'
        ? AppTheme.warningColor
        : AppTheme.infoColor;

    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.spacing16),
      decoration: AppTheme.cardDecoration(),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.all(AppTheme.spacing16),
        childrenPadding: const EdgeInsets.fromLTRB(
          AppTheme.spacing16,
          0,
          AppTheme.spacing16,
          AppTheme.spacing16,
        ),
        leading: Container(
          padding: const EdgeInsets.all(AppTheme.spacing12),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
          ),
          child: const Icon(
            Icons.description_outlined,
            color: AppTheme.primaryColor,
          ),
        ),
        title: Text(
          report['category'],
          style: AppTheme.subtitle1,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppTheme.spacing4),
            Text(
              report['id'],
              style: AppTheme.caption,
            ),
            const SizedBox(height: AppTheme.spacing4),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacing8,
                vertical: AppTheme.spacing4,
              ),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
              ),
              child: Text(
                report['status'],
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: statusColor,
                ),
              ),
            ),
          ],
        ),
        children: [
          _buildDetailRow('Description', report['description']),
          const Divider(),
          _buildDetailRow('Location', report['location']),
          const Divider(),
          _buildDetailRow('Date', report['date']),
          const SizedBox(height: AppTheme.spacing16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit_outlined, size: 18),
                  label: const Text('Edit'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppTheme.primaryColor,
                    side: const BorderSide(color: AppTheme.primaryColor),
                  ),
                ),
              ),
              const SizedBox(width: AppTheme.spacing12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.delete_outline, size: 18),
                  label: const Text('Delete'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppTheme.errorColor,
                    side: const BorderSide(color: AppTheme.errorColor),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppTheme.spacing8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: AppTheme.subtitle2,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTheme.body2,
            ),
          ),
        ],
      ),
    );
  }
}
