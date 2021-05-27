import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/modules/device/device_profiles_grid.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class DevicesMainPage extends TbContextWidget<DevicesMainPage, _DevicesMainPageState> {

  DevicesMainPage(TbContext tbContext) : super(tbContext);

  @override
  _DevicesMainPageState createState() => _DevicesMainPageState();

}

class _DevicesMainPageState extends TbContextState<DevicesMainPage, _DevicesMainPageState> {

  final PageLinkController _pageLinkController = PageLinkController();

  @override
  Widget build(BuildContext context) {
    var deviceProfilesList = DeviceProfilesGrid(tbContext, _pageLinkController);
    return Scaffold(
        appBar: TbAppBar(
            tbContext,
            title: Text(deviceProfilesList.title)
        ),
        body: deviceProfilesList
    );
  }

  @override
  void dispose() {
    _pageLinkController.dispose();
    super.dispose();
  }

}