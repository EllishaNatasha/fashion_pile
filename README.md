# TUGAS 7

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

---

# TUGAS 8

# Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

* Navigator.push() adalah metode untuk berpindah ke halaman baru dan tetap mempertahankan halaman sebelumnya pada stack navigasi. Jadi, ketika user menekan tombol kembali, aplikasi akan kembali ke halaman sebelumnya. 
* Navigator.pushReplacement() adalah metode untuk berpindah ke halaman baru, namun halaman sebelumnya dihapus dari stack navigasi. Jadi, ketika user menekan tombol kembali, aplikasi tidak kembali ke halaman sebelumnya. User akan keluar dari aplikasi atau kembali ke halaman yang ada sebelum halaman yang dihapus. 
* Contoh penggunaan kedua metode tersebut adalah ketika ingin membuat aplikasi di mana user dapat kembali ke halaman sebelumnya, dapat menggunakan Navigator.push(). Namun, ketika ingin membuat aplikasi di mana user tidak dapat mengakses atau kembali ke halaman sebelumnya, dapat menggunakan Navigator.pushReplacement().

---

# Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

* Align : Widget yang menyesuaikan posisi child-nya dalam dirinya sendiri
* Baseline : Widget yang menempatkan child-nya sesuai dengan baseline child tersebut
* Center : Widget yang menempatkan child-nya di posisi center (di tengah)
* Container : Widget yang mengatur penempatan, ukuran, dan tata letak child-nya
* Expanded : Widget yang memperluas child dari Row, Column, atau Flex
* LimitedBox : Widget yang membatasi ukurannya atau memberikan ukuran yang maksimal.
* Padding : Widget yang memberikan padding pada child-nya
* SizedBox : Widget dengan ukuran tertentu
* Column : Widget yang menyusun daftar child secara vertikal
* Row : Widget yang menyusun daftar child secara horizontal
* GridView : Sebuah daftar grid yang terdiri dari pola sel yang berulang diatur dalam tata letak vertikal dan horizontal

---

# Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

Pada tugas kali ini, elemen input form yang saya gunakan adalah TextFormField. Saya menggunakan TextFormField agar user dapat mengetik secara langsung dalam memberikan input nama, jumlah, dan deskripsi.

---

# Bagaimana penerapan clean architecture pada aplikasi Flutter?

Penerapan clean architecture pada aplikasi Flutter melibatkan beberapa langkah penting:
* Domain Layer : merupakan inti dari aplikasi yang berisi model data
* Application Layer : layer yang mengimplementasikan use case dari aplikasi serta menjembatani infrastructure layer dan presentation layer
* Infrastructure Layer : layer yang mengurusi interaksi dengan database, server web, interface user, dan sebagainya.
* Presentation Layer : layer yang berisi kode yang merender antarmuka pengguna dimana request dibuat dan respons dikembalikan.

---

# Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

#### Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru

Untuk membuat form, saya membuat file baru bernama itemlist_form.dart yang di dalamnya terdapat widget-widget yang diperlukan. Form yang saya buat merupakan TextFormField dan terdapat validasi ketika user menginput data. Berikut merupakan isi dari file itemlist_form.dart
```
import 'package:flutter/material.dart';
import 'package:fashion_pile/widgets/left_drawer.dart';

class ItemFormPage extends StatefulWidget {
  const ItemFormPage({super.key});

  @override
  State<ItemFormPage> createState() => _ItemFormPageState();
}

class _ItemFormPageState extends State<ItemFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Item',
          ),
        ),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      // Menambahkan drawer
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Item",
                    labelText: "Nama Item",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
                ),

                
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Jumlah",
                    labelText: "Jumlah",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  
                  onChanged: (String? value) {
                    setState(() {
                      _amount = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Jumlah tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Jumlah harus berupa angka!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Deskripsi",
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Produk berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: $_name'),
                                    Text('Jumlah: $_amount'),
                                    Text('Deskripsi: $_description'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      _formKey.currentState!.reset();
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ] 
        ),
      ),
      )
    );
  }
}
```

#### Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.

Untuk mengarahkan pengguna ke halaman form tambah item ketika menekan tombol tambah item pada halaman utama, saya memodifikasi dan menambahkan beberapa kode pada file item_card.dart
```
if (item.name == "Tambah Item") {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => const ItemFormPage()));
}
```
Kode tersebut menggunakan NavigatorPush.

#### Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.

Saya menggunakan showDialog di file itemlist_form.dart yang berisikan kode berikut:
```
Align(
  alignment: Alignment.bottomCenter,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Colors.indigo),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Produk berhasil tersimpan'),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text('Nama: $_name'),
                      Text('Jumlah: $_amount'),
                      Text('Deskripsi: $_description'),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        _formKey.currentState!.reset();
        }
      },
    )
  )
)
```

#### Membuat sebuah drawer pada aplikasi

Untuk membuat drawer, saya membuat file left_drawer.dart dan di dalamnya saya membuat ListTile dan sudah dinavigasi ke halaman yang sesuai. Berikut merupakan kodenya
```
import 'package:flutter/material.dart';
import 'package:fashion_pile/screens/menu.dart';
import 'package:fashion_pile/screens/itemlist_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            // Bagian drawer header
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 70, 6, 59)
            ),
            child: Column(
              children: [
                Text(
                  'Fashion Pile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Catat seluruh item di sini!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                    ),
              ],
            ),
          ),
          // Bagian routing
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Produk'),
            // Bagian redirection ke ItemFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemFormPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
```

---

# TUGAS 9

#  Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Ya, pengambilan data JSON dapat dilakukan tanpa membuat model terlebih dahulu. Pengambilan data JSON biasanya dilakukan dengan menggunakan teknik seperti parsing JSON. Namun, lebih baik membuat model terlebih dahulu karena jika tidak, akan lebih sulit untuk memanipulasi atau memodifikasi data.

---

# Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

CookieReques berfungsi untuk mengolah data-data cookies yang ada saat login dan logout. CookieRequest perlu dibagikan ke semua komponen untuk mempertahankan sesi pengguna.

---

# Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.

* Membuat model data sesuai dengan model data yang ada di DJango
* Selanjutnya, tambahkan dependensi http
* Menambahkan akses internet 
* Parsing JSON
* Konversi menjadi objek untuk ditampilkan dengan menggunakan ListView

---

# Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

* Membuat django-app bernama authentication di project Django dan menambahkannya di INSTALLED_APPS pada settings.py projek Django
* Menjalankan perintah pip install django-cors-headers dan tambahkan corsheaders ke INSTALLED_APPS.
* Menambahkan corsheaders.middleware.CorsMiddleware ke settings.py
* Menambahkan variabel seperti berikut:
  ```
  CORS_ALLOW_ALL_ORIGINS = True
  CORS_ALLOW_CREDENTIALS = True
  CSRF_COOKIE_SECURE = True
  SESSION_COOKIE_SECURE = True
  CSRF_COOKIE_SAMESITE = 'None'
  SESSION_COOKIE_SAMESITE = 'None'
  ```
* Membuat method view untuk login, lalu membuat file urls.py yang ditambahkan dengan URL routing terhadap fungsi yang sudah dibuat tadi
* Tambahkan path('auth/', include('authentication.urls')), pada file shopping_list/urls.py
* Berikan informasi CookieRequest menggunakan Provider
* Buat halaman login pada flutter dan meminta username serta password

---

# Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.

* Column : Widget untuk menyusun children secara vertikal
* Padding : Widget untuk memberikan padding pada child
* SizedBox : Widger untuk mengatur ukuran
* Scaffold : Widget yang berfungsi sebagai kanvas atau struktur visual dasar untuk widget-widget lain
* AppBar : Widget untuk menampilkan bagian atas aplikasi
* Material App : Widget untuk tema dari aplikasi yang memiliki default styling Material UI.
* Text : Widget yang berfungsi untuk menampilkan text.
* TextField : Widget untuk menerima input
* ListView : Widget untuk menampilkan children dan bisa discroll
* ElevatedButton : Widget untuk memberikan elevasi ke arah layar saat button ditekan.
* Container : Widget yang mengatur tata letak child

---

# Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

#### Membuat halaman login pada proyek tugas Flutter.
Membuat file login.dart dengan kode sebagai berikut:
```
import 'package:fashion_pile/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
    runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
const LoginApp({super.key});

@override
Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login',
        theme: ThemeData(
            primarySwatch: Colors.blue,
    ),
    home: const LoginPage(),
    );
    }
}

class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: const Text('Login'),
            ),
            body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        TextField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                                labelText: 'Username',
                            ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                labelText: 'Password',
                            ),
                            obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                            onPressed: () async {
                                String username = _usernameController.text;
                                String password = _passwordController.text;

                                
                                final response = await request.login("http://127.0.0.1:8000/auth/login/", {
                                'username': username,
                                'password': password,
                                });
                    
                                if (request.loggedIn) {
                                    String message = response['message'];
                                    String uname = response['username'];
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyHomePage()),
                                    );
                                    ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                            SnackBar(content: Text("$message Selamat datang, $uname.")));
                                    } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            title: const Text('Login Gagal'),
                                            content:
                                                Text(response['message']),
                                            actions: [
                                                TextButton(
                                                    child: const Text('OK'),
                                                    onPressed: () {
                                                        Navigator.pop(context);
                                                    },
                                                ),
                                            ],
                                        ),
                                    );
                                }
                            },
                            child: const Text('Login'),
                        ),
                    ],
                ),
            ),
        );
    }
}
```

#### Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
* Membuat django-app bernama authentication di project Django dan menambahkannya di INSTALLED_APPS pada settings.py projek Django
* Menjalankan perintah pip install django-cors-headers dan tambahkan corsheaders ke INSTALLED_APPS.
* Menambahkan corsheaders.middleware.CorsMiddleware ke settings.py
* Menambahkan variabel seperti berikut:
  ```
  CORS_ALLOW_ALL_ORIGINS = True
  CORS_ALLOW_CREDENTIALS = True
  CSRF_COOKIE_SECURE = True
  SESSION_COOKIE_SECURE = True
  CSRF_COOKIE_SAMESITE = 'None'
  SESSION_COOKIE_SAMESITE = 'None'
  ```
* Membuat method view untuk login, lalu membuat file urls.py yang ditambahkan dengan URL routing terhadap fungsi yang sudah dibuat tadi
* Tambahkan path('auth/', include('authentication.urls')), pada file shopping_list/urls.py
* Berikan informasi CookieRequest menggunakan Provider

#### Membuat model kustom sesuai dengan proyek aplikasi Django.
* Menyalin data yang ada di JSON proyek django ke situs web QuickType
* Copycode yang ada di Quicktype lalu tempel kode ke file item.dart. Berikut ini adalah kodenya:
  ```
  // To parse this JSON data, do
  //
  //     final Item = ItemFromJson(jsonString);

  import 'dart:convert';

  List<Item> itemFromJson(String str) => List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

  String itemToJson(List<Item> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  class Item {
      String model;
      int pk;
      Fields fields;

      Item({
          required this.model,
          required this.pk,
          required this.fields,
      });

      factory Item.fromJson(Map<String, dynamic> json) => Item(
          model: json["model"],
          pk: json["pk"],
          fields: Fields.fromJson(json["fields"]),
      );

      Map<String, dynamic> toJson() => {
          "model": model,
          "pk": pk,
          "fields": fields.toJson(),
      };
  }

  class Fields {
      int user;
      String name;
      DateTime dateAdded;
      String description;
      int amount;

      Fields({
          required this.user,
          required this.name,
          required this.dateAdded,
          required this.description,
          required this.amount,
      });

      factory Fields.fromJson(Map<String, dynamic> json) => Fields(
          user: json["user"],
          name: json["name"],
          dateAdded: DateTime.parse(json["date_added"]),
          description: json["description"],
          amount: json["amount"],
      );

      Map<String, dynamic> toJson() => {
          "user": user,
          "name": name,
          "date_added": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
          "description": description,
          "amount": amount,
      };
  }

  ```

#### Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
* Membuat file bernama list_item.dart dan mengisi file tersebut dengan kode berikut:
  ```
  import 'package:fashion_pile/screens/item_detail.dart';
  import 'package:flutter/material.dart';
  import 'package:http/http.dart' as http;
  import 'dart:convert';
  import 'package:fashion_pile/models/item.dart';
  import 'package:fashion_pile/widgets/left_drawer.dart';

  class ItemPage extends StatefulWidget {
      const ItemPage({Key? key}) : super(key: key);

      @override
      _ItemPageState createState() => _ItemPageState();
  }

  class _ItemPageState extends State<ItemPage> {
  Future<List<Item>> fetchItem() async {
      var url = Uri.parse(
          'http://127.0.0.1:8000/json/');
      var response = await http.get(
          url,
          headers: {"Content-Type": "application/json"},
      );

      // melakukan decode response menjadi bentuk json
      var data = jsonDecode(utf8.decode(response.bodyBytes));

      // melakukan konversi data json menjadi object Item
      List<Item> list_item = [];
      for (var d in data) {
          if (d != null) {
              list_item.add(Item.fromJson(d));
          }
      }
      return list_item;
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
          title: const Text('Item'),
          ),
          drawer: const LeftDrawer(),
          body: FutureBuilder(
              future: fetchItem(),
              builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                  } else {
                      if (!snapshot.hasData) {
                      return const Column(
                          children: [
                          Text(
                              "Tidak ada data produk.",
                              style:
                                  TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                          ),
                          SizedBox(height: 8),
                          ],
                      );
                  } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      Text(
                                      "${snapshot.data![index].fields.name}",
                                      style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                      ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text("${snapshot.data![index].fields.amount}"),
                                      const SizedBox(height: 10),
                                      Text(
                                          "${snapshot.data![index].fields.description}"),
                                      const SizedBox(height: 10),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => ItemDetail(
                                                        snapshot.data![index])));
                                          },
                                          child: const Text("Detail"))
                                  ],
                                  ),
                              ));
                      }
                  }
              }));
      }
  }
  ```
* Tambahkan halaman list_item.dart ke widgets/left_drawer.dart dengan menambahkan kode berikut:
  ```
  ListTile(
      leading: const Icon(Icons.shopping_basket),
      title: const Text('Daftar Item'),
      onTap: () {
          // Route menu ke halaman Item
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ItemPage()),
          );
      },
  ),
  ```

* Selanjutnya, ubah fungsi tombol Lihat Item pada halaman utama agar direct ke ItemPage:
  ```
  else if (item.name == "Lihat Item") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ItemPage()));
        }
  ```

#### Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
* Membuat file item_detail.dart dengan isinya adalah berikut
  ```
  import 'package:flutter/material.dart';
  import 'package:fashion_pile/models/item.dart';
  import 'package:fashion_pile/widgets/left_drawer.dart';

  class ItemDetail extends StatelessWidget {
    final Item item;

    const ItemDetail(this.item, {super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(item.fields.name),
        ),
        drawer: const LeftDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Name: ${item.fields.name}"),
              Text("Amount: ${item.fields.amount}"),
              Text("Description: ${item.fields.description}"),
              
            ],
          ),
        ),
      );
    }
  }
  ```
* Menambahkan button pada file list_item.dart
  ```
  const SizedBox(height: 10),
  ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ItemDetail(
                    snapshot.data![index])));
      },
      child: const Text("Detail"))
  ```