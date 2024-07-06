import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:pappa_connect/core/constants/constants.dart';
import 'package:pappa_connect/features/data_entry/presentation/bloc/data_entry_bloc.dart';
import 'package:pappa_connect/features/data_entry/presentation/widgets/custom_add_new_voter_widget.dart';
import 'package:pappa_connect/features/data_entry/presentation/widgets/custom_address_entry_widget.dart';
import 'package:pappa_connect/features/data_entry/presentation/widgets/custom_voter_entry_widget.dart';
import 'package:pappa_connect/injection_container.dart';

class DataEntryView extends StatelessWidget {
  DataEntryView({super.key});

  final DataEntryBloc _dataEntryBloc = sl.get<DataEntryBloc>();

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return BlocConsumer<DataEntryBloc, DataEntryState>(
          bloc: _dataEntryBloc,
          listenWhen: (prev, next) => next is DataEntryActionState,
          buildWhen: (prev, next) => next is! DataEntryActionState,
          listener: (BuildContext context, DataEntryState state) {
            _blocListener(context, state, constraints);
          },
          builder: (BuildContext context, DataEntryState state) {
            return _blocBuilder(context, state, constraints);
          },
        );
      },
    );
  }

  void _blocListener(
      BuildContext context, DataEntryState state, BoxConstraints constraints) {
    switch (state.runtimeType) {
      case const (DataEntryActionState):
        break;

      default:
        break;
    }
  }

  Widget _blocBuilder(
      BuildContext context, DataEntryState state, BoxConstraints constraints) {
    switch (state.runtimeType) {
      case const (LoadingState):
        _dataEntryBloc.add(const LoadedEvent());

        return _buildLoadingStateWidget();

      case const (ErrorState):
        return _buildErrorStateWidget();

      case const (LoadedState):
        Map<String, dynamic> dataEntryData = state.dataEntryData!;

        return _buildLoadedStateWidget(dataEntryData, constraints);

      default:
        return Container();
    }
  }

  Widget _buildLoadingStateWidget() {
    return const Center(
      child: ProgressCircle(),
    );
  }

  Widget _buildErrorStateWidget() {
    return const Center(
      child: Text('Error'),
    );
  }

  Widget _buildLoadedStateWidget(
      Map<String, dynamic> dataEntryData, BoxConstraints constraints) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          child: Text(
            "Cancel",
            style: TextStyle(
              color: kCancelTextColor,
            ),
          ),
        ),
        trailing: CupertinoButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          child: Text(
            "Save",
            style: TextStyle(
              color: kSaveTextColor,
            ),
          ),
        ),
      ),
      child: ListView.builder(
        itemCount: dataEntryData['voters'].length + 2,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return CustomAddressEntryWidget(
              onFieldChanged: (field, value) {
                _dataEntryBloc.add(AddressFieldTypedEvent(
                  field: field,
                  value: value,
                  dataEntryData: dataEntryData,
                ));
              },
              addressData: dataEntryData['address'],
            );
          } else if (index == dataEntryData['voters'].length + 2 - 1) {
            return const CustomAddNewVoterWidget();
          }

          return const CustomVoterEntryWidget();
        },
      ),
    );
  }
}
