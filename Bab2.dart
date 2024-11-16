void main() {
  // Contoh penggunaan
  try {
    var produk1 = Produk("Sistem A", 250000, "NetworkAutomation", 55);
    print(produk1); // Sebelum diskon

    produk1.berikanDiskon(15);
    print(produk1); // Setelah diskon

    var produk2 = Produk("Sistem B", 150000, "DataManagement", 30);
    print(produk2); // Produk DataManagement

    produk2.berikanDiskon(10); // Diskon 10%
    print(produk2); // Setelah diskon
  } catch (e) {
    print(e);
  }
}

// Model Produk
class Produk {
  final String namaProduk;
  double harga;
  final String kategori;
  int jumlahTerjual;

  // Constructor dengan validasi
  Produk(this.namaProduk, this.harga, this.kategori, this.jumlahTerjual) {
    if (kategori == "NetworkAutomation" && harga < 200000) {
      throw ArgumentError("Harga NetworkAutomation harus >= 200.000");
    }
    if (kategori == "DataManagement" && harga >= 200000) {
      throw ArgumentError("Harga DataManagement harus < 200.000");
    }
  }

  // Metode untuk memberikan diskon
  void berikanDiskon(double persentaseDiskon) {
    if (kategori == "NetworkAutomation" && jumlahTerjual > 50) {
      double hargaDiskon = harga * (1 - persentaseDiskon / 100);
      harga = (hargaDiskon < 200000) ? 200000 : hargaDiskon;
    } else {
      harga = harga * (1 - persentaseDiskon / 100);
    }
  }

  @override
  String toString() {
    return "Produk: $namaProduk, Harga: $harga, Kategori: $kategori, Terjual: $jumlahTerjual";
  }
}
