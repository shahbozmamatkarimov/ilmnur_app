import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilmnur_app/core/resources/app_colors.dart';
import 'package:ilmnur_app/core/util/responsive.dart';
import 'package:path/path.dart';

class WNews extends StatelessWidget {
  const WNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.c_ed, // Border color
            width: 1, // Border width
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Bizda yangilik! «Yoshlar 2024» turniriga start beramiz.",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/svg/news/time.svg"),
              const SizedBox(width: 8),
              const Text("9 min"),
              const SizedBox(width: 20),
              SvgPicture.asset("assets/svg/news/views.svg"),
              const SizedBox(width: 8),
              const Text("26"),
              const SizedBox(width: 20),
              SvgPicture.asset("assets/svg/news/date.svg"),
              const SizedBox(width: 8),
              const Text("22.02.2024"),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.c_f2,
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.network(
              'https://picsum.photos/250?image=2',
              height: Responsive.isTablet(context) ? 210 : 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Hammaga salom! Bu Friflex kompaniyasining Flutter dasturchisi Murat Nasirov. Biz biznes uchun yuqori yuklangan mobil ilovalarni ishlab chiqamiz va Flutterga ixtisoslashganmiz. Bugun men sizga ESP32 mikrokontrollerini Flutter ilovasi bilan birgalikda qanday ishlatishni aytib beraman. Misol sifatida, men sizga DHT11 sensori yordamida harorat va namlik ko'rsatkichlarini qanday olishni va bu ma'lumotlarni Firebase Realtime Database orqali ilovaga o'tkazishni ko'rsataman.",
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
