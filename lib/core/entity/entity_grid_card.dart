
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import 'entities_base.dart';

class EntityGridCard<T> extends StatelessWidget {
  final T _entity;
  final EntityTapFunction<T>? _onEntityTap;
  final EntityCardWidgetBuilder<T> _entityCardWidgetBuilder;
  final EntityCardSettings _settings;

  EntityGridCard(T entity, {Key? key, EntityTapFunction<T>? onEntityTap,
    required EntityCardWidgetBuilder<T> entityCardWidgetBuilder,
    required EntityCardSettings settings}):
        this._entity = entity,
        this._onEntityTap = onEntityTap,
        this._entityCardWidgetBuilder = entityCardWidgetBuilder,
        this._settings = settings,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
          behavior: HitTestBehavior.opaque,
          child:
          Container(
            child: Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
                child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: _entityCardWidgetBuilder(context, _entity)
                )
            ),
            decoration: _settings.dropShadow ? BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withAlpha(25),
                    blurRadius: 10.0,
                    offset: Offset(0, 4)
                ),
                BoxShadow(
                    color: Colors.black.withAlpha(18),
                    blurRadius: 30.0,
                    offset: Offset(0, 10)
                ),
              ],
            ) : null,
          ),
          onTap: () {
            if (_onEntityTap != null) {
              _onEntityTap!(_entity);
            }
          }
      );
  }
}
