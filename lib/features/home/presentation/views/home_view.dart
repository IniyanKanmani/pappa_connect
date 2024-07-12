import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:pappa_connect/features/data_entry/presentation/views/data_entry_view.dart';
import 'package:pappa_connect/features/home/presentation/bloc/home_bloc.dart';
import 'package:pappa_connect/injection_container.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeBloc _homeBloc = sl.get<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return BlocConsumer<HomeBloc, HomeState>(
          bloc: _homeBloc,
          listenWhen: (prev, next) => next is HomeActionState,
          buildWhen: (prev, next) => next is! HomeActionState,
          listener: (BuildContext context, HomeState state) {
            _blocListener(context, state, constraints);
          },
          builder: (BuildContext context, HomeState state) {
            return _blocBuilder(context, state, constraints);
          },
        );
      },
    );
  }

  void _blocListener(
      BuildContext context, HomeState state, BoxConstraints constraints) {
    switch (state.runtimeType) {
      case const (HomeActionState):
        break;

      default:
        break;
    }
  }

  Widget _blocBuilder(
      BuildContext context, HomeState state, BoxConstraints constraints) {
    switch (state.runtimeType) {
      case const (LoadingState):
        _homeBloc.add(const LoadedEvent());

        return _buildLoadingStateWidget();

      case const (ErrorState):
        return _buildErrorStateWidget();

      case const (LoadedState):
        Map<String, dynamic> homeData = state.homeData!;

        return _buildLoadedStateWidget(homeData, constraints);

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
      Map<String, dynamic> homeData, BoxConstraints constraints) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'New Voter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: homeData['index'],
        onTap: (index) {
          _homeBloc.add(ViewChangeEvent(index: index, homeData: homeData));
        },
      ),
      tabBuilder: (BuildContext context, int index) {
        return [
          const DataEntryView(),
          Container(),
          Container(),
        ].elementAt(index);
      },
    );
  }
}
