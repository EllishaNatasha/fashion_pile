# Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

* Stateless Widget adalah widget yang tidak dapat berubah dan dimuat secara statis. Konfigurasi pada widget ini telah diinisiasi. Stateless Widget cocok digunakan ketika kita hanya perlu menampilkan data yang sifatnya statis atau tidak perlu ada perubahan nilai
* Stateful Widget adalah widget yang dapat berubah-ubah. Widget ini dapat mengubah tampilan, mengubah nilai variabel, icon, warna, dan sebagainya. Stateful Widget dapat berubah berdasarkan aksi dari user atau ketika terjadi perubahan data dari sisi database.


---

# Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

* MaterialApp : mengatur struktur aplikasi Flutter
* Scaffold : mewakili struktur dasar sebuah layar, menyediakan appBar, body, serta menyediakan framework agar aplikasi responsif
* AppBar : bagian atas aplikasi dan menerima properti seperti title dan backgroundColor
* SingleChildScrollView : memungkinkan konten di dalamnya bisa discroll. digunakan untuk mengelola tata letak konten.
* Padding : menambahkan ruang (padding) di sekeliling widget-child
* Column : menampilkan children secara vertikal dan menyusun widget-child ke kolom vertikal
* GridView.count : menampilkan widget dalam menampilkan daftar item dari list items dengan jumlah kolom sebanyak 3.
* ShopCard : menerima ShopItem sebagai parameter dan digunakan untuk menampilkan card berisi ikon dan teks dengan warna background dari ShopItem
* Material : widget yang mengimplementasikan aspek material desain dari Flutter. menerima properti color untuk menentukan warna background.
* InkWell : digunakan untuk handle action ketika user menekan card
* Container : widget untuk mengatur tata letak dan dekorasi suatu widget. berfungsi sebagai wadah untuk menempatkan icon dan teks di dalam card
* Icon : menampilkan ikon berdasarkan nilai IconData dari item ShopItem
* Text : menampilkan teks nama item pada ShopItem.
* SnackBar : menampilkan pesan "Kamu telah menekan tombol {nama_item}" dan muncul ketika card diklik
* ShopItem : Kelas model berisi atribut seperti nama, ikon, dan warna untuk setiap item yang ditampilkan di layar. 


---

# Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

* Pertama, saya generate proyek Flutter baru dengan mengetikkan baris kode berikut pada command prompt direktori proyek Flutter saya.
    ```
    flutter create fashion_pile
    cd fashion_pile
    ```
* Selanjutnya, saya membuat file baru bernama menu.dart pada direktori fashion_pile/lib dan menambahkan kode ini : 
    ```
    import 'package:flutter/material.dart';
    ```
    
* Kemudian, file menu.dart saya isi dengan baris kode pada line 39 sampai akhir dari main.dart (dipindahkan). Saya juga menambahkan import menu.dart di file main.dart
* Selanjutnya, saya mengubah stateful widget menjadi stateless widget di file main.dart dan mengubah baris MyHomePage(......) menjadi MyHomePage()
* Pada file menu.dart, saya mengubah juga sifat widget stateful menjadi stateless dan mengubah bagian baris MyHomePage menjadi seperti di bawah ini: 
    ```
    class MyHomePage extends StatelessWidget {
        MyHomePage({Key? key}) : super(key: key);

        @override
        Widget build(BuildContext context) {
            return Scaffold(
                ...
            );
        }
    }
    ```
* Kemudian, saya membuat class berisi atribut-atribut yang akan digunakan untuk menampilkan teks dan card.
    ```
    class ShopItem {
      final String name;
      final IconData icon;
      final MaterialColor color;

      ShopItem(this.name, this.icon, this.color);
    }
    ```
* Selanjutnya saya menambahkan kode di ini di bawah kode MyHomePage({Key? ......})
    ```
    final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist, Colors.pink),
        ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.red),
        ShopItem("Logout", Icons.logout, Colors.purple),
    ];
    ```
* Kemudian, saya menambahkan baris-baris kode di Widget build untuk mengatur tata letak teks, padding, layout grid, dan sebagainya.
* Selanjutnya, saya membuat widget stateless baru untuk menampilkan card.
    ```
    class ShopCard extends StatelessWidget {
      final ShopItem item;

      const ShopCard(this.item, {super.key}); // Constructor

      @override
      Widget build(BuildContext context) {
        return Material(
          color: item.color,
          child: InkWell(
            // Area responsive terhadap sentuhan
            onTap: () {
              // Memunculkan SnackBar ketika diklik
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text("Kamu telah menekan tombol ${item.name}!")));
            },
            child: Container(
              // Container untuk menyimpan Icon dan Text
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item.icon,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    Text(
                      item.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }
    ```
* Untuk menampilkan hasil, jalankan flutter run di command prompt.