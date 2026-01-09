import 'package:expose_corruption_app/components/bottom_navbar.dart';
import 'package:expose_corruption_app/utils/app_theme.dart';
import 'package:flutter/material.dart';

class ReportStatus extends StatelessWidget {
  const ReportStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.primaryColor,
        title: const Text(
          'Report Status',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(currentIndex: 3),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacing16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Report Summary Card
              Container(
                padding: const EdgeInsets.all(AppTheme.spacing20),
                decoration: AppTheme.cardDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Report ID', style: AppTheme.h3),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppTheme.spacing12,
                            vertical: AppTheme.spacing8,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.warningColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
                          ),
                          child: const Text(
                            'Under Review',
                            style: TextStyle(
                              color: AppTheme.warningColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTheme.spacing8),
                    const Text('RPT-001', style: AppTheme.body2),
                    const Divider(height: AppTheme.spacing24),
                    _buildInfoRow('Category', 'Bribery'),
                    const SizedBox(height: AppTheme.spacing12),
                    _buildInfoRow('Location', 'Nairobi, Kenya'),
                    const SizedBox(height: AppTheme.spacing12),
                    _buildInfoRow('Date Submitted', 'Jan 5, 2026'),
                  ],
                ),
              ),
              const SizedBox(height: AppTheme.spacing24),

              // Progress Timeline
              const Text('Progress Timeline', style: AppTheme.h3),
              const SizedBox(height: AppTheme.spacing16),
              _buildTimelineItem(
                icon: Icons.check_circle,
                title: 'Report Submitted',
                date: 'Jan 5, 2026 - 10:30 AM',
                isCompleted: true,
              ),
              _buildTimelineItem(
                icon: Icons.visibility,
                title: 'Under Review',
                date: 'Jan 6, 2026 - 2:15 PM',
                isCompleted: true,
                isLast: false,
              ),
              _buildTimelineItem(
                icon: Icons.search,
                title: 'Investigation Started',
                date: 'Pending',
                isCompleted: false,
                isLast: false,
              ),
              _buildTimelineItem(
                icon: Icons.gavel,
                title: 'Action Taken',
                date: 'Pending',
                isCompleted: false,
                isLast: true,
              ),
              const SizedBox(height: AppTheme.spacing24),

              // Estimated Time
              Container(
                padding: const EdgeInsets.all(AppTheme.spacing16),
                decoration: BoxDecoration(
                  color: AppTheme.infoColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                  border: Border.all(
                    color: AppTheme.infoColor.withOpacity(0.3),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      color: AppTheme.infoColor,
                    ),
                    const SizedBox(width: AppTheme.spacing12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Estimated Resolution Time',
                            style: AppTheme.subtitle2.copyWith(
                              color: AppTheme.infoColor,
                            ),
                          ),
                          const SizedBox(height: AppTheme.spacing4),
                          const Text(
                            '14-21 business days',
                            style: AppTheme.body2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTheme.body2),
        Text(
          value,
          style: AppTheme.subtitle2,
        ),
      ],
    );
  }

  Widget _buildTimelineItem({
    required IconData icon,
    required String title,
    required String date,
    required bool isCompleted,
    bool isLast = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(AppTheme.spacing8),
              decoration: BoxDecoration(
                color: isCompleted
                    ? AppTheme.successColor
                    : AppTheme.dividerColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 60,
                color: isCompleted
                    ? AppTheme.successColor
                    : AppTheme.dividerColor,
              ),
          ],
        ),
        const SizedBox(width: AppTheme.spacing16),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: AppTheme.spacing16),
            padding: const EdgeInsets.all(AppTheme.spacing16),
            decoration: AppTheme.cardDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTheme.subtitle1),
                const SizedBox(height: AppTheme.spacing4),
                Text(
                  date,
                  style: AppTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}