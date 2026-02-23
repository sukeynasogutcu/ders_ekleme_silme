# Derslerim - Flutter Ders Ekleme-Silme Uygulama Örneği
Derslerim, kullanıcıların takip ettikleri dersleri kolayca ekleyebileceği, listeleyebileceği ve yönetebileceği modern tasarımlı bir mobil uygulamanın örnek bir parçasıdır. Flutter ile geliştirilmiş olup, dinamik liste yapısı ve şık "Dark Mode" arayüzüne sahiptir.
# Özellikler
Uygulama, temel CRUD (Oluşturma, Okuma, Silme) işlemlerini destekler ve şu özellikleri barındırır:
Dinamik Ders Ekleme: "Yeni Ders Ekle" bölümünden ders ismini yazarak listeye anında ekleme yapabilirsiniz.
Detaylı Görünüm: ExpansionTile sayesinde her dersin üzerine tıklandığında dersle ilgili alt menü ve detaylar açılır.
Kaydırarak Silme (Swipe to Delete): Dismissible widget'ı ile dersleri sola kaydırarak hızlıca silebilirsiniz.
Modern Arayüz: Koyu tema (Dark Mode) desteği ve Card yapısı ile temiz bir kullanıcı deneyimi sunar.
Boş Durum Kontrolü: Listede hiç ders kalmadığında kullanıcıyı yönlendiren bir "Boş Durum" ekranı görünür.
# Kullanılan Teknolojiler ve Widget'lar
Uygulama geliştirilirken Flutter'ın sunduğu güçlü araçlar kullanılmıştır:
State Management: Uygulama içi durum yönetimi StatefulWidget ve setState ile sağlanmıştır.
Tasarım: Material Design, Custom Theme ve Google Fonts (Roboto).
Widget Mimarisi:
ListView.builder: Performanslı liste yönetimi için.
ExpansionTile: İçerik gizleme/gösterme işlemleri için.
Dismissible: Kaydırma hareketleri için.
TextEditingController: Kullanıcı girdilerini yönetmek için.
