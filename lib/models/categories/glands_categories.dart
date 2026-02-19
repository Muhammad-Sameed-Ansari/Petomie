import 'package:flutter/material.dart';
import '../category.dart';

class GlandsCategories {
  /// Get glands categories for a specific animal
  static List<Category> getGlandsCategoriesForAnimal(String animalId) {
    if (animalId.toLowerCase() == 'horse') {
      return _getHorseGlandsCategories();
    } else if (animalId.toLowerCase() == 'dog') {
      return _getDogGlandsCategories();
    } else if (animalId.toLowerCase() == 'cat') {
      return _getCatGlandsCategories();
    } else if (animalId.toLowerCase() == 'bird') {
      return _getBirdGlandsCategories();
    } else {
      // Default for other animals (to be implemented later)
      return [];
    }
  }

  /// Helper method for horse glands
  static List<Category> _getHorseGlandsCategories() {
    return [
      Category(
        id: 'dermal',
        label: 'Dermal',
        icon: Icons.spa,
        imagePath: 'assets/images/glands/dermal.webp',
        subcategories: [
          Category(
            id: 'eccrine_glands',
            label: 'Eccrine Glands',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/dermal.webp',
          ),
          Category(
            id: 'sebaceous_glands',
            label: 'Sebaceous Glands',
            icon: Icons.bubble_chart,
            imagePath: 'assets/images/glands/dermal.webp',
          ),
          Category(
            id: 'sweat_glands',
            label: 'Sweat Glands',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/dermal.webp',
          ),
        ],
      ),
      Category(
        id: 'digestive',
        label: 'Digestive',
        icon: Icons.restaurant,
        imagePath: 'assets/images/glands/digestive.webp',
        subcategories: [
          Category(
            id: 'bile_duct_glands',
            label: 'Bile Duct Glands',
            icon: Icons.water,
            imagePath: 'assets/images/horse/glands/digestive/bile_duct_glands.webp',
          ),
          Category(
            id: 'brunner_glands',
            label: 'Brunner\'s Glands',
            icon: Icons.science,
            imagePath: 'assets/images/horse/glands/digestive/brunner_glands.webp',
          ),
          Category(
            id: 'gastric_glands',
            label: 'Gastric Glands',
            icon: Icons.local_dining,
            imagePath: 'assets/images/horse/glands/digestive/gastric_glands.webp',
          ),
          Category(
            id: 'goblet_cells',
            label: 'Goblet Cells',
            icon: Icons.blur_circular,
            imagePath: 'assets/images/horse/glands/digestive/goblet_cells.webp',
          ),
          Category(
            id: 'intestinal_glands',
            label: 'Intestinal Glands',
            icon: Icons.linear_scale,
            imagePath: 'assets/images/horse/glands/digestive/intestinal_glands.webp',
          ),
          Category(
            id: 'von_ebners_glands',
            label: 'Von Ebner\'s Glands',
            icon: Icons.waves,
            imagePath: 'assets/images/horse/glands/digestive/von_ebners_glands.webp',
          ),
        ],
      ),
      Category(
        id: 'endocrine',
        label: 'Endocrine',
        icon: Icons.biotech,
        imagePath: 'assets/images/glands/endocrine.webp',
        subcategories: [
          Category(
            id: 'adrenal_glands',
            label: 'Adrenal Glands',
            icon: Icons.warning,
            imagePath: 'assets/images/glands/endocrine/adrenal_glands.webp',
          ),
          Category(
            id: 'pancreas_endocrine',
            label: 'Pancreas (Endocrine)',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/glands/endocrine/pancreas_endocrine.webp',
          ),
          Category(
            id: 'parathyroid_glands',
            label: 'Parathyroid Glands',
            icon: Icons.colorize,
            imagePath: 'assets/images/glands/endocrine/parathyroid_glands.webp',
          ),
          Category(
            id: 'pineal_gland',
            label: 'Pineal Gland',
            icon: Icons.brightness_3,
            imagePath: 'assets/images/glands/endocrine/pineal_gland.webp',
          ),
          Category(
            id: 'pituitary_gland',
            label: 'Pituitary Gland',
            icon: Icons.psychology,
            imagePath: 'assets/images/glands/endocrine/pituitary_gland.webp',
          ),
          Category(
            id: 'thymus_gland',
            label: 'Thymus Gland',
            icon: Icons.security,
            imagePath: 'assets/images/glands/endocrine/thymus_gland.webp',
          ),
          Category(
            id: 'thyroid_gland',
            label: 'Thyroid Gland',
            icon: Icons.thermostat,
            imagePath: 'assets/images/glands/endocrine/thyroid_gland.webp',
          ),
        ],
      ),
      Category(
        id: 'immune',
        label: 'Immune',
        icon: Icons.shield,
        imagePath: 'assets/images/glands/immune.webp',
        subcategories: [
          Category(
            id: 'thymus_gland',
            label: 'Thymus Gland',
            icon: Icons.security,
            imagePath: 'assets/images/glands/immune/thymus_gland.webp',
          ),
          // Category(
          //   id: 'lymph_glands',
          //   label: 'Lymph Glands',
          //   icon: Icons.bubble_chart,
          //   imagePath: 'assets/images/horse/glands/immune/lymph_glands.txt',
          // ),
          // Category(
          //   id: 'lymph_nodes',
          //   label: 'Lymph Nodes',
          //   icon: Icons.radio_button_checked,
          //   imagePath: 'assets/images/horse/glands/immune/lymph_nodes.txt',
          // ),
          // Category(
          //   id: 'spleen',
          //   label: 'Spleen',
          //   icon: Icons.filter_vintage,
          //   imagePath: 'assets/images/horse/glands/immune/spleen.txt',
          // ),
        ],
      ),
      Category(
        id: 'mammary',
        label: 'Mammary',
        icon: Icons.child_care,
        imagePath: 'assets/images/glands/mammary.webp',
        subcategories: [
          Category(
            id: 'mare',
            label: 'Mare',
            icon: Icons.female,
            imagePath: 'assets/images/organs/reproductive_organs/female.webp',
          ),
          Category(
            id: 'stallion',
            label: 'Stallion',
            icon: Icons.male,
            imagePath: 'assets/images/organs/reproductive_organs/male.webp',
          ),
        ],
      ),
      Category(
        id: 'ocular',
        label: 'Ocular',
        icon: Icons.visibility,
        imagePath: 'assets/images/glands/ocular.webp',
        subcategories: [
          Category(
            id: 'conjunctival_glands',
            label: 'Conjunctival Glands',
            icon: Icons.remove_red_eye,
            imagePath: 'assets/images/glands/ocular.webp',
          ),
          Category(
            id: 'gland_of_the_third_eyelid',
            label: 'Gland of the Third Eyelid',
            icon: Icons.visibility,
            imagePath: 'assets/images/glands/ocular.webp',
          ),
          Category(
            id: 'harderian_gland',
            label: 'Harderian Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/ocular.webp',
          ),
          Category(
            id: 'lacrimal_gland',
            label: 'Lacrimal Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/ocular.webp',
          ),
          Category(
            id: 'meibomian_glands',
            label: 'Meibomian Glands',
            icon: Icons.remove_red_eye,
            imagePath: 'assets/images/glands/ocular.webp',
          ),
          Category(
            id: 'tarsal_glands',
            label: 'Tarsal Glands',
            icon: Icons.visibility,
            imagePath: 'assets/images/glands/ocular.webp',
          ),
        ],
      ),
      Category(
        id: 'reproductive',
        label: 'Reproductive',
        icon: Icons.favorite,
        imagePath: 'assets/images/glands/reproductive.webp',
        subcategories: [
          Category(
            id: 'female',
            label: 'Female',
            icon: Icons.female,
            imagePath: 'assets/images/organs/reproductive_organs/female.webp',
            subcategories: [
              Category(
                id: 'ovarian_glands',
                label: 'Ovarian Glands',
                icon: Icons.circle,
                imagePath: 'assets/images/horse/glands/reproductive/female/ovarian_glands.txt',
              ),
              Category(
                id: 'urethral_glands',
                label: 'Urethral Glands',
                icon: Icons.water_drop,
                imagePath: 'assets/images/horse/glands/reproductive/female/urethral_glands.txt',
              ),
              Category(
                id: 'uterine_glands',
                label: 'Uterine Glands',
                icon: Icons.waves,
                imagePath: 'assets/images/horse/glands/reproductive/female/uterine_glands.txt',
              ),
              Category(
                id: 'vestibular_glands',
                label: 'Vestibular Glands',
                icon: Icons.water,
                imagePath: 'assets/images/horse/glands/reproductive/female/vestibular_glands.txt',
              ),
              Category(
                id: 'vulvar_glands',
                label: 'Vulvar Glands',
                icon: Icons.bubble_chart,
                imagePath: 'assets/images/horse/glands/reproductive/female/vulvar_glands.txt',
              ),
            ],
          ),
          Category(
            id: 'male',
            label: 'Male',
            icon: Icons.male,
            imagePath: 'assets/images/organs/reproductive_organs/male.webp',
            subcategories: [
              Category(
                id: 'bulbourethral_glands',
                label: 'Bulbourethral Glands',
                icon: Icons.circle,
                imagePath: 'assets/images/horse/glands/reproductive/male/bulbourethral_glands.txt',
              ),
              Category(
                id: 'preputial_glands',
                label: 'Preputial Glands',
                icon: Icons.bubble_chart,
                imagePath: 'assets/images/horse/glands/reproductive/male/preputial_glands.txt',
              ),
              Category(
                id: 'prostate_gland',
                label: 'Prostate Gland',
                icon: Icons.circle_outlined,
                imagePath: 'assets/images/glands/reproductive/male/prostate_gland.webp',
              ),
              Category(
                id: 'urethral_glands',
                label: 'Urethral Glands',
                icon: Icons.water_drop,
                imagePath: 'assets/images/horse/glands/reproductive/male/urethral_glands.txt',
              ),
            ],
          ),
        ],
      ),
      Category(
        id: 'respiratory',
        label: 'Respiratory',
        icon: Icons.air,
        imagePath: 'assets/images/glands/respiratory.webp',
        subcategories: [
          Category(
            id: 'bronchial_glands',
            label: 'Bronchial Glands',
            icon: Icons.device_hub,
            imagePath: 'assets/images/glands/respiratory/bronchial_glands.webp',
          ),
          Category(
            id: 'laryngeal_glands',
            label: 'Laryngeal Glands',
            icon: Icons.graphic_eq,
            imagePath: 'assets/images/glands/respiratory/laryngeal_glands.webp',
          ),
          Category(
            id: 'nasal_glands',
            label: 'Nasal Glands',
            icon: Icons.wind_power,
            imagePath: 'assets/images/glands/respiratory/nasal_glands_horse.webp',
          ),
          Category(
            id: 'tracheal_glands',
            label: 'Tracheal Glands',
            icon: Icons.power_input,
            imagePath: 'assets/images/glands/respiratory/tracheal_glands.webp',
          ),
        ],
      ),
      Category(
        id: 'salivary',
        label: 'Salivary',
        icon: Icons.water_drop,
        imagePath: 'assets/images/glands/salivary.webp',
        subcategories: [
          Category(
            id: 'mandibular_gland',
            label: 'Mandibular Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/salivary.webp',
          ),
          Category(
            id: 'parotid_gland',
            label: 'Parotid Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/salivary.webp',
          ),
          Category(
            id: 'sublingual_gland',
            label: 'Sublingual Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/salivary.webp',
          ),
        ],
      ),
      Category(
        id: 'scent_protective',
        label: 'Scent & Protective',
        icon: Icons.pets,
        imagePath: 'assets/images/glands/scent_protective_horse.webp',
        subcategories: [
          Category(
            id: 'protective',
            label: 'Protective',
            icon: Icons.shield,
            imagePath: 'assets/images/glands/scent_protective_horse.webp',
            subcategories: [
              Category(
                id: 'ceruminous_glands',
                label: 'Ceruminous Glands',
                icon: Icons.hearing,
                imagePath: 'assets/images/glands/scent_protective_horse.webp',
              ),
              Category(
                id: 'lacrimal_gland',
                label: 'Lacrimal Gland',
                icon: Icons.water_drop,
                imagePath: 'assets/images/glands/scent_protective_horse.webp',
              ),
              Category(
                id: 'meibomian_glands',
                label: 'Meibomian Glands',
                icon: Icons.visibility,
                imagePath: 'assets/images/glands/scent_protective_horse.webp',
              ),
              Category(
                id: 'sweat_glands',
                label: 'Sweat Glands',
                icon: Icons.water_drop,
                imagePath: 'assets/images/glands/scent_protective_horse.webp',
              ),
              Category(
                id: 'third_eyelid_gland',
                label: 'Third Eyelid Gland',
                icon: Icons.visibility,
                imagePath: 'assets/images/glands/scent_protective_horse.webp',
              ),
            ],
          ),
          Category(
            id: 'scent',
            label: 'Scent',
            icon: Icons.pets,
            imagePath: 'assets/images/glands/scent_protective_horse.webp',
            subcategories: [
              Category(
                id: 'sebaceous_glands',
                label: 'Sebaceous Glands',
                icon: Icons.bubble_chart,
                imagePath: 'assets/images/glands/scent_protective_horse.webp',
              ),
            ],
          ),
        ],
      ),
    ];
  }

  /// Helper method for dog glands
  static List<Category> _getDogGlandsCategories() {
    return [
      Category(
        id: 'dermal',
        label: 'Dermal',
        icon: Icons.spa,
        imagePath: 'assets/images/glands/dermal.webp',
        subcategories: [
          Category(
            id: 'eccrine_glands',
            label: 'Eccrine Glands',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/dermal.webp',
          ),
          Category(
            id: 'sebaceous_glands',
            label: 'Sebaceous Glands',
            icon: Icons.bubble_chart,
            imagePath: 'assets/images/glands/dermal.webp',
          ),
          Category(
            id: 'sweat_glands',
            label: 'Sweat Glands',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/dermal.webp',
          ),
        ],
      ),
      Category(
        id: 'digestive',
        label: 'Digestive',
        icon: Icons.restaurant,
        imagePath: 'assets/images/glands/digestive.webp',
        subcategories: [
          Category(
            id: 'bile_duct_glands',
            label: 'Bile Duct Glands',
            icon: Icons.water,
            imagePath: 'assets/images/dog/glands/digestive/bile_duct_glands.webp',
          ),
          Category(
            id: 'brunner_glands',
            label: 'Brunner\'s Glands',
            icon: Icons.science,
            imagePath: 'assets/images/dog/glands/digestive/brunner_glands.webp',
          ),
          Category(
            id: 'gastric_glands',
            label: 'Gastric Glands',
            icon: Icons.local_dining,
            imagePath: 'assets/images/dog/glands/digestive/gastric_glands.webp',
          ),
          Category(
            id: 'goblet_cells',
            label: 'Goblet Cells',
            icon: Icons.blur_circular,
            imagePath: 'assets/images/dog/glands/digestive/goblet_cells.webp',
          ),
          Category(
            id: 'intestinal_glands',
            label: 'Intestinal Glands',
            icon: Icons.linear_scale,
            imagePath: 'assets/images/dog/glands/digestive/intestinal_glands.webp',
          ),
          Category(
            id: 'von_ebners_glands',
            label: 'Von Ebner\'s Glands',
            icon: Icons.waves,
            imagePath: 'assets/images/dog/glands/digestive/von_ebners_glands.webp',
          ),
        ],
      ),
      Category(
        id: 'endocrine',
        label: 'Endocrine',
        icon: Icons.biotech,
        imagePath: 'assets/images/glands/endocrine.webp',
        subcategories: [
          Category(
            id: 'adrenal_glands',
            label: 'Adrenal Glands',
            icon: Icons.warning,
            imagePath: 'assets/images/glands/endocrine/adrenal_glands.webp',
          ),
          Category(
            id: 'pancreas_endocrine',
            label: 'Pancreas (Endocrine)',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/glands/endocrine/pancreas_endocrine.webp',
          ),
          Category(
            id: 'parathyroid_glands',
            label: 'Parathyroid Glands',
            icon: Icons.colorize,
            imagePath: 'assets/images/glands/endocrine/parathyroid_glands.webp',
          ),
          Category(
            id: 'pineal_gland',
            label: 'Pineal Gland',
            icon: Icons.brightness_3,
            imagePath: 'assets/images/glands/endocrine/pineal_gland.webp',
          ),
          Category(
            id: 'pituitary_gland',
            label: 'Pituitary Gland',
            icon: Icons.psychology,
            imagePath: 'assets/images/glands/endocrine/pituitary_gland.webp',
          ),
          Category(
            id: 'thyroid_gland',
            label: 'Thyroid Gland',
            icon: Icons.thermostat,
            imagePath: 'assets/images/glands/endocrine/thyroid_gland.webp',
          ),
          Category(
            id: 'thymus',
            label: 'Thymus',
            icon: Icons.thermostat,
            imagePath: 'assets/images/glands/endocrine/thymus.webp',
          ),
        ],
      ),
      Category(
        id: 'immune',
        label: 'Immune',
        icon: Icons.shield,
        imagePath: 'assets/images/glands/immune.webp',
        subcategories: [
          // Category(
          //   id: 'lymph_glands',
          //   label: 'Lymph Glands',
          //   icon: Icons.bubble_chart,
          //   imagePath: 'assets/images/dog/glands/immune/lymph_glands.txt',
          // ),
          // Category(
          //   id: 'lymph_nodes',
          //   label: 'Lymph Nodes',
          //   icon: Icons.radio_button_checked,
          //   imagePath: 'assets/images/dog/glands/immune/lymph_nodes.txt',
          // ),
          Category(
            id: 'spleen',
            label: 'Spleen',
            icon: Icons.filter_vintage,
            imagePath: 'assets/images/dog/glands/immune/spleen.txt',
          ),
          Category(
            id: 'thymus_gland',
            label: 'Thymus Gland',
            icon: Icons.security,
            imagePath: 'assets/images/dog/glands/immune/thymus_gland.txt',
          ),
        ],
      ),
      Category(
        id: 'mammary',
        label: 'Mammary',
        icon: Icons.child_care,
        imagePath: 'assets/images/glands/mammary.webp',
        subcategories: [
          Category(
            id: 'bitch',
            label: 'Bitch',
            icon: Icons.female,
            imagePath: 'assets/images/organs/reproductive_organs/female.webp',
          ),
          Category(
            id: 'dog',
            label: 'Dog',
            icon: Icons.male,
            imagePath: 'assets/images/organs/reproductive_organs/male.webp',
          ),
        ],
      ),
      Category(
        id: 'ocular',
        label: 'Ocular',
        icon: Icons.visibility,
        imagePath: 'assets/images/glands/ocular.webp',
        subcategories: [
          Category(
            id: 'conjunctival_glands',
            label: 'Conjunctival Glands',
            icon: Icons.remove_red_eye,
            imagePath: 'assets/images/glands/ocular.webp',
          ),
          Category(
            id: 'gland_of_the_third_eyelid',
            label: 'Gland of the Third Eyelid',
            icon: Icons.visibility,
            imagePath: 'assets/images/glands/ocular.webp',
          ),
          Category(
            id: 'harderian_gland',
            label: 'Harderian Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/ocular.webp',
          ),
          Category(
            id: 'lacrimal_gland',
            label: 'Lacrimal Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/ocular.webp',
          ),
          Category(
            id: 'meibomian_glands',
            label: 'Meibomian Glands',
            icon: Icons.remove_red_eye,
            imagePath: 'assets/images/glands/ocular.webp',
          ),
          Category(
            id: 'tarsal_glands',
            label: 'Tarsal Glands',
            icon: Icons.visibility,
            imagePath: 'assets/images/glands/ocular.webp',
          ),
        ],
      ),
      Category(
        id: 'reproductive',
        label: 'Reproductive',
        icon: Icons.favorite,
        imagePath: 'assets/images/glands/reproductive.webp',
        subcategories: [
          Category(
            id: 'female',
            label: 'Female',
            icon: Icons.female,
            imagePath: 'assets/images/organs/reproductive_organs/female.webp',
            subcategories: [
              Category(
                id: 'ovarian_glands',
                label: 'Ovarian Glands',
                icon: Icons.circle,
                imagePath: 'assets/images/dog/glands/reproductive/female/ovarian_glands.txt',
              ),
              Category(
                id: 'urethral_glands',
                label: 'Urethral Glands',
                icon: Icons.water_drop,
                imagePath: 'assets/images/dog/glands/reproductive/female/urethral_glands.txt',
              ),
              Category(
                id: 'uterine_glands',
                label: 'Uterine Glands',
                icon: Icons.waves,
                imagePath: 'assets/images/dog/glands/reproductive/female/uterine_glands.txt',
              ),
              Category(
                id: 'vestibular_glands',
                label: 'Vestibular Glands',
                icon: Icons.water,
                imagePath: 'assets/images/dog/glands/reproductive/female/vestibular_glands.txt',
              ),
              Category(
                id: 'vulvar_glands',
                label: 'Vulvar Glands',
                icon: Icons.bubble_chart,
                imagePath: 'assets/images/dog/glands/reproductive/female/vulvar_glands.txt',
              ),
            ],
          ),
          Category(
            id: 'male',
            label: 'Male',
            icon: Icons.male,
            imagePath: 'assets/images/organs/reproductive_organs/male.webp',
            subcategories: [
              Category(
                id: 'bulbourethral_glands',
                label: 'Bulbourethral Glands',
                icon: Icons.circle,
                imagePath: 'assets/images/dog/glands/reproductive/male/bulbourethral_glands.txt',
              ),
              Category(
                id: 'preputial_glands',
                label: 'Preputial Glands',
                icon: Icons.bubble_chart,
                imagePath: 'assets/images/dog/glands/reproductive/male/preputial_glands.txt',
              ),
              Category(
                id: 'prostate_gland',
                label: 'Prostate Gland',
                icon: Icons.circle_outlined,
                imagePath: 'assets/images/glands/reproductive/male/prostate_gland.webp',
              ),
              Category(
                id: 'urethral_glands',
                label: 'Urethral Glands',
                icon: Icons.water_drop,
                imagePath: 'assets/images/dog/glands/reproductive/male/urethral_glands.webp',
              ),
            ],
          ),
        ],
      ),
      Category(
        id: 'respiratory',
        label: 'Respiratory',
        icon: Icons.air,
        imagePath: 'assets/images/glands/respiratory.webp',
        subcategories: [
          Category(
            id: 'laryngeal_glands',
            label: 'Laryngeal Glands',
            icon: Icons.graphic_eq,
            imagePath: 'assets/images/glands/respiratory/laryngeal_glands.webp',
          ),
          Category(
            id: 'nasal_glands',
            label: 'Nasal Glands',
            icon: Icons.wind_power,
            imagePath: 'assets/images/glands/respiratory/nasal_glands_dog.webp',
          ),
          Category(
            id: 'pharyngeal_glands',
            label: 'Pharyngeal Glands',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/glands/respiratory/pharyngeal_glands_dog.webp',
          ),
          Category(
            id: 'bronchial_glands',
            label: 'Bronchial Glands',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/glands/respiratory/bronchial_glands.webp',
          ),
        ],
      ),
      Category(
        id: 'salivary',
        label: 'Salivary',
        icon: Icons.water_drop,
        imagePath: 'assets/images/glands/salivary.webp',
        subcategories: [
          Category(
            id: 'mandibular_gland',
            label: 'Mandibular Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/salivary.webp',
          ),
          Category(
            id: 'parotid_gland',
            label: 'Parotid Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/salivary.webp',
          ),
          Category(
            id: 'sublingual_gland',
            label: 'Sublingual Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/salivary.webp',
          ),
          Category(
            id: 'zygomatic_gland',
            label: 'Zygomatic Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/salivary.webp',
          ),
        ],
      ),
      Category(
        id: 'scent_protective',
        label: 'Scent & Protective',
        icon: Icons.pets,
        imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
        subcategories: [
          Category(
            id: 'protective',
            label: 'Protective',
            icon: Icons.shield,
            imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
            subcategories: [
              Category(
                id: 'ceruminous_glands',
                label: 'Ceruminous Glands',
                icon: Icons.hearing,
                imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
              ),
              Category(
                id: 'lacrimal_gland',
                label: 'Lacrimal Gland',
                icon: Icons.water_drop,
                imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
              ),
              Category(
                id: 'meibomian_glands',
                label: 'Meibomian Glands',
                icon: Icons.visibility,
                imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
              ),
              Category(
                id: 'third_eyelid_gland',
                label: 'Third Eyelid Gland',
                icon: Icons.visibility,
                imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
              ),
            ],
          ),
          Category(
            id: 'scent',
            label: 'Scent',
            icon: Icons.pets,
            imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
            subcategories: [
              Category(
                id: 'anal_glands',
                label: 'Anal Glands',
                icon: Icons.circle,
                imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
              ),
              Category(
                id: 'anal_sacs',
                label: 'Anal Sacs',
                icon: Icons.circle_outlined,
                imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
              ),
              Category(
                id: 'harderian_gland',
                label: 'Harderian Gland',
                icon: Icons.water_drop,
                imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
              ),
              Category(
                id: 'perianal_glands',
                label: 'Perianal Glands',
                icon: Icons.pets,
                imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
              ),
              Category(
                id: 'sebaceous_glands',
                label: 'Sebaceous Glands',
                icon: Icons.bubble_chart,
                imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
              ),
              Category(
                id: 'sweat_glands',
                label: 'Sweat Glands',
                icon: Icons.water_drop,
                imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
              ),
            ],
          ),
        ],
      ),
    ];
  }

  /// Helper method for cat glands
  static List<Category> _getCatGlandsCategories() {
    return [
      Category(
        id: 'dermal',
        label: 'Dermal',
        icon: Icons.spa,
        imagePath: 'assets/images/glands/dermal.webp',
        subcategories: [
          Category(
            id: 'eccrine_glands',
            label: 'Eccrine Glands',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/dermal.webp',
          ),
          Category(
            id: 'sebaceous_glands',
            label: 'Sebaceous Glands',
            icon: Icons.bubble_chart,
            imagePath: 'assets/images/glands/dermal.webp',
          ),
          Category(
            id: 'sweat_glands',
            label: 'Sweat Glands',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/dermal.webp',
          ),
        ],
      ),
      Category(
        id: 'digestive',
        label: 'Digestive',
        icon: Icons.restaurant,
        imagePath: 'assets/images/glands/digestive.webp',
        subcategories: [
          Category(
            id: 'bile_duct_glands',
            label: 'Bile Duct Glands',
            icon: Icons.water,
            imagePath: 'assets/images/cat/glands/digestive/bile_duct_glands.webp',
          ),
          Category(
            id: 'brunner_glands',
            label: 'Brunner\'s Glands',
            icon: Icons.science,
            imagePath: 'assets/images/cat/glands/digestive/brunner_glands.webp',
          ),
          Category(
            id: 'gastric_glands',
            label: 'Gastric Glands',
            icon: Icons.local_dining,
            imagePath: 'assets/images/cat/glands/digestive/gastric_glands.webp',
          ),
          Category(
            id: 'goblet_cells',
            label: 'Goblet Cells',
            icon: Icons.blur_circular,
            imagePath: 'assets/images/cat/glands/digestive/goblet_cells.webp',
          ),
          Category(
            id: 'intestinal_glands',
            label: 'Intestinal Glands',
            icon: Icons.linear_scale,
            imagePath: 'assets/images/cat/glands/digestive/intestinal_glands.webp',
          ),
          Category(
            id: 'von_ebners_glands',
            label: 'Von Ebner\'s Glands',
            icon: Icons.waves,
            imagePath: 'assets/images/cat/glands/digestive/von_ebners_glands.webp',
          ),
        ],
      ),
      Category(
        id: 'endocrine',
        label: 'Endocrine',
        icon: Icons.biotech,
        imagePath: 'assets/images/glands/endocrine.webp',
        subcategories: [
          Category(
            id: 'adrenal_glands',
            label: 'Adrenal Glands',
            icon: Icons.warning,
            imagePath: 'assets/images/glands/endocrine/adrenal_glands.webp',
          ),
          Category(
            id: 'pancreas_endocrine',
            label: 'Pancreas (Endocrine)',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/glands/endocrine/pancreas_endocrine.webp',
          ),
          Category(
            id: 'parathyroid_glands',
            label: 'Parathyroid Glands',
            icon: Icons.colorize,
            imagePath: 'assets/images/glands/endocrine/parathyroid_glands.webp',
          ),
          Category(
            id: 'pineal_gland',
            label: 'Pineal Gland',
            icon: Icons.brightness_3,
            imagePath: 'assets/images/glands/endocrine/pineal_gland.webp',
          ),
          Category(
            id: 'pituitary_gland',
            label: 'Pituitary Gland',
            icon: Icons.psychology,
            imagePath: 'assets/images/glands/endocrine/pituitary_gland.webp',
          ),
          Category(
            id: 'thyroid_gland',
            label: 'Thyroid Gland',
            icon: Icons.thermostat,
            imagePath: 'assets/images/glands/endocrine/thyroid_gland.webp',
          ),
          Category(
            id: 'thymus',
            label: 'Thymus',
            icon: Icons.thermostat,
            imagePath: 'assets/images/glands/endocrine/thymus.webp',
          ),
        ],
      ),
      Category(
        id: 'immune',
        label: 'Immune',
        icon: Icons.shield,
        imagePath: 'assets/images/glands/immune.webp',
        subcategories: [
          // Category(
          //   id: 'lymph_glands',
          //   label: 'Lymph Glands',
          //   icon: Icons.bubble_chart,
          //   imagePath: 'assets/images/cat/glands/immune/lymph_glands.txt',
          // ),
          // Category(
          //   id: 'lymph_nodes',
          //   label: 'Lymph Nodes',
          //   icon: Icons.radio_button_checked,
          //   imagePath: 'assets/images/cat/glands/immune/lymph_nodes.txt',
          // ),
          Category(
            id: 'spleen',
            label: 'Spleen',
            icon: Icons.filter_vintage,
            imagePath: 'assets/images/cat/glands/immune/spleen.txt',
          ),
          Category(
            id: 'thymus_gland',
            label: 'Thymus Gland',
            icon: Icons.security,
            imagePath: 'assets/images/cat/glands/immune/thymus_gland.txt',
          ),
        ],
      ),
      Category(
        id: 'mammary',
        label: 'Mammary',
        icon: Icons.child_care,
        imagePath: 'assets/images/glands/mammary.webp',
        subcategories: [
          Category(
            id: 'queen',
            label: 'Queen',
            icon: Icons.female,
            imagePath: 'assets/images/organs/reproductive_organs/female.webp',
          ),
          Category(
            id: 'tom',
            label: 'Tom',
            icon: Icons.male,
            imagePath: 'assets/images/organs/reproductive_organs/male.webp',
          ),
        ],
      ),
      Category(
        id: 'ocular',
        label: 'Ocular',
        icon: Icons.visibility,
        imagePath: 'assets/images/glands/ocular.webp',
        subcategories: [
          Category(
            id: 'conjunctival_glands',
            label: 'Conjunctival Glands',
            icon: Icons.remove_red_eye,
            imagePath: 'assets/images/glands/ocular.webp',
          ),
          Category(
            id: 'gland_of_the_third_eyelid',
            label: 'Gland of the Third Eyelid',
            icon: Icons.visibility,
            imagePath: 'assets/images/glands/ocular.webp',
          ),
          Category(
            id: 'harderian_gland',
            label: 'Harderian Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/ocular.webp',
          ),
          Category(
            id: 'lacrimal_gland',
            label: 'Lacrimal Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/ocular.webp',
          ),
          Category(
            id: 'meibomian_glands',
            label: 'Meibomian Glands',
            icon: Icons.remove_red_eye,
            imagePath: 'assets/images/glands/ocular.webp',
          ),
        ],
      ),
      Category(
        id: 'reproductive',
        label: 'Reproductive',
        icon: Icons.favorite,
        imagePath: 'assets/images/glands/reproductive.webp',
        subcategories: [
          Category(
            id: 'female',
            label: 'Female',
            icon: Icons.female,
            imagePath: 'assets/images/organs/reproductive_organs/female.webp',
            subcategories: [
              Category(
                id: 'mammary_glands',
                label: 'Mammary Glands',
                icon: Icons.child_care,
                imagePath: 'assets/images/cat/glands/reproductive/female/mammary_glands.txt',
              ),
              Category(
                id: 'ovarian_glands',
                label: 'Ovarian Glands',
                icon: Icons.circle,
                imagePath: 'assets/images/cat/glands/reproductive/female/ovarian_glands.txt',
              ),
              Category(
                id: 'uterine_glands',
                label: 'Uterine Glands',
                icon: Icons.waves,
                imagePath: 'assets/images/cat/glands/reproductive/female/uterine_glands.txt',
              ),
              Category(
                id: 'vestibular_glands',
                label: 'Vestibular Glands',
                icon: Icons.water,
                imagePath: 'assets/images/cat/glands/reproductive/female/vestibular_glands.txt',
              ),
              Category(
                id: 'vulvar_glands',
                label: 'Vulvar Glands',
                icon: Icons.bubble_chart,
                imagePath: 'assets/images/cat/glands/reproductive/female/vulvar_glands.txt',
              ),
            ],
          ),
          Category(
            id: 'male',
            label: 'Male',
            icon: Icons.male,
            imagePath: 'assets/images/organs/reproductive_organs/male.webp',
            subcategories: [
              Category(
                id: 'bulbourethral_glands',
                label: 'Bulbourethral Glands',
                icon: Icons.circle,
                imagePath: 'assets/images/cat/glands/reproductive/male/bulbourethral_glands.txt',
              ),
              Category(
                id: 'mammary_glands_male',
                label: 'Mammary Glands (Male)',
                icon: Icons.child_care,
                imagePath: 'assets/images/cat/glands/reproductive/male/mammary_glands_male.txt',
              ),
              Category(
                id: 'preputial_glands',
                label: 'Preputial Glands',
                icon: Icons.bubble_chart,
                imagePath: 'assets/images/cat/glands/reproductive/male/preputial_glands.txt',
              ),
              Category(
                id: 'prostate_gland',
                label: 'Prostate Gland',
                icon: Icons.circle_outlined,
                imagePath: 'assets/images/glands/reproductive/male/prostate_gland.webp',
              ),
            ],
          ),
        ],
      ),
      Category(
        id: 'respiratory',
        label: 'Respiratory',
        icon: Icons.air,
        imagePath: 'assets/images/glands/respiratory.webp',
        subcategories: [
          Category(
            id: 'bronchial_glands',
            label: 'Bronchial Glands',
            icon: Icons.device_hub,
            imagePath: 'assets/images/glands/respiratory/bronchial_glands.webp',
          ),
          Category(
            id: 'nasal_glands',
            label: 'Nasal Glands',
            icon: Icons.wind_power,
            imagePath: 'assets/images/glands/respiratory/nasal_glands_cat.webp',
          ),
          Category(
            id: 'tracheal_glands',
            label: 'Tracheal Glands',
            icon: Icons.power_input,
            imagePath: 'assets/images/glands/respiratory/tracheal_glands.webp',
          ),
          Category(
            id: 'laryngeal_glands',
            label: 'Laryngeal Glands',
            icon: Icons.power_input,
            imagePath: 'assets/images/glands/respiratory/laryngeal_glands.webp',
          ),
        ],
      ),
      Category(
        id: 'salivary',
        label: 'Salivary',
        icon: Icons.water_drop,
        imagePath: 'assets/images/glands/salivary.webp',
        subcategories: [
          Category(
            id: 'mandibular_gland',
            label: 'Mandibular Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/salivary.webp',
          ),
          Category(
            id: 'molar_glands',
            label: 'Molar Glands',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/salivary.webp',
          ),
          Category(
            id: 'parotid_gland',
            label: 'Parotid Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/salivary.webp',
          ),
          Category(
            id: 'sublingual_gland',
            label: 'Sublingual Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/salivary.webp',
          ),
          Category(
            id: 'zygomatic_gland',
            label: 'Zygomatic Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/salivary.webp',
          ),
        ],
      ),
      Category(
        id: 'scent_protective',
        label: 'Scent & Protective',
        icon: Icons.pets,
        imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
        subcategories: [
          Category(
            id: 'protective',
            label: 'Protective',
            icon: Icons.shield,
            imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
            subcategories: [
              Category(
                id: 'ceruminous_glands',
                label: 'Ceruminous Glands',
                icon: Icons.hearing,
                imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
              ),
              Category(
                id: 'lacrimal_gland',
                label: 'Lacrimal Gland',
                icon: Icons.water_drop,
                imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
              ),
              Category(
                id: 'meibomian_glands',
                label: 'Meibomian Glands',
                icon: Icons.visibility,
                imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
              ),
              Category(
                id: 'sweat_glands',
                label: 'Sweat Glands',
                icon: Icons.water_drop,
                imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
              ),
              Category(
                id: 'third_eyelid_gland',
                label: 'Third Eyelid Gland',
                icon: Icons.visibility,
                imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
              ),
            ],
          ),
          Category(
            id: 'scent',
            label: 'Scent',
            icon: Icons.pets,
            imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
            subcategories: [
              Category(
                id: 'anal_glands',
                label: 'Anal Glands',
                icon: Icons.circle,
                imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
              ),
              Category(
                id: 'anal_sacs',
                label: 'Anal Sacs',
                icon: Icons.circle_outlined,
                imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
              ),
              Category(
                id: 'caudal_glands',
                label: 'Caudal Glands',
                icon: Icons.pets,
                imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
              ),
              Category(
                id: 'harderian_gland',
                label: 'Harderian Gland',
                icon: Icons.water_drop,
                imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
              ),
              Category(
                id: 'interdigital_glands',
                label: 'Interdigital Glands',
                icon: Icons.pets,
                imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
              ),
              Category(
                id: 'perioral_glands',
                label: 'Perioral Glands',
                icon: Icons.circle,
                imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
              ),
              Category(
                id: 'sebaceous_glands',
                label: 'Sebaceous Glands',
                icon: Icons.bubble_chart,
                imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
              ),
              Category(
                id: 'submandibular_glands',
                label: 'Submandibular Glands',
                icon: Icons.circle,
                imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
              ),
              Category(
                id: 'supraorbital_glands',
                label: 'Supraorbital Glands',
                icon: Icons.circle,
                imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
              ),
              Category(
                id: 'temporal_glands',
                label: 'Temporal Glands',
                icon: Icons.circle,
                imagePath: 'assets/images/glands/scent_protective_cat_dog.webp',
              ),
            ],
          ),
        ],
      ),
    ];
  }

  /// Helper method for bird glands
  static List<Category> _getBirdGlandsCategories() {
    return [
      Category(
        id: 'dermal',
        label: 'Dermal',
        icon: Icons.spa,
        imagePath: 'assets/images/glands/dermal.webp',
        subcategories: [
          Category(
            id: 'aural',
            label: 'Aural',
            icon: Icons.hearing,
            imagePath: 'assets/images/glands/dermal.webp',
          ),
          Category(
            id: 'claw_and_scale',
            label: 'Claw and Scale',
            icon: Icons.pets,
            imagePath: 'assets/images/glands/dermal.webp',
          ),
          Category(
            id: 'filoplume_base',
            label: 'Filoplume Base',
            icon: Icons.spa,
            imagePath: 'assets/images/glands/dermal.webp',
          ),
          Category(
            id: 'skin_oil_micro',
            label: 'Skin Oil Micro',
            icon: Icons.bubble_chart,
            imagePath: 'assets/images/glands/dermal.webp',
          ),
          Category(
            id: 'uropygial',
            label: 'Uropygial',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/dermal.webp',
          ),
        ],
      ),
      Category(
        id: 'digestive',
        label: 'Digestive',
        icon: Icons.restaurant,
        imagePath: 'assets/images/glands/digestive.webp',
        subcategories: [
          Category(
            id: 'crop_glands',
            label: 'Crop Glands',
            icon: Icons.category,
            imagePath: 'assets/images/bird/glands/digestive/crop_glands.webp',
          ),
          Category(
            id: 'esophageal_glands',
            label: 'Esophageal Glands',
            icon: Icons.category,
            imagePath: 'assets/images/bird/glands/digestive/esophageal_glands.webp',
          ),
          Category(
            id: 'intestinal_glands',
            label: 'Intestinal Glands',
            icon: Icons.category,
            imagePath: 'assets/images/bird/glands/digestive/intestinal_glands.webp',
          ),
          Category(
            id: 'liver',
            label: 'Liver',
            icon: Icons.category,
            imagePath: 'assets/images/bird/glands/digestive/liver.webp',
          ),
          Category(
            id: 'pancreas',
            label: 'Pancreas',
            icon: Icons.category,
            imagePath: 'assets/images/bird/glands/digestive/pancreas.webp',
          ),
          Category(
            id: 'proventricular_glands',
            label: 'Proventricular Glands',
            icon: Icons.category,
            imagePath: 'assets/images/bird/glands/digestive/proventricular_glands.webp',
          ),
          Category(
            id: 'salivary_glands',
            label: 'Salivary Glands',
            icon: Icons.category,
            imagePath: 'assets/images/bird/glands/digestive/salivary_glands.webp',
          ),
        ],
      ),
      Category(
        id: 'endocrine',
        label: 'Endocrine',
        icon: Icons.biotech,
        imagePath: 'assets/images/glands/endocrine.webp',
        subcategories: [
          Category(
            id: 'adrenal_glands',
            label: 'Adrenal Glands',
            icon: Icons.warning,
            imagePath: 'assets/images/glands/endocrine/adrenal_glands.webp',
          ),
          Category(
            id: 'gonadal_endocrine_tissue',
            label: 'Gonadal Endocrine Tissue',
            icon: Icons.circle,
            imagePath: 'assets/images/glands/endocrine/gonadal_endocrine_tissue.webp',
          ),
          Category(
            id: 'pancreatic_islets',
            label: 'Pancreatic Islets',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/glands/endocrine/pancreatic_islets.webp',
          ),
          Category(
            id: 'parathyroid_glands',
            label: 'Parathyroid Glands',
            icon: Icons.colorize,
            imagePath: 'assets/images/glands/endocrine/parathyroid_glands.webp',
          ),
          Category(
            id: 'pineal_gland',
            label: 'Pineal Gland',
            icon: Icons.brightness_3,
            imagePath: 'assets/images/glands/endocrine/pineal_gland.webp',
          ),
          Category(
            id: 'pituitary_gland',
            label: 'Pituitary Gland',
            icon: Icons.psychology,
            imagePath: 'assets/images/glands/endocrine/pituitary_gland.webp',
          ),
          Category(
            id: 'thyroid_gland',
            label: 'Thyroid Gland',
            icon: Icons.thermostat,
            imagePath: 'assets/images/glands/endocrine/thyroid_gland.webp',
          ),
          Category(
            id: 'ultimobranchial_gland',
            label: 'Ultimobranchial Gland',
            icon: Icons.bubble_chart,
            imagePath: 'assets/images/glands/endocrine/ultimobranchial_gland.webp',
          ),
          Category(
            id: 'pancreas_endocrine',
            label: 'Pancreas Endocrine',
            icon: Icons.bubble_chart,
            imagePath: 'assets/images/glands/endocrine/pancreas_endocrine.webp',
          ),
          Category(
            id: 'thymus',
            label: 'Thymus',
            icon: Icons.bubble_chart,
            imagePath: 'assets/images/glands/endocrine/thymus.webp',
          ),
        ],
      ),
      Category(
        id: 'immune',
        label: 'Immune',
        icon: Icons.shield,
        imagePath: 'assets/images/glands/immune.webp',
        subcategories: [
          Category(
            id: 'bursa_of_fabricius',
            label: 'Bursa of Fabricius',
            icon: Icons.security,
            imagePath: 'assets/images/glands/immune/bursa_of_fabricius_bird.webp',
          ),
          // Category(
          //   id: 'cecal_tonsils',
          //   label: 'Cecal Tonsils',
          //   icon: Icons.circle,
          //   imagePath: 'assets/images/bird/glands/immune/cecal_tonsils.txt',
          // ),
          // Category(
          //   id: 'diffuse_lymphatic_tissue',
          //   label: 'Diffuse Lymphatic Tissue',
          //   icon: Icons.blur_on,
          //   imagePath: 'assets/images/bird/glands/immune/diffuse_lymphatic_tissue.txt',
          // ),
        ],
      ),
      Category(
        id: 'ocular',
        label: 'Ocular',
        icon: Icons.visibility,
        imagePath: 'assets/images/glands/ocular.webp',
        subcategories: [
          Category(
            id: 'gland_of_the_third_eyelid',
            label: 'Gland of the Third Eyelid',
            icon: Icons.visibility,
            imagePath: 'assets/images/glands/ocular.webp',
          ),
          Category(
            id: 'harderian_gland',
            label: 'Harderian Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/ocular.webp',
          ),
          Category(
            id: 'lacrimal_gland',
            label: 'Lacrimal Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/ocular.webp',
          ),
        ],
      ),
      Category(
        id: 'reproductive',
        label: 'Reproductive',
        icon: Icons.favorite,
        imagePath: 'assets/images/glands/reproductive.webp',
        subcategories: [
          Category(
            id: 'cloacal_region_glands',
            label: 'Cloacal Region Glands',
            icon: Icons.circle,
            imagePath: 'assets/images/glands/reproductive/cloacal_region_glands.webp',
          ),
          Category(
            id: 'female',
            label: 'Female',
            icon: Icons.female,
            imagePath: 'assets/images/organs/reproductive_organs/female.webp',
            subcategories: [
              Category(
                id: 'ovary',
                label: 'Ovary',
                icon: Icons.circle,
                imagePath: 'assets/images/bird/glands/reproductive/female/ovary.webp',
              ),
              Category(
                id: 'oviduct_glands',
                label: 'Oviduct Glands',
                icon: Icons.waves,
                imagePath: 'assets/images/bird/glands/reproductive/female/oviduct_glands.webp',
              ),
            ],
          ),
          Category(
            id: 'male',
            label: 'Male',
            icon: Icons.male,
            imagePath: 'assets/images/organs/reproductive_organs/male.webp',
            subcategories: [
              Category(
                id: 'phallus',
                label: 'Phallus',
                icon: Icons.circle,
                imagePath: 'assets/images/bird/glands/reproductive/male/phallus.webp',
              ),
              Category(
                id: 'seminal_glomus',
                label: 'Seminal Glomus',
                icon: Icons.bubble_chart,
                imagePath: 'assets/images/bird/glands/reproductive/male/seminal_glomus.webp',
              ),
              Category(
                id: 'sperm_duct',
                label: 'Sperm Duct',
                icon: Icons.linear_scale,
                imagePath: 'assets/images/bird/glands/reproductive/male/sperm_duct.webp',
              ),
              Category(
                id: 'testes',
                label: 'Testes',
                icon: Icons.circle_outlined,
                imagePath: 'assets/images/bird/glands/reproductive/male/testes.webp',
              ),
            ],
          ),
        ],
      ),
      Category(
        id: 'respiratory',
        label: 'Respiratory',
        icon: Icons.air,
        imagePath: 'assets/images/glands/respiratory.webp',
        subcategories: [
          Category(
            id: 'bronchial_mucous_cells',
            label: 'Bronchial Mucous Cells',
            icon: Icons.category,
            imagePath: 'assets/images/glands/respiratory/bronchial_glands.webp',
          ),
          Category(
            id: 'harderian_respiratory',
            label: 'Harderian Respiratory',
            icon: Icons.category,
            imagePath: 'assets/images/glands/respiratory/harderian_respiratory.webp',
          ),
          Category(
            id: 'infraorbital_gland',
            label: 'Infraorbital Gland',
            icon: Icons.category,
            imagePath: 'assets/images/glands/respiratory/infraorbital_gland.webp',
          ),
          Category(
            id: 'nasal_mucous_glands',
            label: 'Nasal Mucous Glands',
            icon: Icons.category,
            imagePath: 'assets/images/glands/respiratory/nasal_mucous_glands.webp',
          ),
          Category(
            id: 'tracheal_mucous_glands',
            label: 'Tracheal Mucous Glands',
            icon: Icons.category,
            imagePath: 'assets/images/glands/respiratory/tracheal_glands.webp',
          ),
        ],
      ),
      Category(
        id: 'salivary',
        label: 'Salivary',
        icon: Icons.water_drop,
        imagePath: 'assets/images/glands/salivary.webp',
        subcategories: [
          Category(
            id: 'cricoidal_salivary_glands',
            label: 'Cricoidal Salivary Glands',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/salivary.webp',
          ),
          Category(
            id: 'esophageal_mucous_glands',
            label: 'Esophageal Mucous Glands',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/salivary.webp',
          ),
          Category(
            id: 'lingual_salivary_glands',
            label: 'Lingual Salivary Glands',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/salivary.webp',
          ),
          Category(
            id: 'mandibular_salivary_glands',
            label: 'Mandibular Salivary Glands',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/salivary.webp',
          ),
          Category(
            id: 'palatine_salivary_glands',
            label: 'Palatine Salivary Glands',
            icon: Icons.water_drop,
            imagePath: 'assets/images/glands/salivary.webp',
          ),
        ],
      ),
      Category(
        id: 'scent_protective',
        label: 'Scent & Protective',
        icon: Icons.pets,
        imagePath: 'assets/images/glands/scent_protective_bird.webp',
        subcategories: [
          Category(
            id: 'protective',
            label: 'Protective',
            icon: Icons.shield,
            imagePath: 'assets/images/glands/scent_protective/protective_bird.webp',
            subcategories: [
              Category(
                id: 'harderian_gland',
                label: 'Harderian Gland',
                icon: Icons.water_drop,
                imagePath: 'assets/images/glands/scent_protective/protective_bird.webp',
              ),
              Category(
                id: 'lacrimal_gland',
                label: 'Lacrimal Gland',
                icon: Icons.water_drop,
                imagePath: 'assets/images/glands/scent_protective/protective_bird.webp',
              ),
              Category(
                id: 'meibomian_glands',
                label: 'Meibomian Glands',
                icon: Icons.visibility,
                imagePath: 'assets/images/glands/scent_protective/protective_bird.webp',
              ),
              Category(
                id: 'nasal_salt_glands',
                label: 'Nasal Salt Glands',
                icon: Icons.water_drop,
                imagePath: 'assets/images/glands/scent_protective/protective_bird.webp',
              ),
              Category(
                id: 'third_eyelid_gland',
                label: 'Third Eyelid Gland',
                icon: Icons.visibility,
                imagePath: 'assets/images/glands/scent_protective/protective_bird.webp',
              ),
            ],
          ),
          Category(
            id: 'scent',
            label: 'Scent',
            icon: Icons.pets,
            imagePath: 'assets/images/glands/scent_protective_bird.webp',
            subcategories: [
              Category(
                id: 'aural_scent_glands',
                label: 'Aural Scent Glands',
                icon: Icons.hearing,
                imagePath: 'assets/images/glands/scent_protective_bird.webp',
              ),
              Category(
                id: 'cloacal_gland',
                label: 'Cloacal Gland',
                icon: Icons.circle,
                imagePath: 'assets/images/glands/scent_protective_bird.webp',
              ),
              Category(
                id: 'skin_scent_micro_glands',
                label: 'Skin Scent Micro Glands',
                icon: Icons.spa,
                imagePath: 'assets/images/glands/scent_protective_bird.webp',
              ),
              Category(
                id: 'uropygial_gland',
                label: 'Uropygial Gland',
                icon: Icons.water_drop,
                imagePath: 'assets/images/glands/scent_protective_bird.webp',
              ),
            ],
          ),
        ],
      ),
    ];
  }
}
