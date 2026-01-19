import 'package:flutter/material.dart';
import '../category.dart';

class SensoryCategories {
  /// Get sensory categories for a specific animal
  static List<Category> getSensoryCategoriesForAnimal(String animalId) {
    final categories = <Category>[];

    // Hearing & Balance - different for each animal
    List<Category> hearingBalanceSubcategories;
    if (animalId.toLowerCase() == 'bird') {
      hearingBalanceSubcategories = [
        Category(
          id: 'external_ear',
          label: 'External Ear',
          icon: Icons.hearing,
          imagePath: 'assets/images/$animalId/sensory/hearing_balance.webp',
        ),
        Category(
          id: 'inner_ear_cochlea',
          label: 'Inner Ear Cochlea',
          icon: Icons.hearing,
          imagePath: 'assets/images/$animalId/sensory/hearing_balance.webp',
        ),
        Category(
          id: 'middle_ear',
          label: 'Middle Ear',
          icon: Icons.hearing,
          imagePath: 'assets/images/$animalId/sensory/hearing_balance.webp',
        ),
        Category(
          id: 'vestibular_system',
          label: 'Vestibular System',
          icon: Icons.balance,
          imagePath: 'assets/images/$animalId/sensory/hearing_balance.webp',
        ),
      ];
    } else {
      // Common for horse, dog, and cat
      hearingBalanceSubcategories = [
        Category(
          id: 'auditory_structures',
          label: 'Auditory Structures',
          icon: Icons.hearing,
          imagePath: 'assets/images/$animalId/sensory/hearing_balance.webp',
        ),
        Category(
          id: 'vestibular_structures',
          label: 'Vestibular Structures',
          icon: Icons.balance,
          imagePath: 'assets/images/$animalId/sensory/hearing_balance.webp',
        ),
      ];
    }
    categories.add(Category(
      id: 'hearing_balance',
      label: 'Hearing & Balance',
      icon: Icons.hearing,
      imagePath: 'assets/images/$animalId/sensory/hearing_balance.webp',
      subcategories: hearingBalanceSubcategories,
    ));

    // Smell - single file for all animals
    categories.add(Category(
      id: 'smell',
      label: 'Smell',
      icon: Icons.air,
      imagePath: 'assets/images/$animalId/sensory/smell.webp',
    ));

    // Taste - single file for all animals
    categories.add(Category(
      id: 'taste',
      label: 'Taste',
      icon: Icons.emoji_food_beverage,
      imagePath: 'assets/images/$animalId/sensory/taste.webp',
    ));

    // Touch - different for each animal
    List<Category> touchSubcategories;
    if (animalId.toLowerCase() == 'bird') {
      touchSubcategories = [
        Category(
          id: 'beak_and_tongue_sensors',
          label: 'Beak and Tongue Sensors',
          icon: Icons.touch_app,
          imagePath: 'assets/images/$animalId/sensory/touch.webp',
        ),
        Category(
          id: 'feather_mechanoreceptors',
          label: 'Feather Mechanoreceptors',
          icon: Icons.touch_app,
          imagePath: 'assets/images/$animalId/sensory/touch.webp',
        ),
        Category(
          id: 'skin_receptors',
          label: 'Skin Receptors',
          icon: Icons.sensors,
          imagePath: 'assets/images/$animalId/sensory/touch.webp',
        ),
      ];
    } else {
      // Common for horse, dog, and cat
      touchSubcategories = [
        Category(
          id: 'cutaneous',
          label: 'Cutaneous',
          icon: Icons.touch_app,
          imagePath: 'assets/images/$animalId/sensory/touch.webp',
        ),
        Category(
          id: 'proprioceptive',
          label: 'Proprioceptive',
          icon: Icons.sensors,
          imagePath: 'assets/images/$animalId/sensory/touch.webp',
        ),
      ];
    }
    categories.add(Category(
      id: 'touch',
      label: 'Touch',
      icon: Icons.touch_app,
      imagePath: 'assets/images/$animalId/sensory/touch.webp',
      subcategories: touchSubcategories,
    ));

    // Vision - different for each animal
    List<Category> visionSubcategories;
    if (animalId.toLowerCase() == 'bird') {
      visionSubcategories = [
        Category(
          id: 'bird_retina',
          label: 'Bird Retina',
          icon: Icons.visibility,
          imagePath: 'assets/images/$animalId/sensory/vision.webp',
        ),
        Category(
          id: 'eyes',
          label: 'Eyes',
          icon: Icons.visibility,
          imagePath: 'assets/images/$animalId/sensory/vision.webp',
        ),
        Category(
          id: 'optic_nerve',
          label: 'Optic Nerve',
          icon: Icons.visibility,
          imagePath: 'assets/images/$animalId/sensory/vision.webp',
        ),
        Category(
          id: 'pecten_oculi',
          label: 'Pecten Oculi',
          icon: Icons.visibility,
          imagePath: 'assets/images/$animalId/sensory/vision.webp',
        ),
      ];
    } else {
      // Common for horse, dog, and cat
      visionSubcategories = [
        Category(
          id: 'accessory_system',
          label: 'Accessory System',
          icon: Icons.visibility_off,
          imagePath: 'assets/images/$animalId/sensory/vision.webp',
        ),
        Category(
          id: 'system_structures',
          label: 'System Structures',
          icon: Icons.visibility,
          imagePath: 'assets/images/$animalId/sensory/vision.webp',
        ),
      ];
    }
    categories.add(Category(
      id: 'vision',
      label: 'Vision',
      icon: Icons.visibility,
      imagePath: 'assets/images/$animalId/sensory/vision.webp',
      subcategories: visionSubcategories,
    ));

    return categories;
  }
}
