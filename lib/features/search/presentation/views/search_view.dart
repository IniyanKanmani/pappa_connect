import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pappa_connect/core/constants/constants.dart';
import 'package:pappa_connect/features/search/presentation/bloc/search_bloc.dart';
import 'package:pappa_connect/features/search/presentation/widgets/custom_search_widget.dart';
import 'package:pappa_connect/injection_container.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  final SearchBloc _searchBloc = sl.get<SearchBloc>();

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return BlocConsumer<SearchBloc, SearchState>(
          bloc: _searchBloc,
          listenWhen: (prev, next) => next is SearchActionState,
          buildWhen: (prev, next) => next is! SearchActionState,
          listener: (BuildContext context, SearchState state) {
            _blocListener(context, state, constraints);
          },
          builder: (BuildContext context, SearchState state) {
            return _blocBuilder(context, state, constraints);
          },
        );
      },
    );
  }

  void _blocListener(
      BuildContext context, SearchState state, BoxConstraints constraints) {
    switch (state.runtimeType) {
      case const (SearchActionState):
        break;

      default:
        break;
    }
  }

  Widget _blocBuilder(
      BuildContext context, SearchState state, BoxConstraints constraints) {
    switch (state.runtimeType) {
      case const (LoadingState):
        _searchBloc.add(const LoadedEvent());

        return _buildLoadingStateWidget();

      case const (ErrorState):
        return _buildErrorStateWidget();

      case const (LoadedState):
        Map<String, dynamic> searchData = state.searchData!;

        return _buildLoadedStateWidget(searchData, constraints);

      default:
        return Container();
    }
  }

  Widget _buildLoadingStateWidget() {
    return const Center(
      child: SizedBox(
        width: 100,
        child: LinearProgressIndicator(),
      ),
    );
  }

  Widget _buildErrorStateWidget() {
    return const Center(
      child: Text('Error'),
    );
  }

  Widget _buildLoadedStateWidget(
      Map<String, dynamic> searchData, BoxConstraints constraints) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          onPressed: () {
            _searchBloc.add(const ClearDataEvent());
          },
          padding: EdgeInsets.zero,
          child: Text(
            "Clear",
            style: TextStyle(
              color: kClearTextColor,
            ),
          ),
        ),
        trailing: CupertinoButton(
          onPressed: () {
            if (searchData["mode"] == "view") {
              _searchBloc.add(const ModifyDataEvent());
            } else {
              _searchBloc.add(const SaveDataEvent());
            }
          },
          padding: EdgeInsets.zero,
          child: Text(
            searchData["mode"] == "view" ? "Modify" : "Save",
            style: TextStyle(
              color: searchData["mode"] == "view"
                  ? kModifyTextColor
                  : kSaveTextColor,
            ),
          ),
        ),
      ),
      child: ListView.builder(
        itemCount: 1,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return CustomSearchWidget(
            searchData: searchData,
            onChanged: (value) {
              _searchBloc.add(AddressSearchEvent(
                value: value,
              ));
            },
            onAddressSelected: (address) {
              _searchBloc.add(AddressSelectedEvent(
                address: address,
              ));
            },
          );
        },
      ),
    );
  }
}
