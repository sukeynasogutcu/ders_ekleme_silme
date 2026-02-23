// lib/main.dart
import 'package:flutter/material.dart';

void main() => runApp(DerslerApp());

class Ders {
  final String isim;
  final IconData icon;
  Ders({required this.isim, required this.icon});
}

class DerslerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Derslerim',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A84FF),
        scaffoldBackgroundColor: Color(0xFF0B1620),
        cardColor: Color(0xFF111824),
        textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Roboto',
        ),
      ),
      home: DersSayfasi(),
    );
  }
}

class DersSayfasi extends StatefulWidget {
  @override
  _DersSayfasiState createState() => _DersSayfasiState();
}

class _DersSayfasiState extends State<DersSayfasi> {
  final TextEditingController _controller = TextEditingController();
  final List<Ders> _dersler = [
    Ders(isim: 'Matematik 101', icon: Icons.bookmark),
    Ders(isim: 'Flutter ile Mobil Geliştirme', icon: Icons.code),
    Ders(isim: 'Türkiye Cumhuriyeti Tarihi', icon: Icons.menu_book),
  ];

  void _ekleDers(String isim) {
    if (isim.trim().isEmpty) return;
    setState(() {
      _dersler.insert(
        0,
        Ders(isim: isim.trim(), icon: Icons.school),
      );
    });
    _controller.clear();
  }

  void _silDers(int index) {
    setState(() {
      _dersler.removeAt(index);
    });
  }

  Widget _buildBosDurum() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Container(
          height: 220,
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.wb_sunny_outlined, size: 48, color: Colors.blueGrey),
              SizedBox(height: 16),
              Text('Henüz ders eklenmedi',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('Başlamak için ilk dersinizi ekleyin.',
                  style: TextStyle(fontSize: 14, color: Colors.blueGrey)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDersItem(BuildContext context, int index) {
    final ders = _dersler[index];
    return Dismissible(
      key: ValueKey(ders.isim + index.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(Icons.delete_forever, color: Colors.white),
      ),
      onDismissed: (_) => _silDers(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Card(
          color: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ExpansionTile(
            leading: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Color(0xFF0C2A3A),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(ders.icon, color: Colors.lightBlueAccent),
            ),
            title: Text(ders.isim,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ders detayları burada olacak. Örnek: konu başlıkları, notlar.'),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            // örnek aksiyon: ders sayfasına git
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('${ders.isim} açılıyor...')));
                          },
                          icon: Icon(Icons.open_in_new),
                          label: Text('Aç'),
                        ),
                        SizedBox(width: 8),
                        OutlinedButton.icon(
                          onPressed: () {
                            // örnek aksiyon: düzenle (ileride implement edilecek)
                          },
                          icon: Icon(Icons.edit),
                          label: Text('Düzenle'),
                        ),
                        SizedBox(width: 8),
                        OutlinedButton.icon(
                          onPressed: () => _silDers(index), // butona basınca sil
                          icon: Icon(Icons.delete),
                          label: Text('Sil'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // header kısmını Stack ile tasarlayabiliriz
      body: SafeArea(
        child: Column(
          children: [
            // Başlık + icon bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Color(0xFF0C2A3A),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.school, size: 28, color: Colors.white),
                  ),
                  SizedBox(width: 12),
                  Text('Derslerim', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            // Yeni ders ekle alanı
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Yeni Ders Ekle', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  SizedBox(height: 12),
                  Text('Ders Adı', style: TextStyle(fontSize: 14, color: Colors.blueGrey)),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: 'Yeni ders adını girin...',
                            filled: true,
                            fillColor: Color(0xFF0D1620),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      ElevatedButton.icon(
                        onPressed: () => _ekleDers(_controller.text),
                        icon: Icon(Icons.add),
                        label: Text('Ekle'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),

            // Liste / boş durum
            Expanded(
              child: _dersler.isEmpty
                  ? _buildBosDurum()
                  : ListView.builder(
                padding: EdgeInsets.only(bottom: 24, top: 8),
                itemCount: _dersler.length,
                itemBuilder: _buildDersItem,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
