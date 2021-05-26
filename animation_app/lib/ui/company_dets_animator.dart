import 'package:animation_app/repo/repo.dart';
import 'package:flutter/material.dart';

import 'company_dets_page.dart';

class CompanyDetsAnimator extends StatefulWidget {
  @override
  _CompanyDetsAnimatorState createState() => new _CompanyDetsAnimatorState();
}

class _CompanyDetsAnimatorState extends State<CompanyDetsAnimator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        duration: const Duration(milliseconds: 1800),
        vsync: this);

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new CompanyDetailsPage(
       company: RepoData.bawp,
       controller: _controller
    );
  }
}
