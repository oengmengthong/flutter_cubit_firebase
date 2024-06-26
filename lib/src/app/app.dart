import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:flutter_cubit_firebase/src/feature/auth/cubit/auth_cubit.dart';
import 'package:flutter_cubit_firebase/src/l10n/l10n.dart';
import 'package:flutter_cubit_firebase/src/l10n/l10n_cubit.dart';
import 'package:flutter_cubit_firebase/src/routers/app_router.dart';
import 'package:flutter_cubit_firebase/src/shared/extensions/context_exts.dart';
import 'package:flutter_cubit_firebase/src/shared/theme/app_theme.dart';
import 'package:flutter_cubit_firebase/src/shared/theme/app_theme_data.dart';
import 'package:flutter_cubit_firebase/src/shared/utils/clear_focus_navigator_observer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => GetIt.I<AuthCubit>(),
        ),
        BlocProvider<L10nCubit>(
          create: (_) => GetIt.I<L10nCubit>(),
        ),
      ],
      child: AppTheme(
        themeData: AppThemeData.system(context),
        child: BlocBuilder<L10nCubit, L10nState>(
          builder: (context, l10n) {
            return MaterialApp.router(
              title: 'Flutter Cubit Firebase',
              theme: context.appTheme.build(context),
              locale: l10n.locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: GetIt.I<AppRouter>().config(
                navigatorObservers: () => [
                  ClearFocusNavigatorObserver(),
                ],
              ),
              builder: (context, child) {
                return KeyboardDismisser(
                  child: BotToastInit()(context, child),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
