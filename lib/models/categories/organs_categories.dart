import 'package:flutter/material.dart';
import '../category.dart';

class OrgansCategories {
  /// Get organs categories for a specific animal
  static List<Category> getOrgansCategoriesForAnimal(String animalId) {
    final categories = <Category>[];

    // Abdomen organs - different for each animal
    List<Category> abdominalSubcategories;
    if (animalId.toLowerCase() == 'bird') {
      abdominalSubcategories = [
        Category(
          id: 'gallbladder',
          label: 'Gallbladder',
          icon: Icons.opacity,
          imagePath: 'assets/images/organs/abdomen/gallbladder.webp',
        ),
        Category(
          id: 'intestines',
          label: 'Intestines',
          icon: Icons.linear_scale,
          imagePath: 'assets/images/organs/abdomen/intestines.webp',
        ),
        Category(
          id: 'liver',
          label: 'Liver',
          icon: Icons.local_hospital,
          imagePath: 'assets/images/organs/abdomen/liver.webp',
        ),
        Category(
          id: 'pancreas',
          label: 'Pancreas',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/abdomen/pancreas.webp',
        ),
        Category(
          id: 'spleen',
          label: 'Spleen',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/abdomen/spleen.webp',
        ),
        Category(
          id: 'stomach',
          label: 'Stomach',
          icon: Icons.restaurant,
          imagePath: 'assets/images/organs/abdomen/stomach.webp',
        ),
      ];
    } else if (animalId.toLowerCase() == 'horse') {
      abdominalSubcategories = [
        Category(
          id: 'kidneys',
          label: 'Kidneys',
          icon: Icons.water_drop,
          imagePath: 'assets/images/organs/abdomen/kidneys.webp',
        ),
        Category(
          id: 'large_intestine',
          label: 'Large Intestine',
          icon: Icons.linear_scale,
          imagePath: 'assets/images/organs/abdomen/large_intestine.webp',
        ),
        Category(
          id: 'liver',
          label: 'Liver',
          icon: Icons.local_hospital,
          imagePath: 'assets/images/organs/abdomen/liver.webp',
        ),
        Category(
          id: 'pancreas',
          label: 'Pancreas',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/abdomen/pancreas.webp',
        ),
        Category(
          id: 'small_intestine',
          label: 'Small Intestine',
          icon: Icons.linear_scale,
          imagePath: 'assets/images/organs/abdomen/small_intestine.webp',
        ),
        Category(
          id: 'spleen',
          label: 'Spleen',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/abdomen/spleen.webp',
        ),
        Category(
          id: 'stomach',
          label: 'Stomach',
          icon: Icons.restaurant,
          imagePath: 'assets/images/organs/abdomen/stomach.webp',
        ),
        Category(
          id: 'urinary_bladder',
          label: 'Urinary Bladder',
          icon: Icons.opacity,
          imagePath: 'assets/images/organs/abdomen/urinary_bladder.webp',
        ),
      ];
    } else {
      // Dog and cat have identical abdomen organs
      abdominalSubcategories = [
        Category(
          id: 'gallbladder',
          label: 'Gallbladder',
          icon: Icons.opacity,
          imagePath: 'assets/images/organs/abdomen/gallbladder.webp',
        ),
        Category(
          id: 'kidneys',
          label: 'Kidneys',
          icon: Icons.water_drop,
          imagePath: 'assets/images/organs/abdomen/kidneys.webp',
        ),
        Category(
          id: 'large_intestine',
          label: 'Large Intestine',
          icon: Icons.linear_scale,
          imagePath: 'assets/images/organs/abdomen/large_intestine.webp',
        ),
        Category(
          id: 'liver',
          label: 'Liver',
          icon: Icons.local_hospital,
          imagePath: 'assets/images/organs/abdomen/liver.webp',
        ),
        Category(
          id: 'pancreas',
          label: 'Pancreas',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/abdomen/pancreas.webp',
        ),
        Category(
          id: 'small_intestine',
          label: 'Small Intestine',
          icon: Icons.linear_scale,
          imagePath: 'assets/images/organs/abdomen/small_intestine.webp',
        ),
        Category(
          id: 'spleen',
          label: 'Spleen',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/abdomen/spleen.webp',
        ),
        Category(
          id: 'stomach',
          label: 'Stomach',
          icon: Icons.restaurant,
          imagePath: 'assets/images/organs/abdomen/stomach.webp',
        ),
        Category(
          id: 'urinary_bladder',
          label: 'Urinary Bladder',
          icon: Icons.opacity,
          imagePath: 'assets/images/organs/abdomen/urinary_bladder.webp',
        ),
      ];
    }
    categories.add(Category(
      id: 'abdomen',
      label: 'Abdomen',
      icon: Icons.restaurant,
      imagePath: 'assets/images/organs/abdomen.webp',
      subcategories: abdominalSubcategories,
    ));

    // Head organs - different naming for bird
    List<Category> headSubcategories;
    if (animalId.toLowerCase() == 'bird') {
      headSubcategories = [
        Category(
          id: 'brain',
          label: 'Brain',
          icon: Icons.psychology,
          imagePath: 'assets/images/organs/head/brain.webp',
        ),
        Category(
          id: 'ears',
          label: 'Ears',
          icon: Icons.hearing,
          imagePath: 'assets/images/organs/head/ears.webp',
        ),
        Category(
          id: 'eyes',
          label: 'Eyes',
          icon: Icons.visibility,
          imagePath: 'assets/images/organs/head/eyes.webp',
        ),
        Category(
          id: 'nose',
          label: 'Nose',
          icon: Icons.air,
          imagePath: 'assets/images/organs/head/nose.webp',
        ),
      ];
    } else {
      headSubcategories = [
        Category(
          id: 'brain',
          label: 'Brain',
          icon: Icons.psychology,
          imagePath: 'assets/images/organs/head/brain.webp',
        ),
        Category(
          id: 'ear',
          label: 'Ear',
          icon: Icons.hearing,
          imagePath: 'assets/images/organs/head/ear.webp',
        ),
        Category(
          id: 'eye',
          label: 'Eye',
          icon: Icons.visibility,
          imagePath: 'assets/images/organs/head/eye.webp',
        ),
        Category(
          id: 'nose',
          label: 'Nose',
          icon: Icons.air,
          imagePath: 'assets/images/organs/head/nose.webp',
        ),
      ];
    }
    categories.add(Category(
      id: 'head',
      label: 'Head',
      icon: Icons.face,
      imagePath: 'assets/images/organs/head.webp',
      subcategories: headSubcategories,
    ));

    // Neck organs - common for all animals
    categories.add(Category(
      id: 'neck',
      label: 'Neck',
      icon: Icons.restaurant,
      imagePath: 'assets/images/organs/neck.webp',
      subcategories: [
        Category(
          id: 'esophagus',
          label: 'Esophagus',
          icon: Icons.mic,
          imagePath: 'assets/images/organs/neck/esophagus.webp',
        ),
        Category(
          id: 'larynx',
          label: 'Larynx',
          icon: Icons.mic,
          imagePath: 'assets/images/organs/neck/larynx.webp',
        ),
        Category(
          id: 'pharynx',
          label: 'Pharynx',
          icon: Icons.mic,
          imagePath: 'assets/images/organs/neck/pharynx.webp',
        ),
        Category(
          id: 'trachea',
          label: 'Trachea',
          icon: Icons.mic,
          imagePath: 'assets/images/organs/neck/trachea.webp',
        ),
      ],
    ));

    // Pelvis organs - different for bird vs others
    if (animalId.toLowerCase() == 'bird') {
      // Bird pelvis has female, male, and kidneys
      categories.add(Category(
        id: 'pelvis',
        label: 'Pelvis',
        icon: Icons.restaurant,
        imagePath: 'assets/images/organs/pelvis.webp',
        subcategories: [
          Category(
            id: 'female',
            label: 'Female',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/pelvis/female.webp',
            subcategories: [
              Category(
                id: 'cloaca',
                label: 'Cloaca',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/female/cloaca.webp',
              ),
              Category(
                id: 'infundibulum',
                label: 'Infundibulum',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/female/infundibulum.webp',
              ),
              Category(
                id: 'isthmus',
                label: 'Isthmus',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/female/isthmus.webp',
              ),
              Category(
                id: 'magnum',
                label: 'Magnum',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/female/magnum.webp',
              ),
              Category(
                id: 'ovary',
                label: 'Ovary',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/female/ovary.webp',
              ),
              Category(
                id: 'uterus_shell_gland',
                label: 'Uterus Shell Gland',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/female/uterus_shell_gland.webp',
              ),
              Category(
                id: 'vagina',
                label: 'Vagina',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/female/vagina.webp',
              ),
            ],
          ),
          Category(
            id: 'kidneys',
            label: 'Kidneys',
            icon: Icons.water_drop,
            imagePath: 'assets/images/organs/pelvis/kidneys.webp',
          ),
          Category(
            id: 'male',
            label: 'Male',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/pelvis/male.webp',
            subcategories: [
              Category(
                id: 'accessory_glands',
                label: 'Accessory Glands',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/male/accessory_glands.webp',
              ),
              Category(
                id: 'epididymis',
                label: 'Epididymis',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/male/epididymis.webp',
              ),
              Category(
                id: 'phallus',
                label: 'Phallus',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/male/phallus.webp',
              ),
              Category(
                id: 'sheath',
                label: 'Sheath',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/male/sheath.webp',
              ),
              Category(
                id: 'sperm_duct',
                label: 'Sperm Duct',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/male/sperm_duct.webp',
              ),
              Category(
                id: 'testes',
                label: 'Testes',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/male/testes.webp',
              ),
            ],
          ),
        ],
      ));
    } else {
      // Horse, dog, and cat have similar pelvis structure
      List<Category> pelvisMaleSubcategories = [
        Category(
          id: 'epididymis',
          label: 'Epididymis',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/pelvis/male/epididymis.webp',
        ),
        Category(
          id: 'sperm_duct',
          label: 'Sperm Duct',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/pelvis/male/sperm_duct.webp',
        ),
        Category(
          id: 'testes',
          label: 'Testes',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/pelvis/male/testes.webp',
        ),
      ];

      // Horse has additional male organs
      if (animalId.toLowerCase() == 'horse') {
        pelvisMaleSubcategories.addAll([
          Category(
            id: 'penis',
            label: 'Penis',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/pelvis/male/penis.webp',
          ),
          Category(
            id: 'sheath',
            label: 'Sheath',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/pelvis/male/sheath.webp',
          ),
          Category(
            id: 'spermatic_cord',
            label: 'Spermatic Cord',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/pelvis/male/spermatic_cord.webp',
          ),
        ]);
      }

      categories.add(Category(
        id: 'pelvis',
        label: 'Pelvis',
        icon: Icons.restaurant,
        imagePath: 'assets/images/organs/pelvis.webp',
        subcategories: [
          Category(
            id: 'anus',
            label: 'Anus',
            icon: Icons.opacity,
            imagePath: 'assets/images/organs/pelvis/anus.webp',
          ),
          Category(
            id: 'female',
            label: 'Female',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/pelvis/female.webp',
            subcategories: [
              Category(
                id: 'ovaries',
                label: 'Ovaries',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/female/ovaries.webp',
              ),
              Category(
                id: 'uterine_tubes',
                label: 'Uterine Tubes',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/female/uterine_tubes.webp',
              ),
              Category(
                id: 'uterus',
                label: 'Uterus',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/female/uterus.webp',
              ),
              Category(
                id: 'vagina',
                label: 'Vagina',
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/organs/pelvis/female/vagina.webp',
              ),
            ],
          ),
          Category(
            id: 'male',
            label: 'Male',
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/organs/pelvis/male.webp',
            subcategories: pelvisMaleSubcategories,
          ),
          Category(
            id: 'rectum',
            label: 'Rectum',
            icon: Icons.local_hospital,
            imagePath: 'assets/images/organs/pelvis/rectum.webp',
          ),
          Category(
            id: 'urethra',
            label: 'Urethra',
            icon: Icons.restaurant,
            imagePath: 'assets/images/organs/pelvis/urethra.webp',
          ),
        ],
      ));
    }

    // Reproductive organs - different for each animal
    List<Category> reproductiveFemaleSubcategories;
    List<Category> reproductiveMaleSubcategories;

    if (animalId.toLowerCase() == 'bird') {
      reproductiveFemaleSubcategories = [
        Category(
          id: 'cloaca',
          label: 'Cloaca',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/female/cloaca.webp',
        ),
        Category(
          id: 'gonads',
          label: 'Gonads',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/female/gonads.webp',
        ),
        Category(
          id: 'infundibulum',
          label: 'Infundibulum',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/female/infundibulum.webp',
        ),
        Category(
          id: 'isthmus',
          label: 'Isthmus',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/female/isthmus.webp',
        ),
        Category(
          id: 'magnum',
          label: 'Magnum',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/female/magnum.webp',
        ),
        Category(
          id: 'ovary',
          label: 'Ovary',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/female/ovary.webp',
        ),
        Category(
          id: 'uterus_shell_gland',
          label: 'Uterus Shell Gland',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/female/uterus_shell_gland.webp',
        ),
        Category(
          id: 'vagina',
          label: 'Vagina',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/female/vagina.webp',
        ),
      ];

      reproductiveMaleSubcategories = [
        Category(
          id: 'accessory_glands',
          label: 'Accessory Glands',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/accessory_glands.webp',
        ),
        Category(
          id: 'epididymis',
          label: 'Epididymis',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/epididymis.webp',
        ),
        Category(
          id: 'gonads_male_bird',
          label: 'Gonads Male Bird',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/gonads_male_bird.webp',
        ),
        Category(
          id: 'phallus',
          label: 'Phallus',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/phallus.webp',
        ),
        Category(
          id: 'sheath',
          label: 'Sheath',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/sheath.webp',
        ),
        Category(
          id: 'sperm_duct',
          label: 'Sperm Duct',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/sperm_duct.webp',
        ),
        Category(
          id: 'testes',
          label: 'Testes',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/testes.webp',
        ),
      ];
    } else if (animalId.toLowerCase() == 'horse') {
      reproductiveFemaleSubcategories = [
        Category(
          id: 'cervix',
          label: 'Cervix',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/female/cervix.webp',
        ),
        Category(
          id: 'gonads',
          label: 'Gonads',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/female/gonads.webp',
        ),
        Category(
          id: 'ovaries',
          label: 'Ovaries',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/female/ovaries.webp',
        ),
        Category(
          id: 'uterine_tubes',
          label: 'Uterine Tubes',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/female/uterine_tubes.webp',
        ),
        Category(
          id: 'uterus',
          label: 'Uterus',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/female/uterus.webp',
        ),
        Category(
          id: 'vagina',
          label: 'Vagina',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/female/vagina.webp',
        ),
      ];

      reproductiveMaleSubcategories = [
        Category(
          id: 'accessory_glands',
          label: 'Accessory Glands',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/accessory_glands.webp',
        ),
        Category(
          id: 'epididymis',
          label: 'Epididymis',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/epididymis.webp',
        ),
        Category(
          id: 'gonads',
          label: 'Gonads',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/gonads.webp',
        ),
        Category(
          id: 'penis',
          label: 'Penis',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/penis.webp',
        ),
        Category(
          id: 'scrotum',
          label: 'Scrotum',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/scrotum.webp',
        ),
        Category(
          id: 'sheath',
          label: 'Sheath',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/sheath.webp',
        ),
        Category(
          id: 'sperm_duct',
          label: 'Sperm Duct',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/sperm_duct.webp',
        ),
        Category(
          id: 'spermatic_cord',
          label: 'Spermatic Cord',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/spermatic_cord.webp',
        ),
        Category(
          id: 'testes',
          label: 'Testes',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/testes.webp',
        ),
      ];
    } else if (animalId.toLowerCase() == 'cat') {
      reproductiveFemaleSubcategories = [
        Category(
          id: 'cervix',
          label: 'Cervix',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/female/cervix.webp',
        ),
        Category(
          id: 'gonads',
          label: 'Gonads',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/female/gonads.webp',
        ),
        Category(
          id: 'ovaries',
          label: 'Ovaries',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/female/ovaries.webp',
        ),
        Category(
          id: 'uterine_tubes',
          label: 'Uterine Tubes',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/female/uterine_tubes.webp',
        ),
        Category(
          id: 'uterus',
          label: 'Uterus',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/female/uterus.webp',
        ),
        Category(
          id: 'vagina',
          label: 'Vagina',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/female/vagina.webp',
        ),
      ];

      reproductiveMaleSubcategories = [
        Category(
          id: 'accessory_glands',
          label: 'Accessory Glands',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/accessory_glands.webp',
        ),
        Category(
          id: 'epididymis',
          label: 'Epididymis',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/epididymis.webp',
        ),
        Category(
          id: 'gonads',
          label: 'Gonads',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/gonads.webp',
        ),
        Category(
          id: 'penis',
          label: 'Penis',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/penis.webp',
        ),
        Category(
          id: 'scrotum',
          label: 'Scrotum',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/scrotum.webp',
        ),
        Category(
          id: 'sperm_duct',
          label: 'Sperm Duct',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/sperm_duct.webp',
        ),
        Category(
          id: 'testes',
          label: 'Testes',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/testes.webp',
        ),
      ];
    } else {
      // Dog
      reproductiveFemaleSubcategories = [
        Category(
          id: 'cervix',
          label: 'Cervix',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/female/cervix.webp',
        ),
        Category(
          id: 'ovaries',
          label: 'Ovaries',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/female/ovaries.webp',
        ),
        Category(
          id: 'uterine_tubes',
          label: 'Uterine Tubes',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/female/uterine_tubes.webp',
        ),
        Category(
          id: 'uterus',
          label: 'Uterus',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/female/uterus.webp',
        ),
        Category(
          id: 'vagina',
          label: 'Vagina',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/female/vagina.webp',
        ),
      ];

      reproductiveMaleSubcategories = [
        Category(
          id: 'accessory_glands',
          label: 'Accessory Glands',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/accessory_glands.webp',
        ),
        Category(
          id: 'epididymis',
          label: 'Epididymis',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/epididymis.webp',
        ),
        Category(
          id: 'penis',
          label: 'Penis',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/penis.webp',
        ),
        Category(
          id: 'scrotum',
          label: 'Scrotum',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/scrotum.webp',
        ),
        Category(
          id: 'sperm_duct',
          label: 'Sperm Duct',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/sperm_duct.webp',
        ),
        Category(
          id: 'testes',
          label: 'Testes',
          icon: Icons.scatter_plot,
          imagePath: 'assets/images/organs/reproductive_organs/male/testes.webp',
        ),
      ];
    }

    categories.add(Category(
      id: 'reproductive_organs',
      label: 'Reproductive Organs',
      icon: Icons.face,
      imagePath: 'assets/images/organs/reproductive_organs.webp',
      subcategories: [
        Category(
          id: 'female',
          label: 'Female',
          icon: Icons.visibility,
          imagePath: 'assets/images/organs/reproductive_organs/female.webp',
          subcategories: reproductiveFemaleSubcategories,
        ),
        Category(
          id: 'male',
          label: 'Male',
          icon: Icons.visibility,
          imagePath: 'assets/images/organs/reproductive_organs/male.webp',
          subcategories: reproductiveMaleSubcategories,
        ),
      ],
    ));

    // Thorax organs - common for all animals
    categories.add(Category(
      id: 'thorax',
      label: 'Thorax',
      icon: Icons.accessibility,
      imagePath: 'assets/images/organs/thorax.webp',
      subcategories: [
        Category(
          id: 'diaphragm',
          label: 'Diaphragm',
          icon: Icons.air,
          imagePath: 'assets/images/organs/thorax/diaphragm.webp',
        ),
        Category(
          id: 'heart',
          label: 'Heart',
          icon: Icons.favorite,
          imagePath: 'assets/images/organs/thorax/heart.webp',
        ),
        Category(
          id: 'lungs',
          label: 'Lungs',
          icon: Icons.air,
          imagePath: 'assets/images/organs/thorax/lungs.webp',
        ),
        Category(
          id: 'thymus',
          label: 'Thymus',
          icon: Icons.favorite,
          imagePath: 'assets/images/organs/thorax/thymus.webp',
        ),
      ],
    ));

    return categories;
  }
}
