import 'product.dart';

/// Static catalog modeled on the actual "studywithcampus" Shopee listings
/// (an official Kokuyo Campus reseller) — real names, prices, ratings, and
/// sold counts; product photography uses free-to-embed Pexels stock photos.
/// Each photo is picked to match its product's actual category — notebook
/// covers for notebooks, ring-binder shots for binders, ruled vs. plain
/// sheets for the two loose-leaf refills, pens for pens, pouches/cases for
/// cases — and no photo ID is reused across two different listings
/// (Pexels' images.pexels.com CDN allows hotlinking).
class ProductRepository {
  ProductRepository._();

  static const List<Product> all = [
    Product(
      id: 'illustrator-notebook-a5-sasaki',
      name: 'Campus Illustrator Notebook A5',
      variant: '4 PCS · Sasaki Mayu print',
      price: 260,
      category: 'Notebooks',
      rating: 5.0,
      soldCount: 124,
      description:
          'A 4-piece set of A5 notebooks featuring illustrator Sasaki '
          'Mayu\'s artwork on the covers, with Campus\'s standard smooth, '
          'fountain-pen-friendly paper inside.',
      imageUrl: 'https://images.pexels.com/photos/8230968/pexels-photo-8230968.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    Product(
      id: 'illustrator-notebook-a5-hoshio',
      name: 'Campus Illustrator Notebook A5',
      variant: '4 PCS · Hoshio Hiroto print',
      price: 260,
      category: 'Notebooks',
      rating: 4.9,
      soldCount: 103,
      description:
          'Same trusted Campus notebook, dressed in a rotating cast of '
          'illustrator collaborations — this set carries Hoshio Hiroto\'s '
          'cover art.',
      imageUrl: 'https://images.pexels.com/photos/273034/pexels-photo-273034.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    Product(
      id: 'illustrator-notebook-b5-momoro',
      name: 'Campus Illustrator Notebook B5',
      variant: '4 PCS · momoro print',
      price: 357,
      category: 'Notebooks',
      rating: 5.0,
      soldCount: 64,
      description:
          'The larger B5 format of the illustrator series, for anyone who '
          'wants more room per page — this set features momoro\'s covers.',
      imageUrl: 'https://images.pexels.com/photos/9743014/pexels-photo-9743014.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    Product(
      id: 'notebook-plaid-a5',
      name: 'Campus Notebook — Plaid Pattern',
      variant: '4 PCS · A5 · 8mm ruled',
      price: 260,
      category: 'Notebooks',
      rating: 5.0,
      soldCount: 69,
      description:
          'A softer, plaid-covered take on the standard Campus notebook. '
          '8mm ruled pages, A5 size, sold in a set of four.',
      imageUrl: 'https://images.pexels.com/photos/5088025/pexels-photo-5088025.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    Product(
      id: 'notebook-crabit-b5',
      name: 'Campus Notebook — Crabit Collaboration',
      variant: '4 PCS · B5',
      price: 357,
      category: 'Notebooks',
      rating: 5.0,
      soldCount: 25,
      description:
          'A limited collaboration print with character brand Crabit, in '
          'the larger B5 size — same reliable Campus paper underneath.',
      imageUrl: 'https://images.pexels.com/photos/8099373/pexels-photo-8099373.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    Product(
      id: 'ac-binder-b5',
      name: 'Campus AC 4-Hole Binder Notebook',
      variant: 'B5 · Max 80 pages',
      price: 284,
      category: 'Binders',
      rating: 5.0,
      soldCount: 202,
      description:
          'A refillable 4-hole binder notebook that holds up to 80 pages '
          '— add or remove Campus loose leaf refills as your semester '
          'grows.',
      imageUrl: 'https://images.pexels.com/photos/17018372/pexels-photo-17018372.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    Product(
      id: 'ac-binder-a5',
      name: 'Campus AC 4-Hole Binder Notebook',
      variant: 'A5 · Max 80 pages',
      price: 246,
      category: 'Binders',
      rating: 5.0,
      soldCount: 215,
      description:
          'The compact A5 version of the AC binder notebook — easy to '
          'slip into a smaller bag between classes.',
      imageUrl: 'https://images.pexels.com/photos/4502977/pexels-photo-4502977.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    Product(
      id: 'loose-leaf-8mm',
      name: 'Campus Loose Leaf',
      variant: '8mm line · 50 sheets',
      price: 85,
      category: 'Refills',
      rating: 4.9,
      soldCount: 477,
      description:
          'Refill paper for the AC binder line, ruled at 8mm — the '
          'best-seller of the bunch, and the one most worth stocking up '
          'on.',
      imageUrl: 'https://images.pexels.com/photos/18368498/pexels-photo-18368498.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    Product(
      id: 'loose-leaf-plain',
      name: 'Campus Loose Leaf',
      variant: 'Plain · 50 sheets',
      price: 85,
      category: 'Refills',
      rating: 4.9,
      soldCount: 122,
      description:
          'Unruled refill paper for sketching, diagrams, or note-taking '
          'styles that don\'t want lines in the way.',
      imageUrl: 'https://images.pexels.com/photos/4207707/pexels-photo-4207707.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    Product(
      id: 'pen-noritake',
      name: 'Campus × Noritake Gel Ink Pen',
      variant: 'Ballpoint · collaboration edition',
      price: 107,
      category: 'Pens',
      rating: 5.0,
      soldCount: 75,
      description:
          'A gel ink ballpoint from Campus\'s collaboration with '
          'tableware brand Noritake — smooth, consistent line, dressed up '
          'a little.',
      imageUrl: 'https://images.pexels.com/photos/6969328/pexels-photo-6969328.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    Product(
      id: 'pen-sou-sou',
      name: 'Campus × SOU · SOU Gel Ink Pen',
      variant: 'Ballpoint · collaboration edition',
      price: 116,
      category: 'Pens',
      rating: 5.0,
      soldCount: 36,
      description:
          'A second collaboration pen, this time with textile brand '
          'SOU · SOU — same reliable gel ink mechanism, different pattern '
          'on the barrel.',
      imageUrl: 'https://images.pexels.com/photos/867482/pexels-photo-867482.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    Product(
      id: 'mesh-pencil-case',
      name: 'Campus AC Mesh Pencil Case',
      variant: 'Lightweight',
      price: 186,
      category: 'Cases & pouches',
      rating: 5.0,
      soldCount: 66,
      description:
          'A see-through mesh pencil case — light enough for daily '
          'carry, and you can spot the pen you want without unzipping '
          'everything first.',
      imageUrl: 'https://images.pexels.com/photos/3731255/pexels-photo-3731255.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    Product(
      id: 'pan-case',
      name: 'Campus Pan! Case AC',
      variant: 'Wide-open pencil case',
      price: 559,
      category: 'Cases & pouches',
      rating: 5.0,
      soldCount: 118,
      description:
          'Opens flat so every pen lies visible at once, instead of '
          'buried at the bottom of a zippered pouch.',
      imageUrl: 'https://images.pexels.com/photos/8581385/pexels-photo-8581385.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    Product(
      id: 'nemu-nemu-pouch',
      name: 'Kokuyo NEMU NEMU AC Pouch',
      variant: 'Cute Japanese character print',
      price: 528,
      category: 'Cases & pouches',
      rating: 5.0,
      soldCount: 26,
      description:
          'A softer, character-printed pouch from Kokuyo\'s NEMU NEMU '
          'line — as much a desk accessory as a pencil case.',
      imageUrl: 'https://images.pexels.com/photos/37187501/pexels-photo-37187501.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    Product(
      id: 'mag-critz-stand',
      name: 'Kokuyo Mag Critz Neo AC',
      variant: 'Pencil case that stands upright',
      price: 717,
      category: 'Cases & pouches',
      rating: 4.9,
      soldCount: 73,
      description:
          'A structured pencil case that folds out into its own upright '
          'stand on the desk, so pens stay within reach instead of rolling '
          'off.',
      imageUrl: 'https://images.pexels.com/photos/3846270/pexels-photo-3846270.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
  ];
}