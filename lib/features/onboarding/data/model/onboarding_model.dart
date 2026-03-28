import 'package:marketi/core/const/images/marketi_images.dart';

class OnboardingModel {
  OnboardingModel({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
  final String title;
  final String description;
  final String imageUrl;
}

List<OnboardingModel> onboardingList = [
  OnboardingModel(
    imageUrl: MarketiImages.onboarding1,
    title: 'Welcome to Marketi',
    description:
        '''Discover a world of endless possibilities and shop from the comfort of your fingertips Browse through a wide range of products, from fashion and electronics to home.''' ,
  ),
  OnboardingModel(
    imageUrl: MarketiImages.onboarding2,
    title: 'Easy to Buy',
    description:
        '''Find the perfect item that suits your style and needs With secure payment options and fast delivery, shopping has never been easier.''' ,
  ),
  OnboardingModel(
    imageUrl: MarketiImages.onboarding3,
    title: 'Wonderful User Experience',
    description:
        '''Start exploring now and experience the convenience of online shopping at its best.''' ,
  ),
];
