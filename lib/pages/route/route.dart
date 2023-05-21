import 'package:amin_app/pages/auth/login_screen.dart';
import 'package:amin_app/pages/auth/register_screen.dart';
import 'package:amin_app/pages/auth/reset_pass_screen.dart';
import 'package:amin_app/pages/home_screen.dart';
import 'package:amin_app/pages/news_pages/all_news.dart';
import 'package:amin_app/pages/news_pages/all_news_details.dart';
import 'package:amin_app/pages/news_pages/recent_news.dart';
import 'package:amin_app/pages/news_pages/recent_news_details.dart';
import 'package:amin_app/pages/news_pages/slider_image.dart';
import 'package:amin_app/pages/news_pages/slider_image_details.dart';
import 'package:get/get.dart';

const String register = '/register';
const String login = '/login';
const String home = '/home';
const String reset = '/reset';
const String recentNews = '/recentNews';
const String allNews = '/allNews';
const String slider = '/slider';
const String sliderDetails = '/sliderDetails';
const String recentDetails = '/recentDetails';
const String allNewsDetails = '/allNewsDetails';








List<GetPage> getPages = [
  GetPage(name: register, page: () => Register()),
  GetPage(name: login, page: () => Login()),
  GetPage(name: home, page: () => HomePage()),
  GetPage(name: reset, page: () => ResetScreen()),
  GetPage(name: recentNews, page: () => RecentNews()),
  GetPage(name: allNews, page: () => AllNews()),
  GetPage(name: slider, page: () => SliderImage()),
  GetPage(name: sliderDetails, page: () => SliderDetails()),
  GetPage(name: recentDetails, page: () => RecentDetails()),
  GetPage(name: allNewsDetails, page: () => AllNewsDetails()),


  

];
