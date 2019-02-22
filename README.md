# SoalShift_modul1_F08
Semoga berkah dan berhasil mengerjakan soal praktikum Sistem Operasi sampai selesai

1. Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah dienkripsi oleh seseorang menggunakan bash script, file yang dimaksud adalah nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari. Hint: Base64, Hexdump

<h2>Jawaban:</h2>

- Pertama kita lakukan decrypt pada folder nature.zip
- Lalu folder tersebut diunzip dengan *unzip*
- Mendecrypt file di dalam folder tersebut dengan *base64 -d*
- Mereverse file dengan hexdump *xxd -r*
- Terakhir kita membuat crontabnya untuk mengatur waktu sesuai soal

2. Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv. Laporan yang diminta berupa:

a. Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012.

b. Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a.

c. Tentukan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada soal poin

<h2>Jawaban :</h2>

- Langkah pertama kita harus mengerjakan poin a dulu, karena setelah kita tahu hasilnya maka kita mudah untuk mencari hasil poin b dan c
> awk -F ',' '{ if($7 == '2012') i[$1]+=$10} END {for (x in i){print i[x]" "x}}' ~/Downloads/WA_Sales_Products_2012-14.csv | sort -rn | head -1
- Keterangan : membuat kondisi 2012, string array field (kolom) pertama *negara* memiliki nilai field ke 10 *quantity*, lalu kita urutkan dari terbeasr ke yang terkecil, lalu ambil satu yang teratas
> awk -F ',' '{ if($7 == "2012" && $1 == "United States") i[$4]+=$10} END {for (x in i){print i[x]" "x}}' ~/Downloads/WA_Sales_Products_2012-14.csv | sort -rn | head -3
- Kita memiliki 2 kondisi yaitu pada tahun 2012 dan negara paling terbanyak quantitynya yaitu *United States", string array field (kolom) ke-empat *product line* memiliki nilai field ke 10 *quantity*, lalu urutkan dari yang terbesar ke yang terkecil, lalu ambil tiga teratas
> awk -F ',' '{ if($7 == '2012' && $1 == "United States" && ($4 == "Personal Accessories" || $4 == "Camping Equipment" || $4 == "Outdoor Protection")) i[$6]+=$10} END {for (x in i){print i[x]" "x}}' ~/Downloads/WA_Sales_Products_2012-14.csv | sort -rn | head -3
- Kita memiliki 5 kondisi yaitu pada tahun 2012, negara paling terbanyak quantitynya yaitu *United States", dan 3 *Product Line* terbanyak, string array field (kolom) ke-enam *product* memiliki nilai field ke 10 *quantity*, lalu urutkan dari yang terbesar ke yang terkecil, lalu ambil tiga teratas
3. Buatlah sebuah script bash yang dapat menghasilkan password secara acak sebanyak 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama sebagai berikut:

a. Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file bernama password1.txt

b. Jika file password1.txt sudah ada maka password acak baru akan disimpan pada file bernama password2.txt dan begitu seterusnya.

c. Urutan nama file tidak boleh ada yang terlewatkan meski filenya dihapus.

d. Password yang dihasilkan tidak boleh sama.

<h2>Jawaban :</h2>

- Pertama membuat pass randomnya yang akan dimasukin di file password$order di directory /home
> cat /dev/urandom | tr -dc '0-9a-zA-Z0-9' |fold -w 12 |head -n 1 > password$order.txt
- Membuat file password$order nya dan order bakal +1 jika file yang dicek sudah ada / sesuai dengan nilai order sebelum ditambahkan
> if [[ -f password$order.txt ]] then order=$((order + 1))

4. Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal- bulan-tahun”. Isi dari file backup terenkripsi dengan konversi huruf (string manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai berikut:

a. Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki urutan ke 12+2 = 14.

b. Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke empat belas, dan seterusnya.

c. setelah huruf z akan kembali ke huruf a

d. Backup file syslog setiap jam.

e. dan buatkan juga bash script untuk dekripsinya.

<h2>Jawaban :</h2>

- Dan berikan crontab setiap jam
> */60 * * * * zaky /home/zaky/nomer4.sh

5. Buatlah sebuah script bash untuk menyimpan record dalam syslog yang memenuhi kriteria berikut:

a. Tidak mengandung string “sudo”, tetapi mengandung string “cron”, serta buatlah pencarian stringnya tidak bersifat case sensitive, sehingga huruf kapital atau tidak, tidak menjadi masalah.

b. Jumlah field (number of field) pada baris tersebut berjumlah kurang dari 13.

c. Masukkan record tadi ke dalam file logs yang berada pada direktori /home/[user]/modul1.

d. Jalankan script tadi setiap 6 menit dari menit ke 2 hingga 30, contoh 13:02, 13:08, 13:14, dst.

<h2>Jawaban :</h2>

> awk '(/CRON/ || /cron/),!/sudo/' /var/log/syslog | awk 'NF < 13' >> /home/zaky/nomer5
- Keterangan : membuat kondisi memilih kata *cron* huruf kecil atau huruf besar semua yang tidak mengandung *sudo*. Lalu di pipe dan memilih field (kolom) yang kurang dari 13, dan hasilnya akan ditaruh di file nomer5 yang berada di home
- Dan kita beri crontab setiap 6 menit dari menit ke 2 hingga 30
> 2-30/6 * * * * zaky /home/zaky/nomer5.sh
