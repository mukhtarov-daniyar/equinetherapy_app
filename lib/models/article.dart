class Article {
  final String title;
  final String imageUrl;
  final String url;

  Article({required this.title, required this.imageUrl, required this.url});
}

List<Article> articles = [
  Article(
    title: 'Иппотерапия',
    imageUrl: 'https://sedla.ru/images/image1.jpg',
    url:
        'https://rrcdi.ru/departments/medical-and-social-rehabilitation/kinesiotherapy/ippotherapy/',
  ),
  Article(
    title: 'что это и как работает',
    imageUrl:
        'https://i.siteapi.org/sd-bJrkND4MqeDZOzixoyPDvuUk=/fit-in/1400x1000/center/top/13c848dc0ab103b.ru.s.siteapi.org/img/k3gkcxon4z4s400w4ckswcs0osw4c8',
    url:
        'https://rrcdi.ru/departments/medical-and-social-rehabilitation/kinesiotherapy/ippotherapy/',
  ),
  // Add more articles as needed
];
