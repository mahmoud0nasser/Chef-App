import 'package:bloc/bloc.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/services/services_locator.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());
  // bool isArabic = false;
  String langCode = 'ar';

  void changeLang(String codeLang) async {
    emit(ChangeLangLoading());
    // isArabic = !isArabic;
    // langCode = isArabic ? 'en' : 'ar';
    langCode = codeLang;
    await sl<CacheHelper>().cachedLanguage(codeLang);
    emit(ChangeLangSuccess());
  }

  void getCachedLang() {
    emit(ChangeLangLoading());
    final cachedLang = sl<CacheHelper>().getCachedLanguage();
    langCode = cachedLang;
    emit(ChangeLangSuccess());
  }
}
