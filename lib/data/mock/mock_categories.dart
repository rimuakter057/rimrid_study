import 'package:flutter/material.dart';
import '../models/category_model.dart';

class MockCategories {
  MockCategories._();

  static const List<CategoryModel> all = [
    CategoryModel(id: 'programming', name: 'Programming', icon: Icons.code_rounded),
    CategoryModel(id: 'web_dev', name: 'Web Development', icon: Icons.public_rounded),
    CategoryModel(id: 'mobile_dev', name: 'Mobile Development', icon: Icons.phone_iphone_rounded),
    CategoryModel(id: 'ui_ux', name: 'UI/UX Design', icon: Icons.brush_rounded),
    CategoryModel(id: 'data_science', name: 'Data Science', icon: Icons.bar_chart_rounded),
    CategoryModel(id: 'ai_ml', name: 'AI & Machine Learning', icon: Icons.psychology_alt_rounded),
    CategoryModel(id: 'business', name: 'Business', icon: Icons.work_outline_rounded),
    CategoryModel(id: 'marketing', name: 'Marketing', icon: Icons.campaign_rounded),
  ];

  static CategoryModel byId(String id) =>
      all.firstWhere((c) => c.id == id, orElse: () => all.first);
}
