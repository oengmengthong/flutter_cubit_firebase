// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i12;

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:cloud_firestore/cloud_firestore.dart' as _i11;
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:firebase_storage/firebase_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i14;

import '../data/datasources/local/auth_data_local.dart' as _i15;
import '../data/datasources/remote/auth_data_remote.dart' as _i10;
import '../data/datasources/remote/file_data_remote.dart' as _i8;
import '../data/datasources/remote/room_data_remote.dart' as _i17;
import '../data/datasources/remote/user_data_remote.dart' as _i9;
import '../l10n/l10n_cubit.dart' as _i13;
import '../routers/app_router.dart' as _i16;
import '../routers/guards.dart' as _i4;
import '../shared/storage/storage.dart' as _i6;
import 'module/app_module.dart' as _i20;
import 'module/routes_module.dart' as _i19;
import 'module/storage_module.dart' as _i18;

const String _staging = 'staging';
const String _production = 'production';
const String _development = 'development';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final storageModule = _$StorageModule();
    final routesModule = _$RoutesModule();
    final appModule = _$AppModule();
    gh.factory<String>(() => storageModule.storagePrefixKey);
    gh.factory<List<_i3.AutoRoute>>(() => routesModule.routes);
    gh.singleton<_i4.RoleGuard>(() => routesModule.roleGuard);
    gh.factory<_i5.FirebaseStorage>(
      () => appModule.firebaseStorage,
      instanceName: 'firebaseStorage',
    );
    gh.singleton<_i6.Storage>(
      () => storageModule.allPurposedStorage,
      instanceName: 'storage',
    );
    gh.factory<_i7.FirebaseAuth>(
      () => appModule.firebaseAuth,
      instanceName: 'firebaseAuth',
    );
    gh.factory<_i8.FileDataRemote>(() => _i8.FileDataRemote(
        storage: gh<_i5.FirebaseStorage>(instanceName: 'firebaseStorage')));
    gh.factory<_i9.UserDataRemote>(() => _i9.UserDataRemote(
        auth: gh<_i7.FirebaseAuth>(instanceName: 'firebaseAuth')));
    gh.factory<_i10.AuthDataRemote>(() => _i10.AuthDataRemote(
        auth: gh<_i7.FirebaseAuth>(instanceName: 'firebaseAuth')));
    gh.factory<_i11.FirebaseFirestore>(
      () => appModule.firestore,
      instanceName: 'firebaseFirestore',
    );
    await gh.factoryAsync<String>(
      () => appModule.stagingAppVersion,
      instanceName: 'appVersion',
      registerFor: {_staging},
      preResolve: true,
    );
    gh.singleton<_i6.Storage>(
      () => storageModule.authzStorage,
      instanceName: 'authStorage',
    );
    gh.factory<_i12.Locale>(
      () => appModule.defaultLocale,
      instanceName: 'defaultLocale',
    );
    gh.factory<_i13.L10nCubit>(() => _i13.L10nCubit(
          defaultLocale: gh<_i12.Locale>(instanceName: 'defaultLocale'),
          storage: gh<_i6.Storage>(instanceName: 'storage'),
        ));
    gh.factory<_i14.LogPrinter>(
      () => appModule.prodLogPrinter,
      registerFor: {_production},
    );
    gh.factory<_i14.LogPrinter>(
      () => appModule.devLogPrinter,
      registerFor: {
        _development,
        _staging,
      },
    );
    await gh.factoryAsync<String>(
      () => appModule.developmentAppVersion,
      instanceName: 'appVersion',
      registerFor: {_development},
      preResolve: true,
    );
    gh.factory<_i15.AuthDataLocal>(() => _i15.AuthDataLocal(
        storage: gh<_i6.Storage>(instanceName: 'authStorage')));
    await gh.factoryAsync<String>(
      () => appModule.prodAppVersion,
      instanceName: 'appVersion',
      registerFor: {_production},
      preResolve: true,
    );
    gh.singleton<_i16.AppRouter>(() => routesModule.appRouter(
          gh<_i4.RoleGuard>(),
          gh<List<_i3.AutoRoute>>(),
        ));
    gh.factory<_i17.RoomDataRemote>(() => _i17.RoomDataRemote(
        firestore:
            gh<_i11.FirebaseFirestore>(instanceName: 'firebaseFirestore')));
    return this;
  }
}

class _$StorageModule extends _i18.StorageModule {}

class _$RoutesModule extends _i19.RoutesModule {}

class _$AppModule extends _i20.AppModule {}
