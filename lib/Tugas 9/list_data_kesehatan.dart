import 'data_kesehatan.dart';

List<DataKesehatan> dataKesehatan = [
  DataKesehatan(
    id: 1,
    title: "Kesehatan Umum",
    description: "Edukasi pola hidup sehat sehari-hari",
    image:
        "https://images.pexels.com/photos/40568/medical-appointment-doctor-healthcare-40568.jpeg",
    medications: [
      Medication(
        name: "Paracetamol",
        type: "Analgesik",
        description: "Meredakan nyeri dan demam ringan hingga sedang",
        dosage: "500 mg, 3x sehari",
        isPrescription: false,
      ),
      Medication(
        name: "Ibuprofen",
        type: "NSAID",
        description: "Mengurangi nyeri, peradangan, dan demam",
        dosage: "200-400 mg, 3x sehari",
        isPrescription: false,
      ),
    ],
  ),

  DataKesehatan(
    id: 2,
    title: "Kesehatan Mental",
    description: "Menjaga kesehatan emosional dan psikologis",
    image:
        "https://images.unsplash.com/photo-1493836512294-502baa1986e2",
    medications: [
      Medication(
        name: "Fluoxetine",
        type: "Antidepresan (SSRI)",
        description: "Mengatasi depresi dan gangguan kecemasan",
        dosage: "20 mg per hari",
        isPrescription: true,
      ),
      Medication(
        name: "Alprazolam",
        type: "Benzodiazepin",
        description: "Mengurangi kecemasan berat",
        dosage: "0.25-0.5 mg",
        isPrescription: true,
      ),
    ],
  ),

  DataKesehatan(
    id: 3,
    title: "Gizi & Nutrisi",
    description: "Pemenuhan nutrisi untuk tubuh sehat",
    image:
        "https://images.unsplash.com/photo-1490645935967-10de6ba17061",
    medications: [
      Medication(
        name: "Vitamin C",
        type: "Suplemen",
        description: "Meningkatkan daya tahan tubuh",
        dosage: "500 mg per hari",
        isPrescription: false,
      ),
      Medication(
        name: "Zinc",
        type: "Mineral",
        description: "Mendukung sistem imun dan metabolisme",
        dosage: "20 mg per hari",
        isPrescription: false,
      ),
    ],
  ),

  DataKesehatan(
    id: 4,
    title: "Penyakit & Pencegahan",
    description: "Pencegahan dan pengobatan penyakit umum",
    image:
        "https://images.unsplash.com/photo-1584515933487-779824d29309",
    medications: [
      Medication(
        name: "Amlodipine",
        type: "Antihipertensi",
        description: "Mengontrol tekanan darah tinggi",
        dosage: "5-10 mg per hari",
        isPrescription: true,
      ),
      Medication(
        name: "Metformin",
        type: "Antidiabetik",
        description: "Mengontrol kadar gula darah",
        dosage: "500 mg, 2x sehari",
        isPrescription: true,
      ),
    ],
  ),

  DataKesehatan(
    id: 5,
    title: "Pertolongan Pertama",
    description: "Penanganan awal pada kondisi darurat ringan",
    image:
        "https://images.unsplash.com/photo-1579154204601-01588f351e67",
    medications: [
      Medication(
        name: "Povidone Iodine",
        type: "Antiseptik",
        description: "Membersihkan luka untuk mencegah infeksi",
        dosage: "Oles sesuai kebutuhan",
        isPrescription: false,
      ),
      Medication(
        name: "Oralit",
        type: "Rehidrasi",
        description: "Mengganti cairan tubuh saat diare",
        dosage: "Larutkan 1 sachet dalam air",
        isPrescription: false,
      ),
    ],
  ),

  DataKesehatan(
    id: 6,
    title: "Kesehatan Ibu & Anak",
    description: "Perawatan kesehatan ibu hamil dan anak",
    image:
        "https://images.unsplash.com/photo-1504439904031-93ded9f93e4e",
    medications: [
      Medication(
        name: "Asam Folat",
        type: "Vitamin",
        description: "Mendukung perkembangan janin",
        dosage: "400-800 mcg per hari",
        isPrescription: false,
      ),
      Medication(
        name: "Zat Besi",
        type: "Suplemen",
        description: "Mencegah anemia pada ibu hamil",
        dosage: "1 tablet per hari",
        isPrescription: false,
      ),
    ],
  ),

  DataKesehatan(
    id: 7,
    title: "Kebugaran & Olahraga",
    description: "Menunjang performa dan pemulihan tubuh",
    image:
        "https://images.unsplash.com/photo-1517836357463-d25dfeac3438",
    medications: [
      Medication(
        name: "Magnesium",
        type: "Mineral",
        description: "Mencegah kram otot",
        dosage: "250-400 mg per hari",
        isPrescription: false,
      ),
      Medication(
        name: "Diclofenac Gel",
        type: "NSAID Topikal",
        description: "Meredakan nyeri otot",
        dosage: "Oles 2-3x sehari",
        isPrescription: false,
      ),
    ],
  ),

  DataKesehatan(
    id: 8,
    title: "Kesehatan Remaja",
    description: "Perawatan kesehatan usia remaja",
    image:
        "https://images.unsplash.com/photo-1522202176988-66273c2fd55f",
    medications: [
      Medication(
        name: "Benzoyl Peroxide",
        type: "Topikal",
        description: "Mengatasi jerawat",
        dosage: "Oles tipis 1-2x sehari",
        isPrescription: false,
      ),
      Medication(
        name: "Vitamin B Complex",
        type: "Suplemen",
        description: "Menunjang metabolisme tubuh",
        dosage: "1 tablet per hari",
        isPrescription: false,
      ),
    ],
  ),

  DataKesehatan(
    id: 9,
    title: "Kesehatan Lansia",
    description: "Perawatan kesehatan usia lanjut",
    image:
        "https://images.unsplash.com/photo-1526256262350-7da7584cf5eb",
    medications: [
      Medication(
        name: "Calcium + Vitamin D",
        type: "Suplemen",
        description: "Mencegah osteoporosis",
        dosage: "1 tablet per hari",
        isPrescription: false,
      ),
      Medication(
        name: "Simvastatin",
        type: "Penurun Kolesterol",
        description: "Menurunkan kadar kolesterol",
        dosage: "10-20 mg per hari",
        isPrescription: true,
      ),
    ],
  ),

  DataKesehatan(
    id: 10,
    title: "Kesehatan Lingkungan",
    description: "Dampak lingkungan terhadap kesehatan",
    image:
        "https://images.unsplash.com/photo-1501004318641-b39e6451bec6",
    medications: [
      Medication(
        name: "Loratadine",
        type: "Antihistamin",
        description: "Meredakan alergi akibat debu atau polusi",
        dosage: "10 mg per hari",
        isPrescription: false,
      ),
      Medication(
        name: "Salbutamol Inhaler",
        type: "Bronkodilator",
        description: "Meringankan sesak napas",
        dosage: "Sesuai anjuran dokter",
        isPrescription: true,
      ),
    ],
  ),
];