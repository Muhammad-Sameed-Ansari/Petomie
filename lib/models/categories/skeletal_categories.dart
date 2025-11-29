import 'package:flutter/material.dart';
import '../category.dart';

class SkeletalCategories {
  /// Get skeletal system categories for a specific animal
  static List<Category> getSkeletalSystemCategoriesForAnimal(String animalId) {
    String animal = animalId.toLowerCase();
    
    if (animal == 'horse') {
      return _getHorseSkeletalCategories();
    } else if (animal == 'dog') {
      return _getDogSkeletalCategories();
    } else if (animal == 'cat') {
      return _getCatSkeletalCategories();
    } else if (animal == 'bird') {
      return _getBirdSkeletalCategories();
    }
    
    return _getDefaultSkeletalCategories();
  }

  // Horse skeletal system categories based on actual folder structure
  static List<Category> _getHorseSkeletalCategories() {
    return [
      // Skull
      Category(
        id: 'skull',
        label: 'Skull',
        icon: Icons.psychology,
        imagePath: 'assets/images/skeleton/skull_horse.webp',
        subcategories: [
          Category(
            id: 'cranial_bones',
            label: 'Cranial Bones',
            icon: Icons.psychology,
            imagePath: 'assets/images/skeleton/skull_horse.webp',
            subcategories: [
              Category(
                id: 'ethmoid', 
                label: 'Ethmoid', 
                icon: Icons.psychology,
                imagePath: 'assets/images/skeleton/skull_horse.webp',
              ),
              Category(
                id: 'frontal', 
                label: 'Frontal', 
                icon: Icons.psychology,
                imagePath: 'assets/images/skeleton/skull_horse.webp',
              ),
              Category(
                id: 'occipital', 
                label: 'Occipital', 
                icon: Icons.psychology,
                imagePath: 'assets/images/skeleton/skull_horse.webp',
              ),
              Category(
                id: 'parietal', 
                label: 'Parietal', 
                icon: Icons.psychology,
                imagePath: 'assets/images/skeleton/skull_horse.webp',
              ),
              Category(
                id: 'sphenoid', 
                label: 'Sphenoid', 
                icon: Icons.psychology,
                imagePath: 'assets/images/skeleton/skull_horse.webp',
              ),
              Category(
                id: 'temporal', 
                label: 'Temporal', 
                icon: Icons.psychology,
                imagePath: 'assets/images/skeleton/skull_horse.webp',
              ),
            ],
          ),
          Category(
            id: 'facial_bones',
            label: 'Facial Bones',
            icon: Icons.face,
            imagePath: 'assets/images/skeleton/skull_horse.webp',
            subcategories: [
              Category(
                id: 'incisive', 
                label: 'Incisive', 
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_horse.webp',
              ),
              Category(
                id: 'lacrimal', 
                label: 'Lacrimal', 
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_horse.webp',
              ),
              Category(
                id: 'maxilla', 
                label: 'Maxilla', 
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_horse.webp',
              ),
              Category(
                id: 'nasal', 
                label: 'Nasal', 
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_horse.webp',
              ),
              Category(
                id: 'palatine', 
                label: 'Palatine', 
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_horse.webp',
              ),
              Category(
                id: 'vomer', 
                label: 'Vomer', 
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_horse.webp',
              ),
              Category(
                id: 'zygomatic', 
                label: 'Zygomatic', 
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_horse.webp',
              ),
            ],
          ),
          Category(
            id: 'accessory_bones',
            label: 'Accessory Bones',
            icon: Icons.architecture,
            imagePath: 'assets/images/skeleton/skull_horse.webp',
            subcategories: [
              Category(
                id: 'auditory_ossicles', 
                label: 'Auditory Ossicles', 
                icon: Icons.hearing,
                imagePath: 'assets/images/skeleton/skull_horse.webp',
              ),
              Category(
                id: 'hyoid_apparatus', 
                label: 'Hyoid Apparatus', 
                icon: Icons.straighten,
                imagePath: 'assets/images/skeleton/skull_horse.webp',
              ),
              Category(
                id: 'mandible', 
                label: 'Mandible', 
                icon: Icons.architecture,
                imagePath: 'assets/images/skeleton/skull_horse.webp',
              ),
            ],
          ),
        ],
      ),
      // Spine
      Category(
        id: 'spine',
        label: 'Spine',
        icon: Icons.view_column,
        subcategories: [
          Category(
            id: 'cervical_vertebrae',
            label: 'Cervical Vertebrae',
            icon: Icons.view_column,
            subcategories: [
              Category(id: 'c1', label: 'C1', icon: Icons.view_column),
              Category(id: 'c2', label: 'C2', icon: Icons.view_column),
              Category(id: 'c3', label: 'C3', icon: Icons.view_column),
              Category(id: 'c4', label: 'C4', icon: Icons.view_column),
              Category(id: 'c5', label: 'C5', icon: Icons.view_column),
              Category(id: 'c6', label: 'C6', icon: Icons.view_column),
              Category(id: 'c7', label: 'C7', icon: Icons.view_column),
            ],
          ),
          Category(
            id: 'thoracic_vertebrae',
            label: 'Thoracic Vertebrae',
            icon: Icons.view_column,
            subcategories: [
              Category(id: 't1', label: 'T1', icon: Icons.view_column),
              Category(id: 't2', label: 'T2', icon: Icons.view_column),
              Category(id: 't3', label: 'T3', icon: Icons.view_column),
              Category(id: 't4', label: 'T4', icon: Icons.view_column),
              Category(id: 't5', label: 'T5', icon: Icons.view_column),
              Category(id: 't6', label: 'T6', icon: Icons.view_column),
              Category(id: 't7', label: 'T7', icon: Icons.view_column),
              Category(id: 't8', label: 'T8', icon: Icons.view_column),
              Category(id: 't9', label: 'T9', icon: Icons.view_column),
              Category(id: 't10', label: 'T10', icon: Icons.view_column),
              Category(id: 't11', label: 'T11', icon: Icons.view_column),
              Category(id: 't12', label: 'T12', icon: Icons.view_column),
              Category(id: 't13', label: 'T13', icon: Icons.view_column),
              Category(id: 't14', label: 'T14', icon: Icons.view_column),
              Category(id: 't15', label: 'T15', icon: Icons.view_column),
              Category(id: 't16', label: 'T16', icon: Icons.view_column),
              Category(id: 't17', label: 'T17', icon: Icons.view_column),
              Category(id: 't18', label: 'T18', icon: Icons.view_column),
            ],
          ),
          Category(
            id: 'lumber_vertebrae',
            label: 'Lumber Vertebrae',
            icon: Icons.view_column,
            subcategories: [
              Category(id: 'l1', label: 'L1', icon: Icons.view_column),
              Category(id: 'l2', label: 'L2', icon: Icons.view_column),
              Category(id: 'l3', label: 'L3', icon: Icons.view_column),
              Category(id: 'l4', label: 'L4', icon: Icons.view_column),
              Category(id: 'l5', label: 'L5', icon: Icons.view_column),
              Category(id: 'l6', label: 'L6', icon: Icons.view_column),
            ],
          ),
          Category(
            id: 'sacral_vertebrae',
            label: 'Sacral Vertebrae',
            icon: Icons.view_column,
            subcategories: [
              Category(id: 's1', label: 'S1', icon: Icons.view_column),
              Category(id: 's2', label: 'S2', icon: Icons.view_column),
              Category(id: 's3', label: 'S3', icon: Icons.view_column),
              Category(id: 's4', label: 'S4', icon: Icons.view_column),
              Category(id: 's5', label: 'S5', icon: Icons.view_column),
            ],
          ),
          Category(
            id: 'caudal_vertebrae',
            label: 'Caudal Vertebrae',
            icon: Icons.view_column,
            subcategories: [
              Category(id: 'co1', label: 'Co1', icon: Icons.view_column),
              Category(id: 'co2', label: 'Co2', icon: Icons.view_column),
              Category(id: 'co3', label: 'Co3', icon: Icons.view_column),
              Category(id: 'co4', label: 'Co4', icon: Icons.view_column),
              Category(id: 'co5', label: 'Co5', icon: Icons.view_column),
              Category(id: 'co6', label: 'Co6', icon: Icons.view_column),
              Category(id: 'co7', label: 'Co7', icon: Icons.view_column),
              Category(id: 'co8', label: 'Co8', icon: Icons.view_column),
              Category(id: 'co9', label: 'Co9', icon: Icons.view_column),
              Category(id: 'co10', label: 'Co10', icon: Icons.view_column),
              Category(id: 'co11', label: 'Co11', icon: Icons.view_column),
              Category(id: 'co12', label: 'Co12', icon: Icons.view_column),
              Category(id: 'co13', label: 'Co13', icon: Icons.view_column),
              Category(id: 'co14', label: 'Co14', icon: Icons.view_column),
              Category(id: 'co15', label: 'Co15', icon: Icons.view_column),
              Category(id: 'co16', label: 'Co16', icon: Icons.view_column),
              Category(id: 'co17', label: 'Co17', icon: Icons.view_column),
              Category(id: 'co18', label: 'Co18', icon: Icons.view_column),
              Category(id: 'co19', label: 'Co19', icon: Icons.view_column),
              Category(id: 'co20', label: 'Co20', icon: Icons.view_column),
              Category(id: 'co21', label: 'Co21', icon: Icons.view_column),
            ],
          ),
          Category(
            id: 'discs',
            label: 'Discs',
            icon: Icons.album,
            subcategories: [
              Category(id: 'cervical_intervertebral_discs', label: 'Cervical Intervertebral Discs', icon: Icons.album),
              Category(id: 'coccygeal_intervertebral_discs', label: 'Coccygeal Intervertebral Discs', icon: Icons.album),
              Category(id: 'lumbar_intervertebral_discs', label: 'Lumbar Intervertebral Discs', icon: Icons.album),
              Category(id: 'sacral_intervertebral_discs', label: 'Sacral Intervertebral Discs', icon: Icons.album),
              Category(id: 'thoracic_intervertebral_discs', label: 'Thoracic Intervertebral Discs', icon: Icons.album),
            ],
          ),
        ],
      ),
      // Ribcage
      Category(
        id: 'ribcage',
        label: 'Ribcage',
        icon: Icons.border_all,
        subcategories: [
          Category(
            id: 'true_ribs',
            label: 'True Ribs',
            icon: Icons.border_all,
            subcategories: [
              Category(id: 'rib_1', label: 'Rib 1', icon: Icons.border_all),
              Category(id: 'rib_2', label: 'Rib 2', icon: Icons.border_all),
              Category(id: 'rib_3', label: 'Rib 3', icon: Icons.border_all),
              Category(id: 'rib_4', label: 'Rib 4', icon: Icons.border_all),
              Category(id: 'rib_5', label: 'Rib 5', icon: Icons.border_all),
              Category(id: 'rib_6', label: 'Rib 6', icon: Icons.border_all),
              Category(id: 'rib_7', label: 'Rib 7', icon: Icons.border_all),
              Category(id: 'rib_8', label: 'Rib 8', icon: Icons.border_all),
            ],
          ),
          Category(
            id: 'false_ribs',
            label: 'False Ribs',
            icon: Icons.border_all,
            subcategories: [
              Category(id: 'rib_9', label: 'Rib 9', icon: Icons.border_all),
              Category(id: 'rib_10', label: 'Rib 10', icon: Icons.border_all),
              Category(id: 'rib_11', label: 'Rib 11', icon: Icons.border_all),
              Category(id: 'rib_12', label: 'Rib 12', icon: Icons.border_all),
              Category(id: 'rib_13', label: 'Rib 13', icon: Icons.border_all),
            ],
          ),
          Category(
            id: 'floating_ribs',
            label: 'Floating Ribs',
            icon: Icons.border_all,
            subcategories: [
              Category(id: 'rib_14', label: 'Rib 14', icon: Icons.border_all),
              Category(id: 'rib_15', label: 'Rib 15', icon: Icons.border_all),
            ],
          ),
          Category(id: 'costal_cartilage', label: 'Costal Cartilage', icon: Icons.layers),
          Category(id: 'sternum', label: 'Sternum', icon: Icons.straighten),
          Category(id: 'xiphoid_cartilage', label: 'Xiphoid Cartilage', icon: Icons.layers),
        ],
      ),
      // Forelimb
      Category(
        id: 'forelimb',
        label: 'Forelimb',
        icon: Icons.accessibility,
        subcategories: [
          Category(id: 'scapula', label: 'Scapula', icon: Icons.accessibility),
          Category(id: 'humerus', label: 'Humerus', icon: Icons.accessibility),
          Category(
            id: 'antebrachium',
            label: 'Antebrachium',
            icon: Icons.grid_view,
            subcategories: [
              Category(id: 'radius', label: 'Radius', icon: Icons.accessibility),
              Category(id: 'ulna', label: 'Ulna', icon: Icons.accessibility),
            ],
          ),
          Category(
            id: 'carpus',
            label: 'Carpus',
            icon: Icons.grid_view,
            subcategories: [
              Category(id: 'distal_tarsals', label: 'Distal Tarsals', icon: Icons.accessibility),
              Category(id: 'proximal_tarsals', label: 'Proximal Tarsals', icon: Icons.accessibility),
            ],
          ),
          Category(
            id: 'manus',
            label: 'Manus',
            icon: Icons.pan_tool,
            subcategories: [
              Category(id: 'metacarpals', label: 'Metacarpals', icon: Icons.accessibility),
              Category(id: 'phalanges', label: 'Phalanges', icon: Icons.accessibility),
              Category(id: 'sesamoids', label: 'Sesamoids', icon: Icons.accessibility),
            ],
          ),
        ],
      ),
      // Hindlimb
      Category(
        id: 'hindlimb',
        label: 'Hindlimb',
        icon: Icons.grid_view,
        subcategories: [
          Category(id: 'pelvis', label: 'Pelvis', icon: Icons.accessibility),
          Category(
            id: 'thigh',
            label: 'Thigh',
            icon: Icons.straighten,
            subcategories: [
              Category(id: 'femur', label: 'Femur', icon: Icons.accessibility),
              Category(id: 'patella', label: 'Patella', icon: Icons.accessibility),
            ],
          ),
          Category(
            id: 'leg',
            label: 'Leg',
            icon: Icons.straighten,
            subcategories: [
              Category(id: 'fibula', label: 'Fibula', icon: Icons.accessibility),
              Category(id: 'tibia', label: 'Tibia', icon: Icons.accessibility),
            ],
          ),
          Category(
            id: 'hock',
            label: 'Hock',
            icon: Icons.grid_view,
            subcategories: [
              Category(id: 'calcaneus', label: 'Calcaneus', icon: Icons.accessibility),
              Category(id: 'central_tarsal', label: 'Central Tarsal', icon: Icons.accessibility),
              Category(id: 'talus', label: 'Talus', icon: Icons.accessibility),
              Category(id: 'tarsals', label: 'Tarsals', icon: Icons.accessibility),
            ],
          ),
          Category(
            id: 'hindhoof',
            label: 'Hindhoof',
            icon: Icons.pan_tool,
            subcategories: [
              Category(id: 'metatarsals_i_v', label: 'Metatarsals I V', icon: Icons.accessibility),
              Category(id: 'phalanges', label: 'Phalanges', icon: Icons.accessibility),
              Category(id: 'sesamoids', label: 'Sesamoids', icon: Icons.accessibility),
            ],
          ),
        ],
      ),
      // Dentition
      Category(
        id: 'dentition',
        label: 'Dentition',
        icon: Icons.emoji_food_beverage,
        imagePath: 'assets/images/horse//skeleton/dentition.webp',
        subcategories: [
          Category(
            id: 'upper',
            label: 'Upper',
            icon: Icons.star,
            imagePath: 'assets/images/horse/skeleton/dentition/upper.webp',
            subcategories: [
              Category(
                id: 'upper_left',
                label: 'Upper Left',
                icon: Icons.star,
                imagePath: 'assets/images/horse/skeleton/dentition/upper/upper_left.webp',
                subcategories: [
                  Category(id: 'canine', label: 'Canine', icon: Icons.star),
                  Category(id: 'incisor_1', label: 'Incisor 1', icon: Icons.star),
                  Category(id: 'incisor_2', label: 'Incisor 2', icon: Icons.star),
                  Category(id: 'incisor_3', label: 'Incisor 3', icon: Icons.star),
                  Category(id: 'molar_1', label: 'Molar 1', icon: Icons.star),
                  Category(id: 'molar_2', label: 'Molar 2', icon: Icons.star),
                  Category(id: 'molar_3', label: 'Molar 3', icon: Icons.star),
                  Category(id: 'premolar_1', label: 'Premolar 1', icon: Icons.star),
                  Category(id: 'premolar_2', label: 'Premolar 2', icon: Icons.star),
                  Category(id: 'premolar_3', label: 'Premolar 3', icon: Icons.star),
                  Category(id: 'premolar_4', label: 'Premolar 4', icon: Icons.star),
                ],
              ),
              Category(
                id: 'upper_right',
                label: 'Upper Right',
                icon: Icons.star,
                imagePath: 'assets/images/horse/skeleton/dentition/upper/upper_right.webp',
                subcategories: [
                  Category(id: 'canine', label: 'Canine', icon: Icons.star),
                  Category(id: 'incisor_1', label: 'Incisor 1', icon: Icons.star),
                  Category(id: 'incisor_2', label: 'Incisor 2', icon: Icons.star),
                  Category(id: 'incisor_3', label: 'Incisor 3', icon: Icons.star),
                  Category(id: 'molar_1', label: 'Molar 1', icon: Icons.star),
                  Category(id: 'molar_2', label: 'Molar 2', icon: Icons.star),
                  Category(id: 'molar_3', label: 'Molar 3', icon: Icons.star),
                  Category(id: 'premolar_1', label: 'Premolar 1', icon: Icons.star),
                  Category(id: 'premolar_2', label: 'Premolar 2', icon: Icons.star),
                  Category(id: 'premolar_3', label: 'Premolar 3', icon: Icons.star),
                  Category(id: 'premolar_4', label: 'Premolar 4', icon: Icons.star),
                ],
              ),
            ],
          ),
          Category(
            id: 'lower',
            label: 'Lower',
            icon: Icons.star,
            imagePath: 'assets/images/horse/skeleton/dentition/lower.webp',
            subcategories: [
              Category(
                id: 'lower_left',
                label: 'Lower Left',
                icon: Icons.star,
                imagePath: 'assets/images/horse/skeleton/dentition/lower/lower_left.webp',
                subcategories: [
                  Category(id: 'canine', label: 'Canine', icon: Icons.star),
                  Category(id: 'incisor_1', label: 'Incisor 1', icon: Icons.star),
                  Category(id: 'incisor_2', label: 'Incisor 2', icon: Icons.star),
                  Category(id: 'incisor_3', label: 'Incisor 3', icon: Icons.star),
                  Category(id: 'molar_1', label: 'Molar 1', icon: Icons.star),
                  Category(id: 'molar_2', label: 'Molar 2', icon: Icons.star),
                  Category(id: 'molar_3', label: 'Molar 3', icon: Icons.star),
                  Category(id: 'premolar_1', label: 'Premolar 1', icon: Icons.star),
                  Category(id: 'premolar_2', label: 'Premolar 2', icon: Icons.star),
                  Category(id: 'premolar_3', label: 'Premolar 3', icon: Icons.star),
                  Category(id: 'premolar_4', label: 'Premolar 4', icon: Icons.star),
                ],
              ),
              Category(
                id: 'lower_right',
                label: 'Lower Right',
                icon: Icons.star,
                imagePath: 'assets/images/horse/skeleton/dentition/lower/lower_right.webp',
                subcategories: [
                  Category(id: 'canine', label: 'Canine', icon: Icons.star),
                  Category(id: 'incisor_1', label: 'Incisor 1', icon: Icons.star),
                  Category(id: 'incisor_2', label: 'Incisor 2', icon: Icons.star),
                  Category(id: 'incisor_3', label: 'Incisor 3', icon: Icons.star),
                  Category(id: 'molar_1', label: 'Molar 1', icon: Icons.star),
                  Category(id: 'molar_2', label: 'Molar 2', icon: Icons.star),
                  Category(id: 'molar_3', label: 'Molar 3', icon: Icons.star),
                  Category(id: 'premolar_1', label: 'Premolar 1', icon: Icons.star),
                  Category(id: 'premolar_2', label: 'Premolar 2', icon: Icons.star),
                  Category(id: 'premolar_3', label: 'Premolar 3', icon: Icons.star),
                  Category(id: 'premolar_4', label: 'Premolar 4', icon: Icons.star),
                ],
              ),
            ],
          ),
        ],
      ),
    ];
  }

  // Dog skeletal system categories based on actual folder structure
  static List<Category> _getDogSkeletalCategories() {
    return [
      // Skull
      Category(
        id: 'skull',
        label: 'Skull',
        icon: Icons.psychology,
        imagePath: 'assets/images/skeleton/skull_dog.webp',
        subcategories: [
          Category(
            id: 'cranial_bones',
            label: 'Cranial Bones',
            icon: Icons.psychology,
            imagePath: 'assets/images/skeleton/skull_dog.webp',
            subcategories: [
              Category(
                id: 'ethmoid',
                label: 'Ethmoid',
                icon: Icons.psychology,
                imagePath: 'assets/images/skeleton/skull_dog.webp',
              ),
              Category(
                id: 'frontal',
                label: 'Frontal',
                icon: Icons.psychology,
                imagePath: 'assets/images/skeleton/skull_dog.webp',
              ),
              Category(
                id: 'occipital',
                label: 'Occipital',
                icon: Icons.psychology,
                imagePath: 'assets/images/skeleton/skull_dog.webp',
              ),
              Category(
                id: 'parietal',
                label: 'Parietal',
                icon: Icons.psychology,
                imagePath: 'assets/images/skeleton/skull_dog.webp',
              ),
              Category(
                id: 'sphenoid',
                label: 'Sphenoid',
                icon: Icons.psychology,
                imagePath: 'assets/images/skeleton/skull_dog.webp',
              ),
              Category(
                id: 'temporal',
                label: 'Temporal',
                icon: Icons.psychology,
                imagePath: 'assets/images/skeleton/skull_dog.webp',
              ),
            ],
          ),
          Category(
            id: 'facial_bones',
            label: 'Facial Bones',
            icon: Icons.face,
            imagePath: 'assets/images/skeleton/skull_dog.webp',
            subcategories: [
              Category(
                id: 'incisive', 
                label: 'Incisive', 
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_dog.webp',
              ),
              Category(
                id: 'lacrimal', 
                label: 'Lacrimal', 
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_dog.webp',
              ),
              Category(
                id: 'maxilla', 
                label: 'Maxilla', 
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_dog.webp',
              ),
              Category(
                id: 'nasal', 
                label: 'Nasal', 
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_dog.webp',
              ),
              Category(
                id: 'palatine', 
                label: 'Palatine', 
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_dog.webp',
              ),
              Category(
                id: 'vomer', 
                label: 'Vomer', 
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_dog.webp',
              ),
              Category(
                id: 'zygomatic', 
                label: 'Zygomatic', 
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_dog.webp',
              ),
            ],
          ),
          Category(
            id: 'accessory_bones',
            label: 'Accessory Bones',
            icon: Icons.architecture,
            imagePath: 'assets/images/skeleton/skull_dog.webp',
            subcategories: [
              Category(
                id: 'hyoid', 
                label: 'Hyoid', 
                icon: Icons.straighten,
                imagePath: 'assets/images/skeleton/skull_dog.webp',
              ),
              Category(
                id: 'mandible', 
                label: 'Mandible', 
                icon: Icons.architecture,
                imagePath: 'assets/images/skeleton/skull_dog.webp',
              ),
              Category(
                id: 'pterygoid', 
                label: 'Pterygoid', 
                icon: Icons.architecture,
                imagePath: 'assets/images/skeleton/skull_dog.webp',
              ),
              Category(
                id: 'turbinate', 
                label: 'Turbinate', 
                icon: Icons.architecture,
                imagePath: 'assets/images/skeleton/skull_dog.webp',
              ),
            ],
          ),
        ],
      ),
      // Spine
      Category(
        id: 'spine',
        label: 'Spine',
        icon: Icons.view_column,
        subcategories: [
          Category(
            id: 'cervical_vertebrae',
            label: 'Cervical Vertebrae',
            icon: Icons.view_column,
            subcategories: [
              Category(id: 'c1', label: 'C1', icon: Icons.view_column),
              Category(id: 'c2', label: 'C2', icon: Icons.view_column),
              Category(id: 'c3', label: 'C3', icon: Icons.view_column),
              Category(id: 'c4', label: 'C4', icon: Icons.view_column),
              Category(id: 'c5', label: 'C5', icon: Icons.view_column),
              Category(id: 'c6', label: 'C6', icon: Icons.view_column),
              Category(id: 'c7', label: 'C7', icon: Icons.view_column),
            ],
          ),
          Category(
            id: 'thoracic_vertebrae',
            label: 'Thoracic Vertebrae',
            icon: Icons.view_column,
            subcategories: [
              Category(id: 't1', label: 'T1', icon: Icons.view_column),
              Category(id: 't2', label: 'T2', icon: Icons.view_column),
              Category(id: 't3', label: 'T3', icon: Icons.view_column),
              Category(id: 't4', label: 'T4', icon: Icons.view_column),
              Category(id: 't5', label: 'T5', icon: Icons.view_column),
              Category(id: 't6', label: 'T6', icon: Icons.view_column),
              Category(id: 't7', label: 'T7', icon: Icons.view_column),
              Category(id: 't8', label: 'T8', icon: Icons.view_column),
              Category(id: 't9', label: 'T9', icon: Icons.view_column),
              Category(id: 't10', label: 'T10', icon: Icons.view_column),
              Category(id: 't11', label: 'T11', icon: Icons.view_column),
              Category(id: 't12', label: 'T12', icon: Icons.view_column),
              Category(id: 't13', label: 'T13', icon: Icons.view_column),
            ],
          ),
          Category(
            id: 'lumber_vertebrae',
            label: 'Lumber Vertebrae',
            icon: Icons.view_column,
            subcategories: [
              Category(id: 'l1', label: 'L1', icon: Icons.view_column),
              Category(id: 'l2', label: 'L2', icon: Icons.view_column),
              Category(id: 'l3', label: 'L3', icon: Icons.view_column),
              Category(id: 'l4', label: 'L4', icon: Icons.view_column),
              Category(id: 'l5', label: 'L5', icon: Icons.view_column),
              Category(id: 'l6', label: 'L6', icon: Icons.view_column),
              Category(id: 'l7', label: 'L7', icon: Icons.view_column),
            ],
          ),
          Category(
            id: 'sacral_vertebrae',
            label: 'Sacral Vertebrae',
            icon: Icons.view_column,
            subcategories: [
              Category(id: 's1', label: 'S1', icon: Icons.view_column),
              Category(id: 's2', label: 'S2', icon: Icons.view_column),
              Category(id: 's3', label: 'S3', icon: Icons.view_column),
            ],
          ),
          Category(
            id: 'caudal_vertebrae',
            label: 'Caudal Vertebrae',
            icon: Icons.view_column,
            subcategories: [
              Category(id: 'co1', label: 'Co1', icon: Icons.view_column),
              Category(id: 'co2', label: 'Co2', icon: Icons.view_column),
              Category(id: 'co3', label: 'Co3', icon: Icons.view_column),
              Category(id: 'co4', label: 'Co4', icon: Icons.view_column),
              Category(id: 'co5', label: 'Co5', icon: Icons.view_column),
              Category(id: 'co6', label: 'Co6', icon: Icons.view_column),
              Category(id: 'co7', label: 'Co7', icon: Icons.view_column),
              Category(id: 'co8', label: 'Co8', icon: Icons.view_column),
              Category(id: 'co9', label: 'Co9', icon: Icons.view_column),
              Category(id: 'co10', label: 'Co10', icon: Icons.view_column),
              Category(id: 'co11', label: 'Co11', icon: Icons.view_column),
              Category(id: 'co12', label: 'Co12', icon: Icons.view_column),
              Category(id: 'co13', label: 'Co13', icon: Icons.view_column),
              Category(id: 'co14', label: 'Co14', icon: Icons.view_column),
              Category(id: 'co15', label: 'Co15', icon: Icons.view_column),
              Category(id: 'co16', label: 'Co16', icon: Icons.view_column),
              Category(id: 'co17', label: 'Co17', icon: Icons.view_column),
              Category(id: 'co18', label: 'Co18', icon: Icons.view_column),
              Category(id: 'co19', label: 'Co19', icon: Icons.view_column),
              Category(id: 'co20', label: 'Co20', icon: Icons.view_column),
            ],
          ),
          Category(
            id: 'discs',
            label: 'Discs',
            icon: Icons.album,
            subcategories: [
              Category(id: 'cervical_intervertebral_discs', label: 'Cervical Intervertebral Discs', icon: Icons.album),
              Category(id: 'coccygeal_intervertebral_discs', label: 'Coccygeal Intervertebral Discs', icon: Icons.album),
              Category(id: 'lumbar_intervertebral_discs', label: 'Lumbar Intervertebral Discs', icon: Icons.album),
              Category(id: 'sacral_intervertebral_discs', label: 'Sacral Intervertebral Discs', icon: Icons.album),
              Category(id: 'thoracic_intervertebral_discs', label: 'Thoracic Intervertebral Discs', icon: Icons.album),
            ],
          ),
        ],
      ),
      // Ribcage
      Category(
        id: 'ribcage',
        label: 'Ribcage',
        icon: Icons.border_all,
        subcategories: [
          Category(
            id: 'true_ribs',
            label: 'True Ribs',
            icon: Icons.border_all,
            subcategories: [
              Category(id: 'rib_1', label: 'Rib 1', icon: Icons.border_all),
              Category(id: 'rib_2', label: 'Rib 2', icon: Icons.border_all),
              Category(id: 'rib_3', label: 'Rib 3', icon: Icons.border_all),
              Category(id: 'rib_4', label: 'Rib 4', icon: Icons.border_all),
              Category(id: 'rib_5', label: 'Rib 5', icon: Icons.border_all),
              Category(id: 'rib_6', label: 'Rib 6', icon: Icons.border_all),
              Category(id: 'rib_7', label: 'Rib 7', icon: Icons.border_all),
              Category(id: 'rib_8', label: 'Rib 8', icon: Icons.border_all),
            ],
          ),
          Category(
            id: 'false_ribs',
            label: 'False Ribs',
            icon: Icons.border_all,
            subcategories: [
              Category(id: 'rib_9', label: 'Rib 9', icon: Icons.border_all),
              Category(id: 'rib_10', label: 'Rib 10', icon: Icons.border_all),
              Category(id: 'rib_11', label: 'Rib 11', icon: Icons.border_all),
              Category(id: 'rib_12', label: 'Rib 12', icon: Icons.border_all),
              Category(id: 'rib_13', label: 'Rib 13', icon: Icons.border_all),
            ],
          ),
          Category(
            id: 'floating_ribs',
            label: 'Floating Ribs',
            icon: Icons.border_all,
            subcategories: [
              Category(id: 'rib_14', label: 'Rib 14', icon: Icons.border_all),
              Category(id: 'rib_15', label: 'Rib 15', icon: Icons.border_all),
            ],
          ),
          Category(id: 'costal_cartilage', label: 'Costal Cartilage', icon: Icons.layers),
          Category(id: 'intercostal_muscles', label: 'Intercostal Muscles', icon: Icons.fitness_center),
          Category(id: 'xiphoid_cartilage', label: 'Xiphoid Cartilage', icon: Icons.layers),
        ],
      ),
      // Scapula (standalone)
      Category(id: 'scapula', label: 'Scapula', icon: Icons.accessibility),
      // Forelimb
      Category(
        id: 'forelimb',
        label: 'Forelimb',
        icon: Icons.accessibility,
        subcategories: [
          Category(id: 'scapula', label: 'Scapula', icon: Icons.accessibility),
          Category(id: 'humerus', label: 'Humerus', icon: Icons.accessibility),
          Category(
            id: 'antebrachium',
            label: 'Antebrachium',
            icon: Icons.grid_view,
            subcategories: [
              Category(id: 'radius', label: 'Radius', icon: Icons.accessibility),
              Category(id: 'ulna', label: 'Ulna', icon: Icons.accessibility),
            ],
          ),
          Category(
            id: 'carpus',
            label: 'Carpus',
            icon: Icons.grid_view,
            subcategories: [
              Category(id: 'distal_row', label: 'Distal Row', icon: Icons.accessibility),
              Category(id: 'proximal_row', label: 'Proximal Row', icon: Icons.accessibility),
            ],
          ),
          Category(
            id: 'manus',
            label: 'Manus',
            icon: Icons.pan_tool,
            subcategories: [
              Category(id: 'metacarpals', label: 'Metacarpals', icon: Icons.accessibility),
              Category(id: 'phalanges', label: 'Phalanges', icon: Icons.accessibility),
              Category(id: 'sesamoids', label: 'Sesamoids', icon: Icons.accessibility),
            ],
          ),
        ],
      ),
      // Hindlimb
      Category(
        id: 'hindlimb',
        label: 'Hindlimb',
        icon: Icons.grid_view,
        subcategories: [
          Category(id: 'pelvis', label: 'Pelvis', icon: Icons.accessibility),
          Category(
            id: 'thigh',
            label: 'Thigh',
            icon: Icons.straighten,
            subcategories: [
              Category(id: 'femur', label: 'Femur', icon: Icons.accessibility),
              Category(id: 'patella', label: 'Patella', icon: Icons.accessibility),
            ],
          ),
          Category(
            id: 'leg',
            label: 'Leg',
            icon: Icons.straighten,
            subcategories: [
              Category(id: 'fibula', label: 'Fibula', icon: Icons.accessibility),
              Category(id: 'tibia', label: 'Tibia', icon: Icons.accessibility),
            ],
          ),
          Category(
            id: 'hock',
            label: 'Hock',
            icon: Icons.grid_view,
            subcategories: [
              Category(id: 'calcaneus', label: 'Calcaneus', icon: Icons.accessibility),
              Category(id: 'central_tarsal', label: 'Central Tarsal', icon: Icons.accessibility),
              Category(id: 'talus', label: 'Talus', icon: Icons.accessibility),
              Category(id: 'tarsals', label: 'Tarsals', icon: Icons.accessibility),
            ],
          ),
          Category(
            id: 'hindpaw',
            label: 'Hindpaw',
            icon: Icons.pan_tool,
            subcategories: [
              Category(id: 'metatarsals_i_v', label: 'Metatarsals I V', icon: Icons.accessibility),
              Category(id: 'phalanges', label: 'Phalanges', icon: Icons.accessibility),
              Category(id: 'sesamoids', label: 'Sesamoids', icon: Icons.accessibility),
            ],
          ),
        ],
      ),
      // Dentition
      Category(
        id: 'dentition',
        label: 'Dentition',
        icon: Icons.emoji_food_beverage,
        imagePath: 'assets/images/skeleton/dentition.webp',
        subcategories: [
          Category(
            id: 'upper',
            label: 'Upper',
            icon: Icons.star,
            imagePath: 'assets/images/skeleton/dentition/upper.webp',
            subcategories: [
              Category(
                id: 'upper_left',
                label: 'Upper Left',
                icon: Icons.star,
                imagePath: 'assets/images/skeleton/dentition/upper/upper_left.webp',
                subcategories: [
                  Category(id: 'canine', label: 'Canine', icon: Icons.star),
                  Category(id: 'incisor_1', label: 'Incisor 1', icon: Icons.star),
                  Category(id: 'incisor_2', label: 'Incisor 2', icon: Icons.star),
                  Category(id: 'incisor_3', label: 'Incisor 3', icon: Icons.star),
                  Category(id: 'molar_1', label: 'Molar 1', icon: Icons.star),
                  Category(id: 'molar_2', label: 'Molar 2', icon: Icons.star),
                  Category(id: 'premolar_1', label: 'Premolar 1', icon: Icons.star),
                  Category(id: 'premolar_2', label: 'Premolar 2', icon: Icons.star),
                  Category(id: 'premolar_3', label: 'Premolar 3', icon: Icons.star),
                  Category(id: 'premolar_4', label: 'Premolar 4', icon: Icons.star),
                ],
              ),
              Category(
                id: 'upper_right',
                label: 'Upper Right',
                icon: Icons.star,
                imagePath: 'assets/images/skeleton/dentition/upper/upper_right.webp',
                subcategories: [
                  Category(id: 'canine', label: 'Canine', icon: Icons.star),
                  Category(id: 'incisor_1', label: 'Incisor 1', icon: Icons.star),
                  Category(id: 'incisor_2', label: 'Incisor 2', icon: Icons.star),
                  Category(id: 'incisor_3', label: 'Incisor 3', icon: Icons.star),
                  Category(id: 'molar_1', label: 'Molar 1', icon: Icons.star),
                  Category(id: 'molar_2', label: 'Molar 2', icon: Icons.star),
                  Category(id: 'premolar_1', label: 'Premolar 1', icon: Icons.star),
                  Category(id: 'premolar_2', label: 'Premolar 2', icon: Icons.star),
                  Category(id: 'premolar_3', label: 'Premolar 3', icon: Icons.star),
                  Category(id: 'premolar_4', label: 'Premolar 4', icon: Icons.star),
                ],
              ),
            ],
          ),
          Category(
            id: 'lower',
            label: 'Lower',
            icon: Icons.star,
            imagePath: 'assets/images/skeleton/dentition/lower.webp',
            subcategories: [
              Category(
                id: 'lower_left',
                label: 'Lower Left',
                icon: Icons.star,
                imagePath: 'assets/images/skeleton/dentition/lower/lower_left.webp',
                subcategories: [
                  Category(id: 'canine', label: 'Canine', icon: Icons.star),
                  Category(id: 'incisor_1', label: 'Incisor 1', icon: Icons.star),
                  Category(id: 'incisor_2', label: 'Incisor 2', icon: Icons.star),
                  Category(id: 'incisor_3', label: 'Incisor 3', icon: Icons.star),
                  Category(id: 'molar_1', label: 'Molar 1', icon: Icons.star),
                  Category(id: 'molar_2', label: 'Molar 2', icon: Icons.star),
                  Category(id: 'premolar_1', label: 'Premolar 1', icon: Icons.star),
                  Category(id: 'premolar_2', label: 'Premolar 2', icon: Icons.star),
                  Category(id: 'premolar_3', label: 'Premolar 3', icon: Icons.star),
                  Category(id: 'premolar_4', label: 'Premolar 4', icon: Icons.star),
                ],
              ),
              Category(
                id: 'lower_right',
                label: 'Lower Right',
                icon: Icons.star,
                imagePath: 'assets/images/skeleton/dentition/lower/lower_right.webp',
                subcategories: [
                  Category(id: 'canine', label: 'Canine', icon: Icons.star),
                  Category(id: 'incisor_1', label: 'Incisor 1', icon: Icons.star),
                  Category(id: 'incisor_2', label: 'Incisor 2', icon: Icons.star),
                  Category(id: 'incisor_3', label: 'Incisor 3', icon: Icons.star),
                  Category(id: 'molar_1', label: 'Molar 1', icon: Icons.star),
                  Category(id: 'molar_2', label: 'Molar 2', icon: Icons.star),
                  Category(id: 'premolar_1', label: 'Premolar 1', icon: Icons.star),
                  Category(id: 'premolar_2', label: 'Premolar 2', icon: Icons.star),
                  Category(id: 'premolar_3', label: 'Premolar 3', icon: Icons.star),
                  Category(id: 'premolar_4', label: 'Premolar 4', icon: Icons.star),
                ],
              ),
            ],
          ),
        ],
      ),
    ];
  }

  // Cat skeletal system categories based on actual folder structure
  static List<Category> _getCatSkeletalCategories() {
    return [
      // Skull
      Category(
        id: 'skull',
        label: 'Skull',
        icon: Icons.psychology,
        imagePath: 'assets/images/skeleton/skull_cat.webp',
        subcategories: [
          Category(
            id: 'cranial_bones',
            label: 'Cranial Bones',
            icon: Icons.psychology,
            imagePath: 'assets/images/skeleton/skull_cat.webp',
            subcategories: [
              Category(
                id: 'ethmoid',
                label: 'Ethmoid',
                icon: Icons.psychology,
                imagePath: 'assets/images/skeleton/skull_cat.webp',
              ),
              Category(
                id: 'frontal',
                label: 'Frontal',
                icon: Icons.psychology,
                imagePath: 'assets/images/skeleton/skull_cat.webp',
              ),
              Category(
                id: 'occipital',
                label: 'Occipital',
                icon: Icons.psychology,
                imagePath: 'assets/images/skeleton/skull_cat.webp',
              ),
              Category(
                id: 'parietal',
                label: 'Parietal',
                icon: Icons.psychology,
                imagePath: 'assets/images/skeleton/skull_cat.webp',
              ),
              Category(
                id: 'sphenoid',
                label: 'Sphenoid',
                icon: Icons.psychology,
                imagePath: 'assets/images/skeleton/skull_cat.webp',
              ),
              Category(
                id: 'temporal',
                label: 'Temporal',
                icon: Icons.psychology,
                imagePath: 'assets/images/skeleton/skull_cat.webp',
              ),
            ],
          ),
          Category(
            id: 'facial_bones',
            label: 'Facial Bones',
            icon: Icons.face,
            imagePath: 'assets/images/skeleton/skull_cat.webp',
            subcategories: [
              Category(
                id: 'incisive',
                label: 'Incisive',
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_cat.webp',
              ),
              Category(
                id: 'lacrimal',
                label: 'Lacrimal',
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_cat.webp',
              ),
              Category(
                id: 'maxilla',
                label: 'Maxilla',
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_cat.webp',
              ),
              Category(
                id: 'nasal',
                label: 'Nasal',
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_cat.webp',
              ),
              Category(
                id: 'palatine',
                label: 'Palatine',
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_cat.webp',
              ),
              Category(
                id: 'vomer',
                label: 'Vomer',
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_cat.webp',
              ),
              Category(
                id: 'zygomatic',
                label: 'Zygomatic',
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_cat.webp',
              ),
            ],
          ),
          Category(
            id: 'accessory_bones',
            label: 'Accessory Bones',
            icon: Icons.architecture,
            imagePath: 'assets/images/skeleton/skull_cat.webp',
            subcategories: [
              Category(
                id: 'hyoid', 
                label: 'Hyoid', 
                icon: Icons.straighten,
                imagePath: 'assets/images/skeleton/skull_cat.webp',
              ),
              Category(
                id: 'mandible',
                label: 'Mandible',
                icon: Icons.architecture,
                imagePath: 'assets/images/skeleton/skull_cat.webp',
              ),
              Category(
                id: 'pterygoid',
                label: 'Pterygoid',
                icon: Icons.architecture,
                imagePath: 'assets/images/skeleton/skull_cat.webp',
              ),
              Category(
                id: 'turbinate',
                label: 'Turbinate',
                icon: Icons.architecture,
                imagePath: 'assets/images/skeleton/skull_cat.webp',
              ),
            ],
          ),
        ],
      ),
      // Spine
      Category(
        id: 'spine',
        label: 'Spine',
        icon: Icons.view_column,
        subcategories: [
          Category(
            id: 'cervical_vertebrae',
            label: 'Cervical Vertebrae',
            icon: Icons.view_column,
            subcategories: [
              Category(id: 'c1', label: 'C1', icon: Icons.view_column),
              Category(id: 'c2', label: 'C2', icon: Icons.view_column),
              Category(id: 'c3', label: 'C3', icon: Icons.view_column),
              Category(id: 'c4', label: 'C4', icon: Icons.view_column),
              Category(id: 'c5', label: 'C5', icon: Icons.view_column),
              Category(id: 'c6', label: 'C6', icon: Icons.view_column),
              Category(id: 'c7', label: 'C7', icon: Icons.view_column),
            ],
          ),
          Category(
            id: 'thoracic_vertebrae',
            label: 'Thoracic Vertebrae',
            icon: Icons.view_column,
            subcategories: [
              Category(id: 't1', label: 'T1', icon: Icons.view_column),
              Category(id: 't2', label: 'T2', icon: Icons.view_column),
              Category(id: 't3', label: 'T3', icon: Icons.view_column),
              Category(id: 't4', label: 'T4', icon: Icons.view_column),
              Category(id: 't5', label: 'T5', icon: Icons.view_column),
              Category(id: 't6', label: 'T6', icon: Icons.view_column),
              Category(id: 't7', label: 'T7', icon: Icons.view_column),
              Category(id: 't8', label: 'T8', icon: Icons.view_column),
              Category(id: 't9', label: 'T9', icon: Icons.view_column),
              Category(id: 't10', label: 'T10', icon: Icons.view_column),
              Category(id: 't11', label: 'T11', icon: Icons.view_column),
              Category(id: 't12', label: 'T12', icon: Icons.view_column),
              Category(id: 't13', label: 'T13', icon: Icons.view_column),
            ],
          ),
          Category(
            id: 'lumber_vertebrae',
            label: 'Lumber Vertebrae',
            icon: Icons.view_column,
            subcategories: [
              Category(id: 'l1', label: 'L1', icon: Icons.view_column),
              Category(id: 'l2', label: 'L2', icon: Icons.view_column),
              Category(id: 'l3', label: 'L3', icon: Icons.view_column),
              Category(id: 'l4', label: 'L4', icon: Icons.view_column),
              Category(id: 'l5', label: 'L5', icon: Icons.view_column),
              Category(id: 'l6', label: 'L6', icon: Icons.view_column),
              Category(id: 'l7', label: 'L7', icon: Icons.view_column),
            ],
          ),
          Category(
            id: 'sacral_vertebrae',
            label: 'Sacral Vertebrae',
            icon: Icons.view_column,
            subcategories: [
              Category(id: 's1', label: 'S1', icon: Icons.view_column),
              Category(id: 's2', label: 'S2', icon: Icons.view_column),
              Category(id: 's3', label: 'S3', icon: Icons.view_column),
            ],
          ),
          Category(
            id: 'caudal_vertebrae',
            label: 'Caudal Vertebrae',
            icon: Icons.view_column,
            subcategories: [
              Category(id: 'co1', label: 'Co1', icon: Icons.view_column),
              Category(id: 'co2', label: 'Co2', icon: Icons.view_column),
              Category(id: 'co3', label: 'Co3', icon: Icons.view_column),
              Category(id: 'co4', label: 'Co4', icon: Icons.view_column),
              Category(id: 'co5', label: 'Co5', icon: Icons.view_column),
              Category(id: 'co6', label: 'Co6', icon: Icons.view_column),
              Category(id: 'co7', label: 'Co7', icon: Icons.view_column),
              Category(id: 'co8', label: 'Co8', icon: Icons.view_column),
              Category(id: 'co9', label: 'Co9', icon: Icons.view_column),
              Category(id: 'co10', label: 'Co10', icon: Icons.view_column),
              Category(id: 'co11', label: 'Co11', icon: Icons.view_column),
              Category(id: 'co12', label: 'Co12', icon: Icons.view_column),
              Category(id: 'co13', label: 'Co13', icon: Icons.view_column),
              Category(id: 'co14', label: 'Co14', icon: Icons.view_column),
              Category(id: 'co15', label: 'Co15', icon: Icons.view_column),
              Category(id: 'co16', label: 'Co16', icon: Icons.view_column),
              Category(id: 'co17', label: 'Co17', icon: Icons.view_column),
              Category(id: 'co18', label: 'Co18', icon: Icons.view_column),
            ],
          ),
          Category(
            id: 'discs',
            label: 'Discs',
            icon: Icons.album,
            subcategories: [
              Category(id: 'cervical_intervertebral', label: 'Cervical Intervertebral', icon: Icons.album),
              Category(id: 'coccygeal_intervertebral', label: 'Coccygeal Intervertebral', icon: Icons.album),
              Category(id: 'lumbar_intervertebral', label: 'Lumbar Intervertebral', icon: Icons.album),
              Category(id: 'sacral_intervertebral', label: 'Sacral Intervertebral', icon: Icons.album),
              Category(id: 'thoracic_intervertebral', label: 'Thoracic Intervertebral', icon: Icons.album),
            ],
          ),
        ],
      ),
      // Ribcage
      Category(
        id: 'ribcage',
        label: 'Ribcage',
        icon: Icons.border_all,
        subcategories: [
          Category(
            id: 'true_ribs',
            label: 'True Ribs',
            icon: Icons.border_all,
            subcategories: [
              Category(id: 'rib_1', label: 'Rib 1', icon: Icons.border_all),
              Category(id: 'rib_2', label: 'Rib 2', icon: Icons.border_all),
              Category(id: 'rib_3', label: 'Rib 3', icon: Icons.border_all),
              Category(id: 'rib_4', label: 'Rib 4', icon: Icons.border_all),
              Category(id: 'rib_5', label: 'Rib 5', icon: Icons.border_all),
              Category(id: 'rib_6', label: 'Rib 6', icon: Icons.border_all),
              Category(id: 'rib_7', label: 'Rib 7', icon: Icons.border_all),
              Category(id: 'rib_8', label: 'Rib 8', icon: Icons.border_all),
              Category(id: 'rib_9', label: 'Rib 9', icon: Icons.border_all),
            ],
          ),
          Category(
            id: 'false_ribs',
            label: 'False Ribs',
            icon: Icons.border_all,
            subcategories: [
              Category(id: 'rib_10', label: 'Rib 10', icon: Icons.border_all),
              Category(id: 'rib_11', label: 'Rib 11', icon: Icons.border_all),
              Category(id: 'rib_12', label: 'Rib 12', icon: Icons.border_all),
            ],
          ),
          Category(
            id: 'floating_ribs',
            label: 'Floating Ribs',
            icon: Icons.border_all,
            subcategories: [
              Category(id: 'rib_13', label: 'Rib 13', icon: Icons.border_all),
            ],
          ),
          Category(id: 'costal_cartilage', label: 'Costal Cartilage', icon: Icons.layers),
          Category(id: 'intercostal_muscles', label: 'Intercostal Muscles', icon: Icons.fitness_center),
          Category(id: 'xiphoid_cartilage', label: 'Xiphoid Cartilage', icon: Icons.layers),
        ],
      ),
      // Scapula (standalone)
      Category(id: 'scapula', label: 'Scapula', icon: Icons.accessibility),
      // Forelimb
      Category(
        id: 'forelimb',
        label: 'Forelimb',
        icon: Icons.accessibility,
        subcategories: [
          Category(id: 'scapula', label: 'Scapula', icon: Icons.accessibility),
          Category(id: 'humerus', label: 'Humerus', icon: Icons.accessibility),
          Category(
            id: 'antebrachium',
            label: 'Antebrachium',
            icon: Icons.grid_view,
            subcategories: [
              Category(id: 'radius', label: 'Radius', icon: Icons.accessibility),
              Category(id: 'ulna', label: 'Ulna', icon: Icons.accessibility),
            ],
          ),
          Category(
            id: 'carpus',
            label: 'Carpus',
            icon: Icons.grid_view,
            subcategories: [
              Category(id: 'distal_row', label: 'Distal Row', icon: Icons.accessibility),
              Category(id: 'proximal_row', label: 'Proximal Row', icon: Icons.accessibility),
            ],
          ),
          Category(
            id: 'manus',
            label: 'Manus',
            icon: Icons.pan_tool,
            subcategories: [
              Category(id: 'metacarpals', label: 'Metacarpals', icon: Icons.accessibility),
              Category(id: 'phalanges', label: 'Phalanges', icon: Icons.accessibility),
              Category(id: 'sesamoids', label: 'Sesamoids', icon: Icons.accessibility),
            ],
          ),
        ],
      ),
      // Hindlimb
      Category(
        id: 'hindlimb',
        label: 'Hindlimb',
        icon: Icons.grid_view,
        subcategories: [
          Category(id: 'pelvis', label: 'Pelvis', icon: Icons.accessibility),
          Category(
            id: 'thigh',
            label: 'Thigh',
            icon: Icons.straighten,
            subcategories: [
              Category(id: 'femur', label: 'Femur', icon: Icons.accessibility),
              Category(id: 'patella', label: 'Patella', icon: Icons.accessibility),
            ],
          ),
          Category(
            id: 'leg',
            label: 'Leg',
            icon: Icons.straighten,
            subcategories: [
              Category(id: 'fibula', label: 'Fibula', icon: Icons.accessibility),
              Category(id: 'tibia', label: 'Tibia', icon: Icons.accessibility),
            ],
          ),
          Category(
            id: 'hock',
            label: 'Hock',
            icon: Icons.grid_view,
            subcategories: [
              Category(id: 'calcaneus', label: 'Calcaneus', icon: Icons.accessibility),
              Category(id: 'central_tarsal', label: 'Central Tarsal', icon: Icons.accessibility),
              Category(id: 'talus', label: 'Talus', icon: Icons.accessibility),
              Category(id: 'tarsals', label: 'Tarsals', icon: Icons.accessibility),
            ],
          ),
          Category(
            id: 'hindpaw',
            label: 'Hindpaw',
            icon: Icons.pan_tool,
            subcategories: [
              Category(id: 'metatarsals', label: 'Metatarsals', icon: Icons.accessibility),
              Category(id: 'phalanges', label: 'Phalanges', icon: Icons.accessibility),
              Category(id: 'sesamoids', label: 'Sesamoids', icon: Icons.accessibility),
            ],
          ),
        ],
      ),
      // Dentition
      Category(
        id: 'dentition',
        label: 'Dentition',
        icon: Icons.emoji_food_beverage,
        imagePath: 'assets/images/skeleton/dentition.webp',
        subcategories: [
          Category(
            id: 'upper',
            label: 'Upper',
            icon: Icons.star,
            imagePath: 'assets/images/skeleton/dentition/upper.webp',
            subcategories: [
              Category(
                id: 'upper_left',
                label: 'Upper Left',
                icon: Icons.star,
                imagePath: 'assets/images/skeleton/dentition/upper/upper_left.webp',
                subcategories: [
                  Category(id: 'canine', label: 'Canine', icon: Icons.star),
                  Category(id: 'incisor_1', label: 'Incisor 1', icon: Icons.star),
                  Category(id: 'incisor_2', label: 'Incisor 2', icon: Icons.star),
                  Category(id: 'incisor_3', label: 'Incisor 3', icon: Icons.star),
                  Category(id: 'molar_1', label: 'Molar 1', icon: Icons.star),
                  Category(id: 'premolar_2', label: 'Premolar 2', icon: Icons.star),
                  Category(id: 'premolar_3', label: 'Premolar 3', icon: Icons.star),
                  Category(id: 'premolar_4', label: 'Premolar 4', icon: Icons.star),
                ],
              ),
              Category(
                id: 'upper_right',
                label: 'Upper Right',
                icon: Icons.star,
                imagePath: 'assets/images/skeleton/dentition/upper/upper_right.webp',
                subcategories: [
                  Category(id: 'canine', label: 'Canine', icon: Icons.star),
                  Category(id: 'incisor_1', label: 'Incisor 1', icon: Icons.star),
                  Category(id: 'incisor_2', label: 'Incisor 2', icon: Icons.star),
                  Category(id: 'incisor_3', label: 'Incisor 3', icon: Icons.star),
                  Category(id: 'molar_1', label: 'Molar 1', icon: Icons.star),
                  Category(id: 'premolar_2', label: 'Premolar 2', icon: Icons.star),
                  Category(id: 'premolar_3', label: 'Premolar 3', icon: Icons.star),
                  Category(id: 'premolar_4', label: 'Premolar 4', icon: Icons.star),
                ],
              ),
            ],
          ),
          Category(
            id: 'lower',
            label: 'Lower',
            icon: Icons.star,
            imagePath: 'assets/images/skeleton/dentition/lower.webp',
            subcategories: [
              Category(
                id: 'lower_left',
                label: 'Lower Left',
                icon: Icons.star,
                imagePath: 'assets/images/skeleton/dentition/lower/lower_left.webp',
                subcategories: [
                  Category(id: 'canine', label: 'Canine', icon: Icons.star),
                  Category(id: 'incisor_1', label: 'Incisor 1', icon: Icons.star),
                  Category(id: 'incisor_2', label: 'Incisor 2', icon: Icons.star),
                  Category(id: 'incisor_3', label: 'Incisor 3', icon: Icons.star),
                  Category(id: 'molar_1', label: 'Molar 1', icon: Icons.star),
                  Category(id: 'premolar_3', label: 'Premolar 3', icon: Icons.star),
                  Category(id: 'premolar_4', label: 'Premolar 4', icon: Icons.star),
                ],
              ),
              Category(
                id: 'lower_right',
                label: 'Lower Right',
                icon: Icons.star,
                imagePath: 'assets/images/skeleton/dentition/lower/lower_right.webp',
                subcategories: [
                  Category(id: 'canine', label: 'Canine', icon: Icons.star),
                  Category(id: 'incisor_1', label: 'Incisor 1', icon: Icons.star),
                  Category(id: 'incisor_2', label: 'Incisor 2', icon: Icons.star),
                  Category(id: 'incisor_3', label: 'Incisor 3', icon: Icons.star),
                  Category(id: 'molar_1', label: 'Molar 1', icon: Icons.star),
                  Category(id: 'premolar_3', label: 'Premolar 3', icon: Icons.star),
                  Category(id: 'premolar_4', label: 'Premolar 4', icon: Icons.star),
                ],
              ),
            ],
          ),
        ],
      ),
    ];
  }

  // Bird skeletal system categories based on actual folder structure
  static List<Category> _getBirdSkeletalCategories() {
    return [
      // Skull
      Category(
        id: 'skull',
        label: 'Skull',
        icon: Icons.psychology,
        imagePath: 'assets/images/skeleton/skull_bird.webp',
        subcategories: [
          Category(
            id: 'cranial_bones',
            label: 'Cranial Bones',
            icon: Icons.psychology,
            imagePath: 'assets/images/skeleton/skull_bird.webp',
            subcategories: [
              Category(
                id: 'ethmoid',
                label: 'Ethmoid',
                icon: Icons.psychology,
                imagePath: 'assets/images/skeleton/skull_bird.webp',
              ),
              Category(
                id: 'frontal',
                label: 'Frontal',
                icon: Icons.psychology,
                imagePath: 'assets/images/skeleton/skull_bird.webp',
              ),
              Category(
                id: 'occipital',
                label: 'Occipital',
                icon: Icons.psychology,
                imagePath: 'assets/images/skeleton/skull_bird.webp',
              ),
              Category(
                id: 'parietal',
                label: 'Parietal',
                icon: Icons.psychology,
                imagePath: 'assets/images/skeleton/skull_bird.webp',
              ),
              Category(
                id: 'sphenoid',
                label: 'Sphenoid',
                icon: Icons.psychology,
                imagePath: 'assets/images/skeleton/skull_bird.webp',
              ),
              Category(
                id: 'temporal',
                label: 'Temporal',
                icon: Icons.psychology,
                imagePath: 'assets/images/skeleton/skull_bird.webp',
              ),
            ],
          ),
          Category(
            id: 'facial_bones',
            label: 'Facial Bones',
            icon: Icons.face,
            imagePath: 'assets/images/skeleton/skull_bird.webp',
            subcategories: [
              Category(
                id: 'incensive', 
                label: 'Incensive', 
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_bird.webp',
              ),
              Category(
                id: 'lacrimal', 
                label: 'Lacrimal', 
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_bird.webp',
              ),
              Category(
                id: 'maxilla', 
                label: 'Maxilla', 
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_bird.webp',
              ),
              Category(
                id: 'nasal', 
                label: 'Nasal', 
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_bird.webp',
              ),
              Category(
                id: 'palatine', 
                label: 'Palatine', 
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_bird.webp',
              ),
              Category(
                id: 'vomer', 
                label: 'Vomer', 
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_bird.webp',
              ),
              Category(
                id: 'zygomatic', 
                label: 'Zygomatic', 
                icon: Icons.face,
                imagePath: 'assets/images/skeleton/skull_bird.webp',
              ),
            ],
          ),
          Category(
            id: 'auditory_ossicles', 
            label: 'Auditory Ossicles', 
            icon: Icons.hearing,
            imagePath: 'assets/images/skeleton/skull_bird.webp',
          ),
          Category(
            id: 'hyoid', 
            label: 'Hyoid', 
            icon: Icons.straighten,
            imagePath: 'assets/images/skeleton/skull_bird.webp',
          ),
          Category(
            id: 'mandible', 
            label: 'Mandible', 
            icon: Icons.architecture,
            imagePath: 'assets/images/skeleton/skull_bird.webp',
          ),
        ],
      ),
      // Spine
      Category(
        id: 'spine',
        label: 'Spine',
        icon: Icons.view_column,
        subcategories: [
          Category(
            id: 'discs',
            label: 'Discs',
            icon: Icons.album,
            subcategories: [
              Category(id: 'cervical_intervertebral', label: 'Cervical Intervertebral', icon: Icons.album),
              Category(id: 'coccygeal_intervertebral', label: 'Coccygeal Intervertebral', icon: Icons.album),
              Category(id: 'synsacrum_intervertebral', label: 'Synsacrum Intervertebral', icon: Icons.album),
              Category(id: 'thoracic_intervertebral', label: 'Thoracic Intervertebral', icon: Icons.album),
            ],
          ),
        ],
      ),
      // Ribcage
      Category(
        id: 'ribcage',
        label: 'Ribcage',
        icon: Icons.border_all,
        subcategories: [
          Category(
            id: 'true_ribs',
            label: 'True Ribs',
            icon: Icons.border_all,
            subcategories: [
              Category(id: 'rib_1', label: 'Rib 1', icon: Icons.border_all),
              Category(id: 'rib_2', label: 'Rib 2', icon: Icons.border_all),
            ],
          ),
          Category(
            id: 'false_ribs',
            label: 'False Ribs',
            icon: Icons.border_all,
            subcategories: [
              Category(id: 'rib_3', label: 'Rib 3', icon: Icons.border_all),
              Category(id: 'rib_4', label: 'Rib 4', icon: Icons.border_all),
              Category(id: 'rib_5', label: 'Rib 5', icon: Icons.border_all),
              Category(id: 'rib_6', label: 'Rib 6', icon: Icons.border_all),
            ],
          ),
          Category(id: 'floating_rib', label: 'Floating Rib', icon: Icons.border_all),
          Category(id: 'costal_cartilage', label: 'Costal Cartilage', icon: Icons.layers),
          Category(id: 'intercostal_muscles', label: 'Intercostal Muscles', icon: Icons.fitness_center),
          Category(id: 'xiphoid_cartilage', label: 'Xiphoid Cartilage', icon: Icons.layers),
        ],
      ),
      // Shoulder Girdle
      Category(
        id: 'shoulder_girdle',
        label: 'Shoulder Girdle',
        icon: Icons.accessibility,
        subcategories: [
          Category(id: 'clavicle', label: 'Clavicle', icon: Icons.accessibility),
          Category(id: 'coracoid', label: 'Coracoid', icon: Icons.accessibility),
          Category(id: 'scapula', label: 'Scapula', icon: Icons.accessibility),
        ],
      ),
      // Wing
      Category(
        id: 'wing',
        label: 'Wing',
        icon: Icons.pest_control,
        subcategories: [
          Category(id: 'humerus', label: 'Humerus', icon: Icons.accessibility),
          Category(
            id: 'antebrachium',
            label: 'Antebrachium',
            icon: Icons.grid_view,
            subcategories: [
              Category(id: 'radius', label: 'Radius', icon: Icons.accessibility),
              Category(id: 'ulna', label: 'Ulna', icon: Icons.accessibility),
            ],
          ),
          Category(
            id: 'carpus',
            label: 'Carpus',
            icon: Icons.grid_view,
            subcategories: [
              Category(id: 'distal_tarsals', label: 'Distal Tarsals', icon: Icons.accessibility),
              Category(id: 'proximal_tarsals', label: 'Proximal Tarsals', icon: Icons.accessibility),
            ],
          ),
          Category(
            id: 'manus',
            label: 'Manus',
            icon: Icons.pan_tool,
            subcategories: [
              Category(id: 'metacarpals', label: 'Metacarpals', icon: Icons.accessibility),
              Category(id: 'phalanges', label: 'Phalanges', icon: Icons.accessibility),
              Category(id: 'sesamoids', label: 'Sesamoids', icon: Icons.accessibility),
            ],
          ),
        ],
      ),
      // Hindlimb
      Category(
        id: 'hindlimb',
        label: 'Hindlimb',
        icon: Icons.grid_view,
        subcategories: [
          Category(id: 'pelvis', label: 'Pelvis', icon: Icons.accessibility),
          Category(
            id: 'thigh',
            label: 'Thigh',
            icon: Icons.straighten,
            subcategories: [
              Category(id: 'femur', label: 'Femur', icon: Icons.accessibility),
              Category(id: 'patella', label: 'Patella', icon: Icons.accessibility),
            ],
          ),
          Category(
            id: 'leg',
            label: 'Leg',
            icon: Icons.straighten,
            subcategories: [
              Category(id: 'fibula', label: 'Fibula', icon: Icons.accessibility),
              Category(id: 'tibiotarsus', label: 'Tibiotarsus', icon: Icons.accessibility),
            ],
          ),
          Category(
            id: 'hock',
            label: 'Hock',
            icon: Icons.grid_view,
            subcategories: [
              Category(id: 'calcaneus', label: 'Calcaneus', icon: Icons.accessibility),
              Category(id: 'central_tarsal', label: 'Central Tarsal', icon: Icons.accessibility),
              Category(id: 'talus', label: 'Talus', icon: Icons.accessibility),
              Category(id: 'tarsals', label: 'Tarsals', icon: Icons.accessibility),
            ],
          ),
          Category(
            id: 'foot',
            label: 'Foot',
            icon: Icons.pan_tool,
            subcategories: [
              Category(id: 'metatarsals', label: 'Metatarsals', icon: Icons.accessibility),
              Category(id: 'phalanges', label: 'Phalanges', icon: Icons.accessibility),
              Category(id: 'sesamoids', label: 'Sesamoids', icon: Icons.accessibility),
            ],
          ),
        ],
      ),
      // Special Bones
      Category(
        id: 'special_bones',
        label: 'Special Bones',
        icon: Icons.star,
        subcategories: [
          Category(id: 'furcula', label: 'Furcula', icon: Icons.star),
          Category(id: 'pygostyle', label: 'Pygostyle', icon: Icons.star),
          Category(id: 'synsacrum', label: 'Synsacrum', icon: Icons.star),
          Category(id: 'uncinate_processes', label: 'Uncinate Processes', icon: Icons.star),
        ],
      ),
    ];
  }

  // Default skeletal system categories for other animals
  static List<Category> _getDefaultSkeletalCategories() {
    return [
      Category(id: 'bones', label: 'Bones', icon: Icons.straighten),
      Category(id: 'joints', label: 'Joints', icon: Icons.join_inner),
      Category(id: 'cartilage', label: 'Cartilage', icon: Icons.layers),
      Category(id: 'bone_marrow', label: 'Bone Marrow', icon: Icons.circle),
      Category(id: 'skeletal_development', label: 'Skeletal Development', icon: Icons.trending_up),
    ];
  }
}
