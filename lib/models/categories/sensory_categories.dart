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
        ),
        Category(
          id: 'inner_ear_cochlea',
          label: 'Inner Ear Cochlea',
          icon: Icons.hearing,
        ),
        Category(
          id: 'middle_ear',
          label: 'Middle Ear',
          icon: Icons.hearing,
        ),
        Category(
          id: 'vestibular_system',
          label: 'Vestibular System',
          icon: Icons.balance,
        ),
      ];
    } else {
      // Common for horse, dog, and cat
      hearingBalanceSubcategories = [
        Category(
          id: 'auditory_structures',
          label: 'Auditory Structures',
          icon: Icons.hearing,
        ),
        Category(
          id: 'vestibular_structures',
          label: 'Vestibular Structures',
          icon: Icons.balance,
        ),
      ];
    }
    categories.add(Category(
      id: 'hearing_balance',
      label: 'Hearing & Balance',
      icon: Icons.hearing,
      subcategories: hearingBalanceSubcategories,
    ));

    // Smell - single file for all animals
    categories.add(Category(
      id: 'smell',
      label: 'Smell',
      icon: Icons.air,
    ));

    // Taste - single file for all animals
    categories.add(Category(
      id: 'taste',
      label: 'Taste',
      icon: Icons.emoji_food_beverage,
    ));

    // Touch - different for each animal
    List<Category> touchSubcategories;
    if (animalId.toLowerCase() == 'bird') {
      touchSubcategories = [
        Category(
          id: 'beak_and_tongue_sensors',
          label: 'Beak and Tongue Sensors',
          icon: Icons.touch_app,
        ),
        Category(
          id: 'feather_mechanoreceptors',
          label: 'Feather Mechanoreceptors',
          icon: Icons.touch_app,
        ),
        Category(
          id: 'skin_receptors',
          label: 'Skin Receptors',
          icon: Icons.sensors,
        ),
      ];
    } else {
      // Common for horse, dog, and cat
      touchSubcategories = [
        Category(
          id: 'cutaneous',
          label: 'Cutaneous',
          icon: Icons.touch_app,
        ),
        Category(
          id: 'proprioceptive',
          label: 'Proprioceptive',
          icon: Icons.sensors,
        ),
      ];
    }
    categories.add(Category(
      id: 'touch',
      label: 'Touch',
      icon: Icons.touch_app,
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
        ),
        Category(
          id: 'eyes',
          label: 'Eyes',
          icon: Icons.visibility,
        ),
        Category(
          id: 'optic_nerve',
          label: 'Optic Nerve',
          icon: Icons.visibility,
        ),
        Category(
          id: 'pecten_oculi',
          label: 'Pecten Oculi',
          icon: Icons.visibility,
        ),
      ];
    } else {
      // Common for horse, dog, and cat
      visionSubcategories = [
        Category(
          id: 'accessory_system',
          label: 'Accessory System',
          icon: Icons.visibility_off,
        ),
        Category(
          id: 'system_structures',
          label: 'System Structures',
          icon: Icons.visibility,
        ),
      ];
    }
    categories.add(Category(
      id: 'vision',
      label: 'Vision',
      icon: Icons.visibility,
      subcategories: visionSubcategories,
    ));

    return categories;
  }
}
