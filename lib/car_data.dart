import 'package:flutter/material.dart';

enum CarCategory { truck, sedan, suv, sportsCar }

class CarTypeInfo {
  final CarCategory category;
  final String label;
  final String imagePath;
  final IconData icon;
  final Color color;
  final String description;
  final List<String> specs;

  const CarTypeInfo({
    required this.category,
    required this.label,
    required this.imagePath,
    required this.icon,
    required this.color,
    required this.description,
    required this.specs,
  });
}

const carTypes = <CarTypeInfo>[
  CarTypeInfo(
    category: CarCategory.truck,
    label: 'Truck',
    imagePath: 'lib/images/truck.jpg',
    icon: Icons.local_shipping,
    color: Color(0xFF8D6E63),
    description:
        'Pickup trucks are built around a sturdy body-on-frame chassis, '
        'prioritizing payload capacity, towing power, and durability over comfort. '
        'Popular for construction work, farm use, and hauling cargo across rough terrain.',
    specs: [
      'Engine: 2.4L\u20134.0L turbo-diesel or V6',
      'Drivetrain: 4x2 or 4x4',
      'Payload capacity: 1,000\u20131,500 kg',
      'Towing capacity: up to 3,500 kg',
      'Fuel economy: 8\u201312 km/L',
    ],
  ),
  CarTypeInfo(
    category: CarCategory.sedan,
    label: 'Sedan',
    imagePath: 'lib/images/sedan.jpg',
    icon: Icons.directions_car,
    color: Color(0xFF5C6BC0),
    description:
        'Sedans are the classic three-box passenger car \u2014 a separate '
        'engine bay, cabin, and trunk. They favor fuel efficiency, ride comfort, '
        'and everyday practicality for city driving and daily commutes.',
    specs: [
      'Engine: 1.2L\u20132.0L inline-4',
      'Drivetrain: Front-wheel drive',
      'Seating: 5 passengers',
      'Trunk capacity: 450\u2013550 L',
      'Fuel economy: 14\u201318 km/L',
    ],
  ),
  CarTypeInfo(
    category: CarCategory.suv,
    label: 'SUV',
    imagePath: 'lib/images/suv.jpg',
    icon: Icons.directions_car_filled,
    color: Color(0xFF43A047),
    description:
        'Sport Utility Vehicles combine a raised ride height and rugged '
        'styling with family-friendly seating. Many offer optional all-wheel drive, '
        'making them a versatile choice for both city roads and light off-roading.',
    specs: [
      'Engine: 1.5L turbo\u20132.8L diesel',
      'Drivetrain: 4x2 or 4x4',
      'Seating: 5\u20137 passengers',
      'Ground clearance: 200\u2013220 mm',
      'Fuel economy: 9\u201314 km/L',
    ],
  ),
  CarTypeInfo(
    category: CarCategory.sportsCar,
    label: 'Sports Car',
    imagePath: 'lib/images/sportscar.jpg',
    icon: Icons.sports_motorsports,
    color: Color(0xFFE53935),
    description:
        'Sports cars are engineered for speed and handling above all else '
        '\u2014 low-slung bodies, powerful engines, and sharp steering response. '
        'Typically two-door, with a firmer ride tuned for performance driving.',
    specs: [
      'Engine: 2.0L turbo\u20133.0L V6/V8',
      'Drivetrain: Rear-wheel or all-wheel drive',
      '0\u2013100 km/h: 3.5\u20136.0 seconds',
      'Seating: 2\u20134 passengers',
      'Fuel economy: 6\u20139 km/L',
    ],
  ),
];

class TrendRank {
  final CarCategory category;
  final int rank;
  final double sharePercent;
  const TrendRank({required this.category, required this.rank, required this.sharePercent});
}

const trendRanking = <TrendRank>[
  TrendRank(category: CarCategory.suv, rank: 1, sharePercent: 34),
  TrendRank(category: CarCategory.sedan, rank: 2, sharePercent: 28),
  TrendRank(category: CarCategory.truck, rank: 3, sharePercent: 24),
  TrendRank(category: CarCategory.sportsCar, rank: 4, sharePercent: 14),
];

const trendSeries = <CarCategory, List<double>>{
  CarCategory.suv: [22, 25, 27, 30, 32, 34],
  CarCategory.sedan: [30, 29, 28, 28, 27, 28],
  CarCategory.truck: [20, 21, 22, 23, 23, 24],
  CarCategory.sportsCar: [10, 11, 12, 13, 13, 14],
};

const trendMonthLabels = ['Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug'];

class TopCar {
  final String brand;
  final String name;
  final String model;
  final int pricePhp;
  const TopCar({required this.brand, required this.name, required this.model, required this.pricePhp});
}

const topCarsInPhilippines = <TopCar>[
  TopCar(brand: 'Toyota', name: 'Vios', model: '2025', pricePhp: 798000),
  TopCar(brand: 'Toyota', name: 'Hilux', model: '2025', pricePhp: 1145000),
  TopCar(brand: 'Mitsubishi', name: 'Xpander', model: '2025', pricePhp: 1030000),
  TopCar(brand: 'Ford', name: 'Ranger', model: '2025', pricePhp: 1289000),
  TopCar(brand: 'Toyota', name: 'Fortuner', model: '2025', pricePhp: 1867000),
];