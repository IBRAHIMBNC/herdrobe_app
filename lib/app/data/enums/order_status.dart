import 'package:flutter/material.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';

enum OrderStatus {
  pending,
  inProgress,
  shipped,
  completed,
  cancelled;

  Color get color {
    switch (this) {
      case OrderStatus.pending:
        return const Color(0xffFF5757);
      case OrderStatus.completed:
        return const Color(0xff4ECC53);
      case OrderStatus.inProgress:
        return AppColors.brand;
      case OrderStatus.shipped:
        return const Color(0xff1F27EF);
      case OrderStatus.cancelled:
        return Colors.red;
      default:
        throw Exception('Invalid OrderStatus');
    }
  }

  String get trackOrderName {
    switch (this) {
      case OrderStatus.pending:
        return 'Order Placed';
      case OrderStatus.completed:
        return 'Delivered';
      case OrderStatus.inProgress:
        return 'In Progress';
      case OrderStatus.shipped:
        return 'Shipped';
      case OrderStatus.cancelled:
        return 'Cancelled';
      default:
        throw Exception('Invalid OrderStatus');
    }
  }

  String get capitalizedName {
    switch (this) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.completed:
        return 'Completed';
      case OrderStatus.inProgress:
        return 'In Progress';
      case OrderStatus.shipped:
        return 'Shipped';
      case OrderStatus.cancelled:
        return 'Cancelled';
      default:
        throw Exception('Invalid OrderStatus');
    }
  }

  static OrderStatus fromString(String value) {
    switch (value) {
      case 'Pending' || 'pending':
        return OrderStatus.pending;
      case 'Completed' || 'completed':
        return OrderStatus.completed;
      case 'In Progress' || 'inProgress':
        return OrderStatus.inProgress;
      case 'Shipped' || 'shipped':
        return OrderStatus.shipped;
      case 'Cancelled' || 'cancelled':
        return OrderStatus.cancelled;
      default:
        throw Exception('Invalid OrderStatus');
    }
  }
}
