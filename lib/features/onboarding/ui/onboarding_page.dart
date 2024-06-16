import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:green_app/features/feedback/ui/feedback_modal.dart';

import '../../../common/ui/navigation_screen.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: List.generate(
          6,
          (index) => OnboardingBodyWidget(
            pageController: _pageController,
            currentIdx: index,
            totalNumber: 6,
          ),
        ),
      ),
    );
  }

  String getOnboardingPath(int i) {
    return 'assets/images/onboarding/Onboarding_${i + 1}.png';
  }
}

class OnboardingBodyWidget extends StatelessWidget {
  const OnboardingBodyWidget({
    super.key,
    required PageController pageController,
    required this.currentIdx,
    required this.totalNumber,
  }) : _pageController = pageController;

  final PageController _pageController;

  final int currentIdx;
  final int totalNumber;

  String getOnboardingPath(int i) {
    return 'assets/images/onboarding/Onboarding_${i + 1}.png';
  }

  static const onboardingText = [
    'Добро пожаловать в приложение, где каждый может стать защитником природы Камчатки!',
    'Оценивайте маршруты, делитесь впечатлениями о чистоте и удобстве маршрутов, чтобы сделать Камчатку лучше!',
    '''Сообщайте о лесных пожарах, незаконных вырубках, браконьерстве и свалочных очагах. Станьте героем природы!''',
    '''Зарабатывайте крутые ачивки и становитесь лидером среди защитников природы, выполняя различные задания и получая награды.''',
    '''Готовы к приключениям? Начните свое путешествие по Камчатке, оцените маршруты, сообщите о нарушениях и помогите сохранить природу для будущих поколений!''',
    '''Камчатка ждет вас! Станьте частью нашего природного патруля и помогите сделать мир лучше.''',
  ];

  @override
  Widget build(BuildContext context) {

    if (kDebugMode) {
      print(getOnboardingPath(currentIdx));
    }
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        Image.asset(
          getOnboardingPath(currentIdx),
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  onboardingText[currentIdx],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 29,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
              child: currentIdx == totalNumber - 1
                  ? Align(
                      alignment: Alignment.bottomLeft,
                      child: AppElevatedButton(
                        onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NavigationScreen())),
                        buttonText: 'Начать',
                        backgroundColor: Colors.yellow,
                        textColor: Theme.of(context).colorScheme.primary,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          child: Text(
                            'Пропустить',
                            style:
                                TextStyle(color: Colors.white.withOpacity(0.8)),
                          ),
                          onPressed: () {
                            if (_pageController.hasClients) {
                              _pageController.animateToPage(
                                totalNumber - 1,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                        ),
                        if (currentIdx != totalNumber - 1)
                          Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor:
                                  Colors.yellow,
                              child: IconButton(
                                icon: Icon(
                                  size: 35,
                                  Icons.keyboard_arrow_right,
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                                onPressed: () {
                                  if (_pageController.hasClients) {
                                    _pageController.animateToPage(
                                      currentIdx + 1,
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                      ],
                    ),
            )
          ],
        ),
      ],
    );
  }
}
