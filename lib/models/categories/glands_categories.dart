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
            imagePath: 'assets/details/horse/glands/dermal/eccrine_glands.txt',
          ),
          Category(
            id: 'sebaceous_glands',
            label: 'Sebaceous Glands',
            icon: Icons.bubble_chart,
            imagePath: 'assets/details/horse/glands/dermal/sebaceous_glands.txt',
          ),
          Category(
            id: 'sweat_glands',
            label: 'Sweat Glands',
            icon: Icons.water_drop,
            imagePath: 'assets/details/horse/glands/dermal/sweat_glands.txt',
          ),
        ],
      ),
      Category(
        id: 'digestive',
        label: 'Digestive',
        icon: Icons.restaurant,
        subcategories: [
          Category(
            id: 'bile_duct_glands',
            label: 'Bile Duct Glands',
            icon: Icons.water,
            imagePath: 'assets/details/horse/glands/digestive/bile_duct_glands.txt',
          ),
          Category(
            id: 'brunner_glands',
            label: 'Brunner\'s Glands',
            icon: Icons.science,
            imagePath: 'assets/details/horse/glands/digestive/brunner_glands.txt',
          ),
          Category(
            id: 'gastric_glands',
            label: 'Gastric Glands',
            icon: Icons.local_dining,
            imagePath: 'assets/details/horse/glands/digestive/gastric_glands.txt',
          ),
          Category(
            id: 'goblet_cells',
            label: 'Goblet Cells',
            icon: Icons.blur_circular,
            imagePath: 'assets/details/horse/glands/digestive/goblet_cells.txt',
          ),
          Category(
            id: 'intestinal_glands',
            label: 'Intestinal Glands',
            icon: Icons.linear_scale,
            imagePath: 'assets/details/horse/glands/digestive/intestinal_glands.txt',
          ),
          Category(
            id: 'von_ebners_glands',
            label: 'Von Ebner\'s Glands',
            icon: Icons.waves,
            imagePath: 'assets/details/horse/glands/digestive/von_ebners_glands.txt',
          ),
        ],
      ),
      Category(
        id: 'endocrine',
        label: 'Endocrine',
        icon: Icons.biotech,
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
        subcategories: [
          Category(
            id: 'hymus_gland',
            label: 'Thymus Gland',
            icon: Icons.security,
            imagePath: 'assets/details/horse/glands/immune/hymus_gland.txt',
          ),
          Category(
            id: 'lymph_glands',
            label: 'Lymph Glands',
            icon: Icons.bubble_chart,
            imagePath: 'assets/details/horse/glands/immune/lymph_glands.txt',
          ),
          Category(
            id: 'lymph_nodes',
            label: 'Lymph Nodes',
            icon: Icons.radio_button_checked,
            imagePath: 'assets/details/horse/glands/immune/lymph_nodes.txt',
          ),
          Category(
            id: 'spleen',
            label: 'Spleen',
            icon: Icons.filter_vintage,
            imagePath: 'assets/details/horse/glands/immune/spleen.txt',
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
            id: 'mare',
            label: 'Mare',
            icon: Icons.female,
            imagePath: 'assets/details/horse/glands/mammary/mare.txt',
          ),
          Category(
            id: 'stallion',
            label: 'Stallion',
            icon: Icons.male,
            imagePath: 'assets/details/horse/glands/mammary/stallion.txt',
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
            imagePath: 'assets/details/horse/glands/ocular/conjunctival_glands.txt',
          ),
          Category(
            id: 'gland_of_the_third_eyelid',
            label: 'Gland of the Third Eyelid',
            icon: Icons.visibility,
            imagePath: 'assets/details/horse/glands/ocular/gland_of_the_third_eyelid.txt',
          ),
          Category(
            id: 'harderian_gland',
            label: 'Harderian Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/details/horse/glands/ocular/harderian_gland.txt',
          ),
          Category(
            id: 'lacrimal_gland',
            label: 'Lacrimal Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/details/horse/glands/ocular/lacrimal_gland.txt',
          ),
          Category(
            id: 'meibomian_glands',
            label: 'Meibomian Glands',
            icon: Icons.remove_red_eye,
            imagePath: 'assets/details/horse/glands/ocular/meibomian_glands.txt',
          ),
          Category(
            id: 'tarsal_glands',
            label: 'Tarsal Glands',
            icon: Icons.visibility,
            imagePath: 'assets/details/horse/glands/ocular/tarsal_glands.txt',
          ),
        ],
      ),
      Category(
        id: 'reproductive',
        label: 'Reproductive',
        icon: Icons.favorite,
        subcategories: [
          Category(
            id: 'female',
            label: 'Female',
            icon: Icons.female,
            subcategories: [
              Category(
                id: 'ovarian_glands',
                label: 'Ovarian Glands',
                icon: Icons.circle,
                imagePath: 'assets/details/horse/glands/reproductive/female/ovarian_glands.txt',
              ),
              Category(
                id: 'urethral_glands',
                label: 'Urethral Glands',
                icon: Icons.water_drop,
                imagePath: 'assets/details/horse/glands/reproductive/female/urethral_glands.txt',
              ),
              Category(
                id: 'uterine_glands',
                label: 'Uterine Glands',
                icon: Icons.waves,
                imagePath: 'assets/details/horse/glands/reproductive/female/uterine_glands.txt',
              ),
              Category(
                id: 'vestibular_glands',
                label: 'Vestibular Glands',
                icon: Icons.water,
                imagePath: 'assets/details/horse/glands/reproductive/female/vestibular_glands.txt',
              ),
              Category(
                id: 'vulvar_glands',
                label: 'Vulvar Glands',
                icon: Icons.bubble_chart,
                imagePath: 'assets/details/horse/glands/reproductive/female/vulvar_glands.txt',
              ),
            ],
          ),
          Category(
            id: 'male',
            label: 'Male',
            icon: Icons.male,
            subcategories: [
              Category(
                id: 'bulbourethral_glands',
                label: 'Bulbourethral Glands',
                icon: Icons.circle,
                imagePath: 'assets/details/horse/glands/reproductive/male/bulbourethral_glands.txt',
              ),
              Category(
                id: 'preputial_glands',
                label: 'Preputial Glands',
                icon: Icons.bubble_chart,
                imagePath: 'assets/details/horse/glands/reproductive/male/preputial_glands.txt',
              ),
              Category(
                id: 'prostate_gland',
                label: 'Prostate Gland',
                icon: Icons.circle_outlined,
                imagePath: 'assets/details/horse/glands/reproductive/male/prostate_gland.txt',
              ),
              Category(
                id: 'urethral_glands',
                label: 'Urethral Glands',
                icon: Icons.water_drop,
                imagePath: 'assets/details/horse/glands/reproductive/male/urethral_glands.txt',
              ),
            ],
          ),
        ],
      ),
      Category(
        id: 'respiratory',
        label: 'Respiratory',
        icon: Icons.air,
        subcategories: [
          Category(
            id: 'bronchial_glands',
            label: 'Bronchial Glands',
            icon: Icons.device_hub,
            imagePath: 'assets/details/horse/glands/respiratory/bronchial_glands.txt',
          ),
          Category(
            id: 'laryngeal_glands',
            label: 'Laryngeal Glands',
            icon: Icons.graphic_eq,
            imagePath: 'assets/details/horse/glands/respiratory/laryngeal_glands.txt',
          ),
          Category(
            id: 'nasal_glands',
            label: 'Nasal Glands',
            icon: Icons.wind_power,
            imagePath: 'assets/details/horse/glands/respiratory/nasal_glands.txt',
          ),
          Category(
            id: 'tracheal_glands',
            label: 'Tracheal Glands',
            icon: Icons.power_input,
            imagePath: 'assets/details/horse/glands/respiratory/tracheal_glands.txt',
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
            imagePath: 'assets/details/horse/glands/salivary/mandibular_gland.txt',
          ),
          Category(
            id: 'parotid_gland',
            label: 'Parotid Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/details/horse/glands/salivary/parotid_gland.txt',
          ),
          Category(
            id: 'sublingual_gland',
            label: 'Sublingual Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/details/horse/glands/salivary/sublingual_gland.txt',
          ),
        ],
      ),
      Category(
        id: 'scent_protective',
        label: 'Scent & Protective',
        icon: Icons.pets,
        subcategories: [
          Category(
            id: 'anal_glands',
            label: 'Anal Glands',
            icon: Icons.circle,
            imagePath: 'assets/details/horse/glands/scent_protective/anal_glands.txt',
          ),
          Category(
            id: 'anal_sacs',
            label: 'Anal Sacs',
            icon: Icons.circle_outlined,
            imagePath: 'assets/details/horse/glands/scent_protective/anal_sacs.txt',
          ),
          Category(
            id: 'ceruminous_glands',
            label: 'Ceruminous Glands',
            icon: Icons.hearing,
            imagePath: 'assets/details/horse/glands/scent_protective/ceruminous_glands.txt',
          ),
          Category(
            id: 'harderian_gland',
            label: 'Harderian Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/details/horse/glands/scent_protective/harderian_gland.txt',
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
            imagePath: 'assets/details/dog/glands/dermal/eccrine_glands.txt',
          ),
          Category(
            id: 'sebaceous_glands',
            label: 'Sebaceous Glands',
            icon: Icons.bubble_chart,
            imagePath: 'assets/details/dog/glands/dermal/sebaceous_glands.txt',
          ),
          Category(
            id: 'sweat_glands',
            label: 'Sweat Glands',
            icon: Icons.water_drop,
            imagePath: 'assets/details/dog/glands/dermal/sweat_glands.txt',
          ),
        ],
      ),
      Category(
        id: 'digestive',
        label: 'Digestive',
        icon: Icons.restaurant,
        subcategories: [
          Category(
            id: 'bile_duct_glands',
            label: 'Bile Duct Glands',
            icon: Icons.water,
            imagePath: 'assets/details/dog/glands/digestive/bile_duct_glands.txt',
          ),
          Category(
            id: 'brunner_glands',
            label: 'Brunner\'s Glands',
            icon: Icons.science,
            imagePath: 'assets/details/dog/glands/digestive/brunner_glands.txt',
          ),
          Category(
            id: 'gastric_glands',
            label: 'Gastric Glands',
            icon: Icons.local_dining,
            imagePath: 'assets/details/dog/glands/digestive/gastric_glands.txt',
          ),
          Category(
            id: 'goblet_cells',
            label: 'Goblet Cells',
            icon: Icons.blur_circular,
            imagePath: 'assets/details/dog/glands/digestive/goblet_cells.txt',
          ),
          Category(
            id: 'intestinal_glands',
            label: 'Intestinal Glands',
            icon: Icons.linear_scale,
            imagePath: 'assets/details/dog/glands/digestive/intestinal_glands.txt',
          ),
          Category(
            id: 'von_ebners_glands',
            label: 'Von Ebner\'s Glands',
            icon: Icons.waves,
            imagePath: 'assets/details/dog/glands/digestive/von_ebners_glands.txt',
          ),
        ],
      ),
      Category(
        id: 'endocrine',
        label: 'Endocrine',
        icon: Icons.biotech,
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
        subcategories: [
          Category(
            id: 'lymph_glands',
            label: 'Lymph Glands',
            icon: Icons.bubble_chart,
            imagePath: 'assets/details/dog/glands/immune/lymph_glands.txt',
          ),
          Category(
            id: 'lymph_nodes',
            label: 'Lymph Nodes',
            icon: Icons.radio_button_checked,
            imagePath: 'assets/details/dog/glands/immune/lymph_nodes.txt',
          ),
          Category(
            id: 'spleen',
            label: 'Spleen',
            icon: Icons.filter_vintage,
            imagePath: 'assets/details/dog/glands/immune/spleen.txt',
          ),
          Category(
            id: 'thymus_gland',
            label: 'Thymus Gland',
            icon: Icons.security,
            imagePath: 'assets/details/dog/glands/immune/thymus_gland.txt',
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
            imagePath: 'assets/details/dog/glands/mammary/bitch.txt',
          ),
          Category(
            id: 'dog',
            label: 'Dog',
            icon: Icons.male,
            imagePath: 'assets/details/dog/glands/mammary/dog.txt',
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
            imagePath: 'assets/details/dog/glands/ocular/conjunctival_glands.txt',
          ),
          Category(
            id: 'gland_of_the_third_eyelid',
            label: 'Gland of the Third Eyelid',
            icon: Icons.visibility,
            imagePath: 'assets/details/dog/glands/ocular/gland_of_the_third_eyelid.txt',
          ),
          Category(
            id: 'harderian_gland',
            label: 'Harderian Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/details/dog/glands/ocular/harderian_gland.txt',
          ),
          Category(
            id: 'lacrimal_gland',
            label: 'Lacrimal Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/details/dog/glands/ocular/lacrimal_gland.txt',
          ),
          Category(
            id: 'meibomian_glands',
            label: 'Meibomian Glands',
            icon: Icons.remove_red_eye,
            imagePath: 'assets/details/dog/glands/ocular/meibomian_glands.txt',
          ),
          Category(
            id: 'tarsal_glands',
            label: 'Tarsal Glands',
            icon: Icons.visibility,
            imagePath: 'assets/details/dog/glands/ocular/tarsal_glands.txt',
          ),
        ],
      ),
      Category(
        id: 'reproductive',
        label: 'Reproductive',
        icon: Icons.favorite,
        subcategories: [
          Category(
            id: 'female',
            label: 'Female',
            icon: Icons.female,
            subcategories: [
              Category(
                id: 'ovarian_glands',
                label: 'Ovarian Glands',
                icon: Icons.circle,
                imagePath: 'assets/details/dog/glands/reproductive/female/ovarian_glands.txt',
              ),
              Category(
                id: 'urethral_glands',
                label: 'Urethral Glands',
                icon: Icons.water_drop,
                imagePath: 'assets/details/dog/glands/reproductive/female/urethral_glands.txt',
              ),
              Category(
                id: 'uterine_glands',
                label: 'Uterine Glands',
                icon: Icons.waves,
                imagePath: 'assets/details/dog/glands/reproductive/female/uterine_glands.txt',
              ),
              Category(
                id: 'vestibular_glands',
                label: 'Vestibular Glands',
                icon: Icons.water,
                imagePath: 'assets/details/dog/glands/reproductive/female/vestibular_glands.txt',
              ),
              Category(
                id: 'vulvar_glands',
                label: 'Vulvar Glands',
                icon: Icons.bubble_chart,
                imagePath: 'assets/details/dog/glands/reproductive/female/vulvar_glands.txt',
              ),
            ],
          ),
          Category(
            id: 'male',
            label: 'Male',
            icon: Icons.male,
            subcategories: [
              Category(
                id: 'bulbourethral_glands',
                label: 'Bulbourethral Glands',
                icon: Icons.circle,
                imagePath: 'assets/details/dog/glands/reproductive/male/bulbourethral_glands.txt',
              ),
              Category(
                id: 'preputial_glands',
                label: 'Preputial Glands',
                icon: Icons.bubble_chart,
                imagePath: 'assets/details/dog/glands/reproductive/male/preputial_glands.txt',
              ),
              Category(
                id: 'prostate_gland',
                label: 'Prostate Gland',
                icon: Icons.circle_outlined,
                imagePath: 'assets/details/dog/glands/reproductive/male/prostate_gland.txt',
              ),
              Category(
                id: 'urethral_glands',
                label: 'Urethral Glands',
                icon: Icons.water_drop,
                imagePath: 'assets/details/dog/glands/reproductive/male/urethral_glands.txt',
              ),
            ],
          ),
        ],
      ),
      Category(
        id: 'respiratory',
        label: 'Respiratory',
        icon: Icons.air,
        subcategories: [
          Category(
            id: 'laryngeal_glands',
            label: 'Laryngeal Glands',
            icon: Icons.graphic_eq,
            imagePath: 'assets/details/dog/glands/respiratory/laryngeal_glands.txt',
          ),
          Category(
            id: 'nasal_glands',
            label: 'Nasal Glands',
            icon: Icons.wind_power,
            imagePath: 'assets/details/dog/glands/respiratory/nasal_glands.txt',
          ),
          Category(
            id: 'pharyngeal_glands',
            label: 'Pharyngeal Glands',
            icon: Icons.scatter_plot,
            imagePath: 'assets/details/dog/glands/respiratory/pharyngeal_glands.txt',
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
            imagePath: 'assets/details/dog/glands/salivary/mandibular_gland.txt',
          ),
          Category(
            id: 'parotid_gland',
            label: 'Parotid Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/details/dog/glands/salivary/parotid_gland.txt',
          ),
          Category(
            id: 'sublingual_gland',
            label: 'Sublingual Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/details/dog/glands/salivary/sublingual_gland.txt',
          ),
          Category(
            id: 'zygomatic_gland',
            label: 'Zygomatic Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/details/dog/glands/salivary/zygomatic_gland.txt',
          ),
        ],
      ),
      Category(
        id: 'scent_protective',
        label: 'Scent & Protective',
        icon: Icons.pets,
        subcategories: [
          Category(
            id: 'anal_glands',
            label: 'Anal Glands',
            icon: Icons.circle,
            imagePath: 'assets/details/dog/glands/scent_protective/anal_glands.txt',
          ),
          Category(
            id: 'anal_sacs',
            label: 'Anal Sacs',
            icon: Icons.circle_outlined,
            imagePath: 'assets/details/dog/glands/scent_protective/anal_sacs.txt',
          ),
          Category(
            id: 'ceruminous_glands',
            label: 'Ceruminous Glands',
            icon: Icons.hearing,
            imagePath: 'assets/details/dog/glands/scent_protective/ceruminous_glands.txt',
          ),
          Category(
            id: 'harderian_gland',
            label: 'Harderian Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/details/dog/glands/scent_protective/harderian_gland.txt',
          ),
          Category(
            id: 'perianal_glands',
            label: 'Perianal Glands',
            icon: Icons.pets,
            imagePath: 'assets/details/dog/glands/scent_protective/perianal_glands.txt',
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
            imagePath: 'assets/details/cat/glands/dermal/eccrine_glands.txt',
          ),
          Category(
            id: 'sebaceous_glands',
            label: 'Sebaceous Glands',
            icon: Icons.bubble_chart,
            imagePath: 'assets/details/cat/glands/dermal/sebaceous_glands.txt',
          ),
          Category(
            id: 'sweat_glands',
            label: 'Sweat Glands',
            icon: Icons.water_drop,
            imagePath: 'assets/details/cat/glands/dermal/sweat_glands.txt',
          ),
        ],
      ),
      Category(
        id: 'digestive',
        label: 'Digestive',
        icon: Icons.restaurant,
        subcategories: [
          Category(
            id: 'bile_duct_glands',
            label: 'Bile Duct Glands',
            icon: Icons.water,
            imagePath: 'assets/details/cat/glands/digestive/bile_duct_glands.txt',
          ),
          Category(
            id: 'brunner_glands',
            label: 'Brunner\'s Glands',
            icon: Icons.science,
            imagePath: 'assets/details/cat/glands/digestive/brunner_glands.txt',
          ),
          Category(
            id: 'gastric_glands',
            label: 'Gastric Glands',
            icon: Icons.local_dining,
            imagePath: 'assets/details/cat/glands/digestive/gastric_glands.txt',
          ),
          Category(
            id: 'goblet_cells',
            label: 'Goblet Cells',
            icon: Icons.blur_circular,
            imagePath: 'assets/details/cat/glands/digestive/goblet_cells.txt',
          ),
          Category(
            id: 'intestinal_glands',
            label: 'Intestinal Glands',
            icon: Icons.linear_scale,
            imagePath: 'assets/details/cat/glands/digestive/intestinal_glands.txt',
          ),
          Category(
            id: 'von_ebners_glands',
            label: 'Von Ebner\'s Glands',
            icon: Icons.waves,
            imagePath: 'assets/details/cat/glands/digestive/von_ebners_glands.txt',
          ),
        ],
      ),
      Category(
        id: 'endocrine',
        label: 'Endocrine',
        icon: Icons.biotech,
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
        subcategories: [
          Category(
            id: 'lymph_glands',
            label: 'Lymph Glands',
            icon: Icons.bubble_chart,
            imagePath: 'assets/details/cat/glands/immune/lymph_glands.txt',
          ),
          Category(
            id: 'lymph_nodes',
            label: 'Lymph Nodes',
            icon: Icons.radio_button_checked,
            imagePath: 'assets/details/cat/glands/immune/lymph_nodes.txt',
          ),
          Category(
            id: 'spleen',
            label: 'Spleen',
            icon: Icons.filter_vintage,
            imagePath: 'assets/details/cat/glands/immune/spleen.txt',
          ),
          Category(
            id: 'thymus_gland',
            label: 'Thymus Gland',
            icon: Icons.security,
            imagePath: 'assets/details/cat/glands/immune/thymus_gland.txt',
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
            imagePath: 'assets/details/cat/glands/mammary/queen.txt',
          ),
          Category(
            id: 'tom',
            label: 'Tom',
            icon: Icons.male,
            imagePath: 'assets/details/cat/glands/mammary/tom.txt',
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
            imagePath: 'assets/details/cat/glands/ocular/conjunctival_glands.txt',
          ),
          Category(
            id: 'gland_of_the_third_eyelid',
            label: 'Gland of the Third Eyelid',
            icon: Icons.visibility,
            imagePath: 'assets/details/cat/glands/ocular/gland_of_the_third_eyelid.txt',
          ),
          Category(
            id: 'harderian_gland',
            label: 'Harderian Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/details/cat/glands/ocular/harderian_gland.txt',
          ),
          Category(
            id: 'lacrimal_gland',
            label: 'Lacrimal Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/details/cat/glands/ocular/lacrimal_gland.txt',
          ),
          Category(
            id: 'meibomian_glands',
            label: 'Meibomian Glands',
            icon: Icons.remove_red_eye,
            imagePath: 'assets/details/cat/glands/ocular/meibomian_glands.txt',
          ),
        ],
      ),
      Category(
        id: 'reproductive',
        label: 'Reproductive',
        icon: Icons.favorite,
        subcategories: [
          Category(
            id: 'female',
            label: 'Female',
            icon: Icons.female,
            subcategories: [
              Category(
                id: 'mammary_glands',
                label: 'Mammary Glands',
                icon: Icons.child_care,
                imagePath: 'assets/details/cat/glands/reproductive/female/mammary_glands.txt',
              ),
              Category(
                id: 'ovarian_glands',
                label: 'Ovarian Glands',
                icon: Icons.circle,
                imagePath: 'assets/details/cat/glands/reproductive/female/ovarian_glands.txt',
              ),
              Category(
                id: 'uterine_glands',
                label: 'Uterine Glands',
                icon: Icons.waves,
                imagePath: 'assets/details/cat/glands/reproductive/female/uterine_glands.txt',
              ),
              Category(
                id: 'vestibular_glands',
                label: 'Vestibular Glands',
                icon: Icons.water,
                imagePath: 'assets/details/cat/glands/reproductive/female/vestibular_glands.txt',
              ),
              Category(
                id: 'vulvar_glands',
                label: 'Vulvar Glands',
                icon: Icons.bubble_chart,
                imagePath: 'assets/details/cat/glands/reproductive/female/vulvar_glands.txt',
              ),
            ],
          ),
          Category(
            id: 'male',
            label: 'Male',
            icon: Icons.male,
            subcategories: [
              Category(
                id: 'bulbourethral_glands',
                label: 'Bulbourethral Glands',
                icon: Icons.circle,
                imagePath: 'assets/details/cat/glands/reproductive/male/bulbourethral_glands.txt',
              ),
              Category(
                id: 'mammary_glands_male',
                label: 'Mammary Glands (Male)',
                icon: Icons.child_care,
                imagePath: 'assets/details/cat/glands/reproductive/male/mammary_glands_male.txt',
              ),
              Category(
                id: 'preputial_glands',
                label: 'Preputial Glands',
                icon: Icons.bubble_chart,
                imagePath: 'assets/details/cat/glands/reproductive/male/preputial_glands.txt',
              ),
              Category(
                id: 'prostate_gland',
                label: 'Prostate Gland',
                icon: Icons.circle_outlined,
                imagePath: 'assets/details/cat/glands/reproductive/male/prostate_gland.txt',
              ),
            ],
          ),
        ],
      ),
      Category(
        id: 'respiratory',
        label: 'Respiratory',
        icon: Icons.air,
        subcategories: [
          Category(
            id: 'bronchial_glands',
            label: 'Bronchial Glands',
            icon: Icons.device_hub,
            imagePath: 'assets/details/cat/glands/respiratory/bronchial_glands.txt',
          ),
          Category(
            id: 'nasal_glands',
            label: 'Nasal Glands',
            icon: Icons.wind_power,
            imagePath: 'assets/details/cat/glands/respiratory/nasal_glands.txt',
          ),
          Category(
            id: 'tracheal_glands',
            label: 'Tracheal Glands',
            icon: Icons.power_input,
            imagePath: 'assets/details/cat/glands/respiratory/tracheal_glands.txt',
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
            imagePath: 'assets/details/cat/glands/salivary/mandibular_gland.txt',
          ),
          Category(
            id: 'molar_glands',
            label: 'Molar Glands',
            icon: Icons.water_drop,
            imagePath: 'assets/details/cat/glands/salivary/molar_glands.txt',
          ),
          Category(
            id: 'parotid_gland',
            label: 'Parotid Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/details/cat/glands/salivary/parotid_gland.txt',
          ),
          Category(
            id: 'sublingual_gland',
            label: 'Sublingual Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/details/cat/glands/salivary/sublingual_gland.txt',
          ),
          Category(
            id: 'zygomatic_gland',
            label: 'Zygomatic Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/details/cat/glands/salivary/zygomatic_gland.txt',
          ),
        ],
      ),
      Category(
        id: 'scent_protective',
        label: 'Scent & Protective',
        icon: Icons.pets,
        subcategories: [
          Category(
            id: 'anal_glands',
            label: 'Anal Glands',
            icon: Icons.circle,
            imagePath: 'assets/details/cat/glands/scent_protective/anal_glands.txt',
          ),
          Category(
            id: 'anal_sacs',
            label: 'Anal Sacs',
            icon: Icons.circle_outlined,
            imagePath: 'assets/details/cat/glands/scent_protective/anal_sacs.txt',
          ),
          Category(
            id: 'caudal_glands',
            label: 'Caudal Glands',
            icon: Icons.pets,
            imagePath: 'assets/details/cat/glands/scent_protective/caudal_glands.txt',
          ),
          Category(
            id: 'ceruminous_glands',
            label: 'Ceruminous Glands',
            icon: Icons.hearing,
            imagePath: 'assets/details/cat/glands/scent_protective/ceruminous_glands.txt',
          ),
          Category(
            id: 'harderian_gland',
            label: 'Harderian Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/details/cat/glands/scent_protective/harderian_gland.txt',
          ),
          Category(
            id: 'perioral_glands',
            label: 'Perioral Glands',
            icon: Icons.circle,
            imagePath: 'assets/details/cat/glands/scent_protective/perioral_glands.txt',
          ),
          Category(
            id: 'temporal_glands',
            label: 'Temporal Glands',
            icon: Icons.circle,
            imagePath: 'assets/details/cat/glands/scent_protective/temporal_glands.txt',
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
            imagePath: 'assets/details/bird/glands/dermal/aural.txt',
          ),
          Category(
            id: 'claw_and_scale',
            label: 'Claw and Scale',
            icon: Icons.pets,
            imagePath: 'assets/details/bird/glands/dermal/claw_and_scale.txt',
          ),
          Category(
            id: 'filoplume_base',
            label: 'Filoplume Base',
            icon: Icons.spa,
            imagePath: 'assets/details/bird/glands/dermal/filoplume_base.txt',
          ),
          Category(
            id: 'skin_oil_micro',
            label: 'Skin Oil Micro',
            icon: Icons.bubble_chart,
            imagePath: 'assets/details/bird/glands/dermal/skin_oil_micro.txt',
          ),
          Category(
            id: 'uropygial',
            label: 'Uropygial',
            icon: Icons.water_drop,
            imagePath: 'assets/details/bird/glands/dermal/uropygial.txt',
          ),
        ],
      ),
      Category(
        id: 'endocrine',
        label: 'Endocrine',
        icon: Icons.biotech,
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
        subcategories: [
          Category(
            id: 'bursa_of_fabricius',
            label: 'Bursa of Fabricius',
            icon: Icons.security,
            imagePath: 'assets/details/bird/glands/immune/bursa_of_fabricius.txt',
          ),
          Category(
            id: 'cecal_tonsils',
            label: 'Cecal Tonsils',
            icon: Icons.circle,
            imagePath: 'assets/details/bird/glands/immune/cecal_tonsils.txt',
          ),
          Category(
            id: 'diffuse_lymphatic_tissue',
            label: 'Diffuse Lymphatic Tissue',
            icon: Icons.blur_on,
            imagePath: 'assets/details/bird/glands/immune/diffuse_lymphatic_tissue.txt',
          ),
          Category(
            id: 'spleen',
            label: 'Spleen',
            icon: Icons.filter_vintage,
            imagePath: 'assets/details/bird/glands/immune/spleen.txt',
          ),
          Category(
            id: 'thymus',
            label: 'Thymus',
            icon: Icons.security,
            imagePath: 'assets/images/bird/glands/immune/thymus.txt',
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
            id: 'gland_of_the_third_eyelid',
            label: 'Gland of the Third Eyelid',
            icon: Icons.visibility,
            imagePath: 'assets/details/bird/glands/ocular/gland_of_the_third_eyelid.txt',
          ),
          Category(
            id: 'harderian_gland',
            label: 'Harderian Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/details/bird/glands/ocular/harderian_gland.txt',
          ),
          Category(
            id: 'lacrimal_gland',
            label: 'Lacrimal Gland',
            icon: Icons.water_drop,
            imagePath: 'assets/details/bird/glands/ocular/lacrimal_gland.txt',
          ),
        ],
      ),
      Category(
        id: 'reproductive',
        label: 'Reproductive',
        icon: Icons.favorite,
        subcategories: [
          Category(
            id: 'cloacal_region_glands',
            label: 'Cloacal Region Glands',
            icon: Icons.circle,
            imagePath: 'assets/details/bird/glands/reproductive/cloacal_region_glands.txt',
          ),
          Category(
            id: 'female',
            label: 'Female',
            icon: Icons.female,
            subcategories: [
              Category(
                id: 'ovary',
                label: 'Ovary',
                icon: Icons.circle,
                imagePath: 'assets/details/bird/glands/reproductive/female/ovary.txt',
              ),
              Category(
                id: 'oviduct_glands',
                label: 'Oviduct Glands',
                icon: Icons.waves,
                imagePath: 'assets/details/bird/glands/reproductive/female/oviduct_glands.txt',
              ),
            ],
          ),
          Category(
            id: 'male',
            label: 'Male',
            icon: Icons.male,
            subcategories: [
              Category(
                id: 'phallus',
                label: 'Phallus',
                icon: Icons.circle,
                imagePath: 'assets/details/bird/glands/reproductive/male/phallus.txt',
              ),
              Category(
                id: 'seminal_glomus',
                label: 'Seminal Glomus',
                icon: Icons.bubble_chart,
                imagePath: 'assets/details/bird/glands/reproductive/male/seminal_glomus.txt',
              ),
              Category(
                id: 'sperm_duct',
                label: 'Sperm Duct',
                icon: Icons.linear_scale,
                imagePath: 'assets/details/bird/glands/reproductive/male/sperm_duct.txt',
              ),
              Category(
                id: 'testes',
                label: 'Testes',
                icon: Icons.circle_outlined,
                imagePath: 'assets/details/bird/glands/reproductive/male/testes.txt',
              ),
            ],
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
            imagePath: 'assets/details/bird/glands/salivary/cricoidal_salivary_glands.txt',
          ),
          Category(
            id: 'esophageal_mucous_glands',
            label: 'Esophageal Mucous Glands',
            icon: Icons.water_drop,
            imagePath: 'assets/details/bird/glands/salivary/esophageal_mucous_glands.txt',
          ),
          Category(
            id: 'lingual_salivary_glands',
            label: 'Lingual Salivary Glands',
            icon: Icons.water_drop,
            imagePath: 'assets/details/bird/glands/salivary/lingual_salivary_glands.txt',
          ),
          Category(
            id: 'mandibular_salivary_glands',
            label: 'Mandibular Salivary Glands',
            icon: Icons.water_drop,
            imagePath: 'assets/details/bird/glands/salivary/mandibular_salivary_glands.txt',
          ),
          Category(
            id: 'palatine_salivary_glands',
            label: 'Palatine Salivary Glands',
            icon: Icons.water_drop,
            imagePath: 'assets/details/bird/glands/salivary/palatine_salivary_glands.txt',
          ),
        ],
      ),
      Category(
        id: 'scnet_protective',
        label: 'Scent & Protective',
        icon: Icons.pets,
        subcategories: [
          Category(
            id: 'aural_scent_glands',
            label: 'Aural Scent Glands',
            icon: Icons.hearing,
            imagePath: 'assets/details/bird/glands/scnet_protective/aural_scent_glands.txt',
          ),
          Category(
            id: 'skin_scent_micro_glands',
            label: 'Skin Scent Micro Glands',
            icon: Icons.spa,
            imagePath: 'assets/details/bird/glands/scnet_protective/skin_scent_micro_glands.txt',
          ),
          Category(
            id: 'uropygial_gland_scent_protective',
            label: 'Uropygial Gland (Scent & Protective)',
            icon: Icons.water_drop,
            imagePath: 'assets/details/bird/glands/scnet_protective/uropygial_gland_scent_protective.txt',
          ),
        ],
      ),
    ];
  }
}
