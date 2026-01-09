import 'package:expose_corruption_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  DateTime? incidentDate;
  File? _image;
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _partiesController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  String _selectedCategory = 'Bribery';

  final List<String> _categories = [
    'Bribery',
    'Embezzlement',
    'Fraud',
    'Nepotism',
    'Abuse of Power',
    'Other',
  ];

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppTheme.primaryColor,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: AppTheme.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != incidentDate) {
      setState(() {
        incidentDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.primaryColor,
        title: const Text(
          'Submit Report',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacing16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Info Card
                Container(
                  padding: const EdgeInsets.all(AppTheme.spacing16),
                  decoration: BoxDecoration(
                    color: AppTheme.infoColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                    border: Border.all(
                      color: AppTheme.infoColor.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: AppTheme.infoColor,
                        size: 24,
                      ),
                      const SizedBox(width: AppTheme.spacing12),
                      Expanded(
                        child: Text(
                          'Your submission will remain confidential and your identity will be protected.',
                          style: AppTheme.body2.copyWith(
                            color: AppTheme.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppTheme.spacing24),

                // Category Selection
                const Text('Report Category', style: AppTheme.subtitle1),
                const SizedBox(height: AppTheme.spacing8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing16),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceColor,
                    borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                    border: Border.all(color: AppTheme.dividerColor),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedCategory,
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down),
                      items: _categories.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCategory = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: AppTheme.spacing20),

                // Description
                const Text('Description', style: AppTheme.subtitle1),
                const SizedBox(height: AppTheme.spacing8),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: 'Provide a detailed description of the corruption incident...',
                    alignLabelWithHint: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please provide a description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppTheme.spacing20),

                // Involved Parties
                const Text('Involved Parties', style: AppTheme.subtitle1),
                const SizedBox(height: AppTheme.spacing8),
                TextFormField(
                  controller: _partiesController,
                  decoration: const InputDecoration(
                    hintText: 'Names, titles, or organizations involved',
                    prefixIcon: Icon(Icons.people_outline),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please specify the involved parties';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppTheme.spacing20),

                // Location
                const Text('Location', style: AppTheme.subtitle1),
                const SizedBox(height: AppTheme.spacing8),
                TextFormField(
                  controller: _locationController,
                  decoration: const InputDecoration(
                    hintText: 'City, county, or specific address',
                    prefixIcon: Icon(Icons.location_on_outlined),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please specify the location';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppTheme.spacing20),

                // Date Picker
                const Text('Incident Date', style: AppTheme.subtitle1),
                const SizedBox(height: AppTheme.spacing8),
                InkWell(
                  onTap: () => _selectDate(context),
                  child: Container(
                    padding: const EdgeInsets.all(AppTheme.spacing16),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceColor,
                      borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                      border: Border.all(color: AppTheme.dividerColor),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today_outlined, color: AppTheme.textSecondary),
                        const SizedBox(width: AppTheme.spacing12),
                        Text(
                          incidentDate == null
                              ? 'Select incident date'
                              : '${incidentDate!.day}/${incidentDate!.month}/${incidentDate!.year}',
                          style: AppTheme.body1.copyWith(
                            color: incidentDate == null ? AppTheme.textLight : AppTheme.textPrimary,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios, size: 16, color: AppTheme.textLight),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppTheme.spacing24),

                // Evidence Upload
                const Text('Evidence (Optional)', style: AppTheme.subtitle1),
                const SizedBox(height: AppTheme.spacing8),
                InkWell(
                  onTap: _pickImage,
                  child: Container(
                    padding: const EdgeInsets.all(AppTheme.spacing20),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceColor,
                      borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                      border: Border.all(
                        color: AppTheme.dividerColor,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.cloud_upload_outlined,
                          size: 48,
                          color: AppTheme.primaryColor.withOpacity(0.7),
                        ),
                        const SizedBox(height: AppTheme.spacing12),
                        const Text(
                          'Upload Photo or Document',
                          style: AppTheme.subtitle1,
                        ),
                        const SizedBox(height: AppTheme.spacing4),
                        Text(
                          'Tap to select files',
                          style: AppTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ),
                if (_image != null) ...[
                  const SizedBox(height: AppTheme.spacing16),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                      image: DecorationImage(
                        image: FileImage(_image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: AppTheme.spacing32),

                // Submit Button
                Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: AppTheme.primaryGradient,
                    borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                    boxShadow: AppTheme.buttonShadow,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (incidentDate == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please select an incident date'),
                              backgroundColor: AppTheme.errorColor,
                            ),
                          );
                          return;
                        }
                        // Process submission
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Report submitted successfully!'),
                            backgroundColor: AppTheme.successColor,
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                      ),
                    ),
                    child: const Text(
                      'Submit Report',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppTheme.spacing24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _partiesController.dispose();
    _locationController.dispose();
    super.dispose();
  }
}