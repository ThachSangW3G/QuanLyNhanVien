class BacThue {
  final int soBac;
  final int startValue;
  final int endValue;
  final int thueSuat;

  BacThue({
    required this.soBac,
    required this.startValue,
    required this.endValue,
    required this.thueSuat,
  });

  factory BacThue.fromJson(Map<String, dynamic> json) {
    return BacThue(
      soBac: json['soBac'],
      startValue: json['startValue'],
      endValue: json['endValue'],
      thueSuat: json['thueSuat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'soBac': soBac,
      'startValue': startValue,
      'endValue': endValue,
      'thueSuat': thueSuat,
    };
  }
}

List<BacThue> listBacThue = [
  BacThue(
    soBac: 1,
    startValue: 0,
    endValue: 5000000,
    thueSuat: 5,
  ),
];
