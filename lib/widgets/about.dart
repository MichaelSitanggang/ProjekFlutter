import 'package:flutter/material.dart';

class MyAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('KOPI',style: TextStyle(fontFamily: "Lobster",fontWeight: FontWeight.bold),),
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildSection(
                  title: 'Apa Itu Kopi?',
                  description:
                      'Kopi adalah minuman yang diseduh dari biji kopi yang telah digiling. Biji kopi berasal dari tanaman kopi yang tumbuh di berbagai belahan dunia, terutama di daerah tropis dan subtropis.',
                  image: 'assets/about1.jpeg',
                  reverse: false,
                ),
                SizedBox(height: 32),
                _buildSection(
                  title: 'Manfaat Kopi',
                  description:
                      'Kopi tidak hanya menjadi minuman yang populer di seluruh dunia, tetapi juga memiliki sejumlah manfaat bagi kesehatan, antara lain meningkatkan kewaspadaan dan fokus, meningkatkan energi, mengandung antioksidan, dan dikaitkan dengan pengurangan risiko beberapa penyakit kronis.',
                  image: 'assets/about2.jpeg',
                  reverse: true,
                ),
                SizedBox(height: 32),
                _buildSection(
                  title: 'Sejarah Kopi',
                  description:
                      'Kopi telah dikenal sejak berabad-abad yang lalu, bermula dari penemuan di Ethiopia dan tersebar ke seluruh dunia melalui perdagangan dan eksplorasi. Kopi telah menjadi bagian penting dari budaya dan kebiasaan di berbagai masyarakat.',
                  reverse: false,
                ),
                SizedBox(height: 32),
                _buildSection(
                  title: 'Proses Pembuatan',
                  description:
                      'Proses pembuatan kopi meliputi berbagai langkah, mulai dari pemilihan biji, pengolahan (seperti basah atau kering), penggilingan, dan penyeduhan. Setiap tahapan mempengaruhi cita rasa dan karakteristik akhir dari secangkir kopi.',
                  image: 'assets/about3.jpeg',
                  reverse: true,
                ),
                SizedBox(height: 32),
                _buildSection(
                  title: 'Jenis - Jenis Kopi',
                  description:
                      'Ada berbagai jenis kopi yang berasal dari berbagai varietas tanaman kopi dan metode pengolahan. Beberapa jenis kopi terkenal termasuk Arabika, Robusta, dan berbagai kopi spesial dari daerah-daerah tertentu.',
                  image: 'assets/about4.jpeg',
                  reverse: false,
                ),
                SizedBox(height: 32),
                _buildSection(
                  title: 'Daerah Asal dan Dampak',
                  description:
                      'Kopi berasal dari berbagai daerah di seluruh dunia yang memiliki iklim dan tanah yang cocok untuk pertumbuhan tanaman kopi. Industri kopi memiliki dampak ekologis dan sosial yang signifikan di negara-negara produsen kopi. Kehidupan berkelanjutan dan kondisi sosial masyarakat lokal menjadi perhatian utama dalam produksi dan perdagangan kopi global.',
                  reverse: false,
                ),
                SizedBox(height: 32),
                _buildSection(
                  title: 'Filosofi Kopi',
                  description:
                      'Kopi tidak hanya sekadar minuman, tetapi juga mewakili nilai-nilai seperti kebersamaan, kecerdasan, dan kehangatan dalam interaksi sosial. Kopi menjadi simbol dari ritus sosial dan ritual pribadi di berbagai budaya.',
                  reverse: false,
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    String? title,
    required String description,
    String? image,
    required bool reverse,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          if (!reverse) _buildTextColumn(title, description),
          if (image != null)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                ),
              ),
            ),
          if (reverse) _buildTextColumn(title, description),
        ],
      ),
    );
  }

  Widget _buildTextColumn(String? title, String description) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (title != null)
            Text(
              title,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 73, 54, 47),
              ),
            ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
