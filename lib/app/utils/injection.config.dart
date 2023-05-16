// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:portfolio_project/app/app_index.dart' as _i4;
import 'package:portfolio_project/app/bloc/app_bloc.dart' as _i3;
import 'package:portfolio_project/app/projects/bloc/projects_bloc.dart' as _i6;
import 'package:portfolio_project/app/projects/data/repository/github_repository_impl.dart'
    as _i5;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AppBloc>(() => _i3.AppBloc());
    gh.singleton<_i4.GithubRepository>(_i5.GithubRepositoryImpl());
    gh.factory<_i6.ProjectsBloc>(
        () => _i6.ProjectsBloc(githubRepo: gh<_i4.GithubRepository>()));
    return this;
  }
}
