import 'product.dart';
/// Static catalog modeled on the actual "studywithcampus" Shopee listings
/// (an official Kokuyo Campus reseller) — real names, prices, ratings, and
/// sold counts; product photography is swapped for neutral placeholder
/// images rather than the seller's own product photos.
class ProductRepository {
  ProductRepository._();

  static const List<Product> all = [
    Product(
      id: 'illustrator-notebook-a5-sasaki',
      name: 'Campus Illustrator Notebook A5',
      variant: '4 PCS · Sasaki Mayu print',
      price: 260,
      originalPrice: 279.57,
      category: 'Notebooks',
      rating: 5.0,
      soldCount: 124,
      description:
          'A 4-piece set of A5 notebooks featuring illustrator Sasaki '
          'Mayu\'s artwork on the covers, with Campus\'s standard smooth, '
          'fountain-pen-friendly paper inside.',
      imageUrl: 'https://picsum.photos/seed/illustrator-notebook-sasaki/600/600',
    ),
    Product(
      id: 'illustrator-notebook-a5-hoshio',
      name: 'Campus Illustrator Notebook A5',
      variant: '4 PCS · Hoshio Hiroto print',
      price: 260,
      originalPrice: 279.57,
      category: 'Notebooks',
      rating: 4.9,
      soldCount: 103,
      description:
          'Same trusted Campus notebook, dressed in a rotating cast of '
          'illustrator collaborations — this set carries Hoshio Hiroto\'s '
          'cover art.',
      imageUrl: 'https://picsum.photos/seed/illustrator-notebook-hoshio/600/600',
    ),
    Product(
      id: 'illustrator-notebook-b5-momoro',
      name: 'Campus Illustrator Notebook B5',
      variant: '4 PCS · momoro print',
      price: 357,
      originalPrice: 383.87,
      category: 'Notebooks',
      rating: 5.0,
      soldCount: 64,
      description:
          'The larger B5 format of the illustrator series, for anyone who '
          'wants more room per page — this set features momoro\'s covers.',
      imageUrl: 'https://picsum.photos/seed/illustrator-notebook-momoro/600/600',
    ),
    Product(
      id: 'notebook-plaid-a5',
      name: 'Campus Notebook — Plaid Pattern',
      variant: '4 PCS · A5 · 8mm ruled',
      price: 260,
      originalPrice: 279.57,
      category: 'Notebooks',
      rating: 5.0,
      soldCount: 69,
      description:
          'A softer, plaid-covered take on the standard Campus notebook. '
          '8mm ruled pages, A5 size, sold in a set of four.',
      imageUrl: 'https://picsum.photos/seed/notebook-plaid-a5/600/600',
    ),
    Product(
      id: 'notebook-crabit-b5',
      name: 'Campus Notebook — Crabit Collaboration',
      variant: '4 PCS · B5',
      price: 357,
      originalPrice: 383.87,
      category: 'Notebooks',
      rating: 5.0,
      soldCount: 25,
      description:
          'A limited collaboration print with character brand Crabit, in '
          'the larger B5 size — same reliable Campus paper underneath.',
      imageUrl: 'https://picsum.photos/seed/notebook-crabit-b5/600/600',
    ),
    Product(
      id: 'ac-binder-b5',
      name: 'Campus AC 4-Hole Binder Notebook',
      variant: 'B5 · Max 80 pages',
      price: 284,
      originalPrice: 305.38,
      category: 'Binders',
      rating: 5.0,
      soldCount: 202,
      description:
          'A refillable 4-hole binder notebook that holds up to 80 pages '
          '— add or remove Campus loose leaf refills as your semester '
          'grows.',
      imageUrl: 'https://picsum.photos/seed/ac-binder-b5/600/600',
    ),
    Product(
      id: 'ac-binder-a5',
      name: 'Campus AC 4-Hole Binder Notebook',
      variant: 'A5 · Max 80 pages',
      price: 246,
      originalPrice: 264.52,
      category: 'Binders',
      rating: 5.0,
      soldCount: 215,
      description:
          'The compact A5 version of the AC binder notebook — easy to '
          'slip into a smaller bag between classes.',
      imageUrl: 'https://picsum.photos/seed/ac-binder-a5/600/600',
    ),
    Product(
      id: 'loose-leaf-8mm',
      name: 'Campus Loose Leaf',
      variant: '8mm line · 50 sheets',
      price: 85,
      originalPrice: 92.39,
      category: 'Refills',
      rating: 4.9,
      soldCount: 477,
      description:
          'Refill paper for the AC binder line, ruled at 8mm — the '
          'best-seller of the bunch, and the one most worth stocking up '
          'on.',
      imageUrl: 'https://picsum.photos/seed/loose-leaf-8mm/600/600',
    ),
    Product(
      id: 'loose-leaf-plain',
      name: 'Campus Loose Leaf',
      variant: 'Plain · 50 sheets',
      price: 85,
      originalPrice: 92.39,
      category: 'Refills',
      rating: 4.9,
      soldCount: 122,
      description:
          'Unruled refill paper for sketching, diagrams, or note-taking '
          'styles that don\'t want lines in the way.',
      imageUrl: 'https://picsum.photos/seed/loose-leaf-plain/600/600',
    ),
    Product(
      id: 'pen-noritake',
      name: 'Campus × Noritake Gel Ink Pen',
      variant: 'Ballpoint · collaboration edition',
      price: 107,
      originalPrice: 116.30,
      category: 'Pens',
      rating: 5.0,
      soldCount: 75,
      description:
          'A gel ink ballpoint from Campus\'s collaboration with '
          'tableware brand Noritake — smooth, consistent line, dressed up '
          'a little.',
      imageUrl: 'https://picsum.photos/seed/pen-noritake/600/600',
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
      imageUrl: 'https://picsum.photos/seed/pen-sou-sou/600/600',
    ),
    Product(
      id: 'mesh-pencil-case',
      name: 'Campus AC Mesh Pencil Case',
      variant: 'Lightweight',
      price: 186,
      originalPrice: 200,
      category: 'Cases & pouches',
      rating: 5.0,
      soldCount: 66,
      description:
          'A see-through mesh pencil case — light enough for daily '
          'carry, and you can spot the pen you want without unzipping '
          'everything first.',
      imageUrl: 'https://picsum.photos/seed/mesh-pencil-case/600/600',
    ),
    Product(
      id: 'pan-case',
      name: 'Campus Pan! Case AC',
      variant: 'Wide-open pencil case',
      price: 559,
      originalPrice: 601.08,
      category: 'Cases & pouches',
      rating: 5.0,
      soldCount: 118,
      description:
          'Opens flat so every pen lies visible at once, instead of '
          'buried at the bottom of a zippered pouch.',
      imageUrl: 'https://picsum.photos/seed/pan-case/600/600',
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
      imageUrl: 'https://picsum.photos/seed/nemu-nemu-pouch/600/600',
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
      imageUrl: 'https://picsum.photos/seed/mag-critz-stand/600/600',
    ),
  ];
}