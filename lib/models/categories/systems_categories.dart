import 'package:flutter/material.dart';
import '../category.dart';

class SystemsCategories {
  /// Helper function to convert system ID to proper label
  static String _systemIdToLabel(String id) {
    final words = id.split('_');
    return words.map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }

  /// Helper function to get icon for system type
  static IconData _getSystemIcon(String systemId) {
    switch (systemId) {
      case 'cardiovascular_system':
        return Icons.bloodtype;
      case 'respiratory_system':
        return Icons.air;
      case 'digestive_system':
      case 'digestive _system':
        return Icons.restaurant;
      case 'urinary_system':
        return Icons.water_drop;
      case 'reproductive_system':
        return Icons.favorite;
      case 'endocrine_system':
        return Icons.scatter_plot;
      case 'lymphatic_system':
        return Icons.water;
      case 'nervous_system':
        return Icons.psychology;
      case 'integumentary_system':
        return Icons.layers;
      case 'hepatobiliary_system':
        return Icons.local_hospital;
      case 'lumbosacral_plexus':
        return Icons.linear_scale;
      case 'cranial_nerves':
        return Icons.psychology;
      case 'brachial_plexus_c6_t2':
        return Icons.linear_scale;
      case 'regional_lymph_nodes':
        return Icons.water;
      case 'lower_tract':
      case 'upper_tract':
      case 'upper':
      case 'lower':
        return Icons.restaurant;
      case 'autonomic':
      case 'cns':
      case 'pns':
        return Icons.psychology;
      case 'female':
      case 'male':
        return Icons.favorite;
      case 'lumbar_plexus':
      case 'sacra_plexus':
      case 'sacral_plexus':
      case 'major_nerves':
        return Icons.linear_scale;
      default:
        return Icons.category;
    }
  }

  /// Get body systems categories for a specific animal
  static List<Category> getSystemsCategoriesForAnimal(String animalId) {
    switch (animalId.toLowerCase()) {
      case 'horse':
        return _getHorseSystemsCategories();
      case 'dog':
        return _getDogSystemsCategories();
      case 'cat':
        return _getCatSystemsCategories();
      case 'bird':
        return _getBirdSystemsCategories();
      default:
        return [];
    }
  }

  static List<Category> _getHorseSystemsCategories() {
    return [
      // Cardiovascular System
      Category(
        id: 'cardiovascular_system',
        label: _systemIdToLabel('cardiovascular_system'),
        icon: _getSystemIcon('cardiovascular_system'),
        imagePath: 'assets/images/systems/cardiovascular_system.webp',
        subcategories: [
          Category(id: 'arteries', label: _systemIdToLabel('arteries'), icon: Icons.linear_scale),
          Category(id: 'blood', label: _systemIdToLabel('blood'), icon: Icons.bloodtype),
          Category(id: 'capillaries', label: _systemIdToLabel('capillaries'), icon: Icons.linear_scale),
          Category(id: 'heart', label: _systemIdToLabel('heart'), icon: Icons.favorite),
          Category(id: 'pericardium', label: _systemIdToLabel('pericardium'), icon: Icons.favorite),
          Category(id: 'veins', label: _systemIdToLabel('veins'), icon: Icons.linear_scale),
        ],
      ),
      // Cranial Nerves
      Category(
        id: 'cranial_nerves',
        label: _systemIdToLabel('cranial_nerves'),
        icon: _getSystemIcon('cranial_nerves'),
        subcategories: [
          Category(id: 'abducent_nerve_vi', label: _systemIdToLabel('abducent_nerve_vi'), icon: Icons.psychology),
          Category(id: 'accessory_nerve_xi', label: _systemIdToLabel('accessory_nerve_xi'), icon: Icons.psychology),
          Category(id: 'facial_nerve_vii', label: _systemIdToLabel('facial_nerve_vii'), icon: Icons.psychology),
          Category(id: 'glossopharyngeal_nerve_ix', label: _systemIdToLabel('glossopharyngeal_nerve_ix'), icon: Icons.psychology),
          Category(id: 'hypoglossal_nerve_xii', label: _systemIdToLabel('hypoglossal_nerve_xii'), icon: Icons.psychology),
          Category(id: 'oculomotor_nerve_iii', label: _systemIdToLabel('oculomotor_nerve_iii'), icon: Icons.psychology),
          Category(id: 'olfactory_nerve_i', label: _systemIdToLabel('olfactory_nerve_i'), icon: Icons.psychology),
          Category(id: 'optic_nerve_ii', label: _systemIdToLabel('optic_nerve_ii'), icon: Icons.psychology),
          Category(id: 'trigeminal_nerve_v', label: _systemIdToLabel('trigeminal_nerve_v'), icon: Icons.psychology),
          Category(id: 'trochlear_nerve_iv', label: _systemIdToLabel('trochlear_nerve_iv'), icon: Icons.psychology),
          Category(id: 'vagus_nerve_x', label: _systemIdToLabel('vagus_nerve_x'), icon: Icons.psychology),
          Category(id: 'vestibulocochlear_nerve_viii', label: _systemIdToLabel('vestibulocochlear_nerve_viii'), icon: Icons.psychology),
        ],
      ),
      // Digestive System
      Category(
        id: 'digestive_system',
        label: _systemIdToLabel('digestive_system'),
        icon: _getSystemIcon('digestive_system'),
        imagePath: 'assets/images/systems/digestive_system.webp',
        subcategories: [
          Category(
            id: 'lower_tract',
            label: _systemIdToLabel('lower_tract'),
            icon: _getSystemIcon('lower_tract'),
            subcategories: [
              Category(id: 'anus', label: _systemIdToLabel('anus'), icon: Icons.circle),
              Category(id: 'large_intestine', label: _systemIdToLabel('large_intestine'), icon: Icons.linear_scale),
              Category(id: 'liver', label: _systemIdToLabel('liver'), icon: Icons.local_hospital),
              Category(id: 'pancreas', label: _systemIdToLabel('pancreas'), icon: Icons.scatter_plot),
              Category(id: 'rectum', label: _systemIdToLabel('rectum'), icon: Icons.circle),
              Category(id: 'small_intestine', label: _systemIdToLabel('small_intestine'), icon: Icons.linear_scale),
            ],
          ),
          Category(
            id: 'upper_tract',
            label: _systemIdToLabel('upper_tract'),
            icon: _getSystemIcon('upper_tract'),
            subcategories: [
              Category(id: 'esophagus', label: _systemIdToLabel('esophagus'), icon: Icons.linear_scale),
              Category(id: 'mouth', label: _systemIdToLabel('mouth'), icon: Icons.circle),
              Category(id: 'pharynx', label: _systemIdToLabel('pharynx'), icon: Icons.circle),
              Category(id: 'salivary_glands', label: _systemIdToLabel('salivary_glands'), icon: Icons.scatter_plot),
              Category(id: 'stomach', label: _systemIdToLabel('stomach'), icon: Icons.restaurant),
              Category(id: 'teeth', label: _systemIdToLabel('teeth'), icon: Icons.circle),
              Category(id: 'tongue', label: _systemIdToLabel('tongue'), icon: Icons.circle),
            ],
          ),
        ],
      ),
      // Endocrine System
      Category(
        id: 'endocrine_system',
        label: _systemIdToLabel('endocrine_system'),
        icon: _getSystemIcon('endocrine_system'),
        imagePath: 'assets/images/systems/endocrine_system.webp',
        subcategories: [
          Category(id: 'adrenal_glands', label: _systemIdToLabel('adrenal_glands'), icon: Icons.scatter_plot),
          Category(id: 'endocrine_axis', label: _systemIdToLabel('endocrine_axis'), icon: Icons.scatter_plot),
          Category(id: 'gonads', label: _systemIdToLabel('gonads'), icon: Icons.scatter_plot),
          Category(id: 'hypothalamus', label: _systemIdToLabel('hypothalamus'), icon: Icons.scatter_plot),
          Category(id: 'pancreas_endocrine', label: _systemIdToLabel('pancreas_endocrine'), icon: Icons.scatter_plot),
          Category(id: 'parathyroid_glands', label: _systemIdToLabel('parathyroid_glands'), icon: Icons.scatter_plot),
          Category(id: 'pineal_gland', label: _systemIdToLabel('pineal_gland'), icon: Icons.scatter_plot),
          Category(id: 'pituitary', label: _systemIdToLabel('pituitary'), icon: Icons.scatter_plot),
          Category(id: 'thymus_endocrine', label: _systemIdToLabel('thymus_endocrine'), icon: Icons.scatter_plot),
          Category(id: 'thyroid_gland', label: _systemIdToLabel('thyroid_gland'), icon: Icons.scatter_plot),
        ],
      ),
      // Hepatobiliary System
      Category(
        id: 'hepatobiliary_system',
        label: _systemIdToLabel('hepatobiliary_system'),
        icon: _getSystemIcon('hepatobiliary_system'),
        subcategories: [
          Category(id: 'bile_canaliculi', label: _systemIdToLabel('bile_canaliculi'), icon: Icons.linear_scale),
          Category(id: 'bile_ducts', label: _systemIdToLabel('bile_ducts'), icon: Icons.linear_scale),
          Category(id: 'bile_storage_and_flow', label: _systemIdToLabel('bile_storage_and_flow'), icon: Icons.water),
          Category(id: 'common_bile_duct', label: _systemIdToLabel('common_bile_duct'), icon: Icons.linear_scale),
          Category(id: 'cystic_duct', label: _systemIdToLabel('cystic_duct'), icon: Icons.linear_scale),
          Category(id: 'hepatic_artery', label: _systemIdToLabel('hepatic_artery'), icon: Icons.linear_scale),
          Category(id: 'hepatic_ducts', label: _systemIdToLabel('hepatic_ducts'), icon: Icons.linear_scale),
          Category(id: 'hepatic_lobules', label: _systemIdToLabel('hepatic_lobules'), icon: Icons.circle),
          Category(id: 'hepatic_vein', label: _systemIdToLabel('hepatic_vein'), icon: Icons.linear_scale),
          Category(id: 'kupffer_cells', label: _systemIdToLabel('kupffer_cells'), icon: Icons.circle),
          Category(id: 'liver', label: _systemIdToLabel('liver'), icon: Icons.local_hospital),
          Category(id: 'portal_vein', label: _systemIdToLabel('portal_vein'), icon: Icons.linear_scale),
        ],
      ),
      // Integumentary System
      Category(
        id: 'integumentary_system',
        label: _systemIdToLabel('integumentary_system'),
        icon: _getSystemIcon('integumentary_system'),
        subcategories: [
          Category(id: 'dermis', label: _systemIdToLabel('dermis'), icon: Icons.layers),
          Category(id: 'epidermis', label: _systemIdToLabel('epidermis'), icon: Icons.layers),
          Category(id: 'glands', label: _systemIdToLabel('glands'), icon: Icons.scatter_plot),
          Category(id: 'hair_coat', label: _systemIdToLabel('hair_coat'), icon: Icons.brush),
          Category(id: 'hair_follicle_receptors', label: _systemIdToLabel('hair_follicle_receptors'), icon: Icons.sensors),
          Category(id: 'hypodermis', label: _systemIdToLabel('hypodermis'), icon: Icons.layers),
          Category(id: 'mane_tail', label: _systemIdToLabel('mane_tail'), icon: Icons.brush),
          Category(id: 'pigmentation_color_patterns', label: _systemIdToLabel('pigmentation_color_patterns'), icon: Icons.palette),
          Category(id: 'protective_structures', label: _systemIdToLabel('protective_structures'), icon: Icons.shield),
          Category(id: 'whiskers_vibrissae', label: _systemIdToLabel('whiskers_vibrissae'), icon: Icons.sensors),
        ],
      ),
      // Lumbosacral Plexus
      Category(
        id: 'lumbosacral_plexus',
        label: _systemIdToLabel('lumbosacral_plexus'),
        icon: _getSystemIcon('lumbosacral_plexus'),
        subcategories: [
          Category(
            id: 'lumbar_plexus',
            label: _systemIdToLabel('lumbar_plexus'),
            icon: _getSystemIcon('lumbar_plexus'),
            subcategories: [
              Category(id: 'femoral_nerve', label: _systemIdToLabel('femoral_nerve'), icon: Icons.linear_scale),
              Category(id: 'lateral_cutaneous_femoral_nerve', label: _systemIdToLabel('lateral_cutaneous_femoral_nerve'), icon: Icons.linear_scale),
              Category(id: 'obturator_nerve', label: _systemIdToLabel('obturator_nerve'), icon: Icons.linear_scale),
            ],
          ),
          Category(
            id: 'major_nerves',
            label: _systemIdToLabel('major_nerves'),
            icon: _getSystemIcon('major_nerves'),
            subcategories: [
              Category(id: 'brachial_plexus', label: _systemIdToLabel('brachial_plexus'), icon: Icons.linear_scale),
              Category(id: 'median_nerve', label: _systemIdToLabel('median_nerve'), icon: Icons.linear_scale),
              Category(id: 'radial_nerve', label: _systemIdToLabel('radial_nerve'), icon: Icons.linear_scale),
              Category(id: 'ulnar_nerve', label: _systemIdToLabel('ulnar_nerve'), icon: Icons.linear_scale),
            ],
          ),
          Category(
            id: 'sacra_plexus',
            label: _systemIdToLabel('sacra_plexus'),
            icon: _getSystemIcon('sacra_plexus'),
            subcategories: [
              Category(id: 'gluteal_nerves', label: _systemIdToLabel('gluteal_nerves'), icon: Icons.linear_scale),
              Category(id: 'pudendal_nerve', label: _systemIdToLabel('pudendal_nerve'), icon: Icons.linear_scale),
              Category(id: 'sciatic_nerve', label: _systemIdToLabel('sciatic_nerve'), icon: Icons.linear_scale),
            ],
          ),
        ],
      ),
      // Lymphatic System
      Category(
        id: 'lymphatic_system',
        label: _systemIdToLabel('lymphatic_system'),
        icon: _getSystemIcon('lymphatic_system'),
        imagePath: 'assets/images/systems/lymphatic_system.webp',
        subcategories: [
          Category(id: 'lymph', label: _systemIdToLabel('lymph'), icon: Icons.water),
          Category(id: 'lymph_capillaries', label: _systemIdToLabel('lymph_capillaries'), icon: Icons.water),
          Category(id: 'lymph_nodes', label: _systemIdToLabel('lymph_nodes'), icon: Icons.water),
          Category(id: 'lymph_vessels', label: _systemIdToLabel('lymph_vessels'), icon: Icons.water),
          Category(id: 'peyers_patches', label: _systemIdToLabel('peyers_patches'), icon: Icons.water),
          Category(id: 'right_lymphatic_duct', label: _systemIdToLabel('right_lymphatic_duct'), icon: Icons.water),
          Category(id: 'spleen', label: _systemIdToLabel('spleen'), icon: Icons.water),
          Category(id: 'thoracic_duct', label: _systemIdToLabel('thoracic_duct'), icon: Icons.water),
          Category(id: 'thymus', label: _systemIdToLabel('thymus'), icon: Icons.water),
          Category(id: 'tonsils', label: _systemIdToLabel('tonsils'), icon: Icons.water),
        ],
      ),
      // Nervous System
      Category(
        id: 'nervous_system',
        label: _systemIdToLabel('nervous_system'),
        icon: _getSystemIcon('nervous_system'),
        imagePath: 'assets/images/systems/nervous_system.webp',
        subcategories: [
          Category(
            id: 'autonomic',
            label: _systemIdToLabel('autonomic'),
            icon: _getSystemIcon('autonomic'),
            subcategories: [
              Category(id: 'enteric_system', label: _systemIdToLabel('enteric_system'), icon: Icons.settings),
              Category(id: 'parasympathetic', label: _systemIdToLabel('parasympathetic'), icon: Icons.settings),
              Category(id: 'sympathetic', label: _systemIdToLabel('sympathetic'), icon: Icons.settings),
            ],
          ),
          Category(
            id: 'cns',
            label: _systemIdToLabel('cns').toUpperCase(),
            icon: _getSystemIcon('cns'),
            subcategories: [
              Category(id: 'brain', label: _systemIdToLabel('brain'), icon: Icons.psychology),
              Category(id: 'brainstem', label: _systemIdToLabel('brainstem'), icon: Icons.psychology),
              Category(id: 'cerebellum', label: _systemIdToLabel('cerebellum'), icon: Icons.psychology),
              Category(id: 'spinal_cord', label: _systemIdToLabel('spinal_cord'), icon: Icons.psychology),
            ],
          ),
          Category(
            id: 'pns',
            label: _systemIdToLabel('pns').toUpperCase(),
            icon: _getSystemIcon('pns'),
            subcategories: [
              Category(id: 'brachial_plexus', label: _systemIdToLabel('brachial_plexus'), icon: Icons.scatter_plot),
              Category(id: 'cranial_nerves', label: _systemIdToLabel('cranial_nerves'), icon: Icons.scatter_plot),
              Category(id: 'motor_nerves', label: _systemIdToLabel('motor_nerves'), icon: Icons.scatter_plot),
              Category(id: 'sensory_nerves', label: _systemIdToLabel('sensory_nerves'), icon: Icons.scatter_plot),
              Category(id: 'spinal_nerves', label: _systemIdToLabel('spinal_nerves'), icon: Icons.scatter_plot),
            ],
          ),
        ],
      ),
      // Reproductive System
      Category(
        id: 'reproductive_system',
        label: _systemIdToLabel('reproductive_system'),
        icon: _getSystemIcon('reproductive_system'),
        imagePath: 'assets/images/systems/reproductive_system.webp',
        subcategories: [
          Category(
            id: 'female',
            label: _systemIdToLabel('female'),
            icon: _getSystemIcon('female'),
            subcategories: [
              Category(id: 'cervix', label: _systemIdToLabel('cervix'), icon: Icons.circle),
              Category(id: 'external_genitalia', label: _systemIdToLabel('external_genitalia'), icon: Icons.crop_portrait),
              Category(id: 'mammary_glands', label: _systemIdToLabel('mammary_glands'), icon: Icons.scatter_plot),
              Category(id: 'ovaries', label: _systemIdToLabel('ovaries'), icon: Icons.circle),
              Category(id: 'placenta', label: _systemIdToLabel('placenta'), icon: Icons.favorite),
              Category(id: 'uterine_tubes', label: _systemIdToLabel('uterine_tubes'), icon: Icons.linear_scale),
              Category(id: 'uterus', label: _systemIdToLabel('uterus'), icon: Icons.favorite),
              Category(id: 'vagina', label: _systemIdToLabel('vagina'), icon: Icons.linear_scale),
            ],
          ),
          Category(
            id: 'male',
            label: _systemIdToLabel('male'),
            icon: _getSystemIcon('male'),
            subcategories: [
              Category(id: 'accessory_glands', label: _systemIdToLabel('accessory_glands'), icon: Icons.scatter_plot),
              Category(id: 'epididymis', label: _systemIdToLabel('epididymis'), icon: Icons.circle),
              Category(id: 'mammary_glands', label: _systemIdToLabel('mammary_glands'), icon: Icons.scatter_plot),
              Category(id: 'penis', label: _systemIdToLabel('penis'), icon: Icons.scatter_plot),
              Category(id: 'prepuce', label: _systemIdToLabel('prepuce'), icon: Icons.scatter_plot),
              Category(id: 'sperm_duct', label: _systemIdToLabel('sperm_duct'), icon: Icons.linear_scale),
              Category(id: 'testes', label: _systemIdToLabel('testes'), icon: Icons.circle),
            ],
          ),
        ],
      ),
      // Respiratory System
      Category(
        id: 'respiratory_system',
        label: _systemIdToLabel('respiratory_system'),
        icon: _getSystemIcon('respiratory_system'),
        imagePath: 'assets/images/systems/respiratory_system.webp',
        subcategories: [
          Category(
            id: 'lower',
            label: _systemIdToLabel('lower'),
            icon: _getSystemIcon('lower'),
            subcategories: [
              Category(id: 'alveoli', label: _systemIdToLabel('alveoli'), icon: Icons.circle),
              Category(id: 'bronchi', label: _systemIdToLabel('bronchi'), icon: Icons.linear_scale),
              Category(id: 'bronchioles', label: _systemIdToLabel('bronchioles'), icon: Icons.linear_scale),
              Category(id: 'diaphragm', label: _systemIdToLabel('diaphragm'), icon: Icons.fitness_center),
              Category(id: 'lungs', label: _systemIdToLabel('lungs'), icon: Icons.air),
              Category(id: 'pleura', label: _systemIdToLabel('pleura'), icon: Icons.layers),
              Category(id: 'trachea', label: _systemIdToLabel('trachea'), icon: Icons.linear_scale),
            ],
          ),
          Category(
            id: 'upper',
            label: _systemIdToLabel('upper'),
            icon: _getSystemIcon('upper'),
            subcategories: [
              Category(id: 'epiglottis', label: _systemIdToLabel('epiglottis'), icon: Icons.layers),
              Category(id: 'ethmoid_turbinates', label: _systemIdToLabel('ethmoid_turbinates'), icon: Icons.layers),
              Category(id: 'eustachian_tube', label: _systemIdToLabel('eustachian_tube'), icon: Icons.linear_scale),
              Category(id: 'guttural_pouches', label: _systemIdToLabel('guttural_pouches'), icon: Icons.circle),
              Category(id: 'larynx', label: _systemIdToLabel('larynx'), icon: Icons.record_voice_over),
              Category(id: 'nasal_cavities', label: _systemIdToLabel('nasal_cavities'), icon: Icons.circle),
              Category(id: 'nasal_septum', label: _systemIdToLabel('nasal_septum'), icon: Icons.layers),
              Category(id: 'nasal_turbinates', label: _systemIdToLabel('nasal_turbinates'), icon: Icons.layers),
              Category(id: 'nostrils', label: _systemIdToLabel('nostrils'), icon: Icons.circle),
              Category(id: 'paranasal_sinuses', label: _systemIdToLabel('paranasal_sinuses'), icon: Icons.circle),
              Category(id: 'pharynx', label: _systemIdToLabel('pharynx'), icon: Icons.circle),
              Category(id: 'soft_palate', label: _systemIdToLabel('soft_palate'), icon: Icons.layers),
            ],
          ),
        ],
      ),
      // Urinary System
      Category(
        id: 'urinary_system',
        label: _systemIdToLabel('urinary_system'),
        icon: _getSystemIcon('urinary_system'),
        imagePath: 'assets/images/systems/urinary_system.webp',
        subcategories: [
          Category(id: 'kidneys', label: _systemIdToLabel('kidneys'), icon: Icons.water_drop),
          Category(id: 'ureters', label: _systemIdToLabel('ureters'), icon: Icons.linear_scale),
          Category(id: 'urethra', label: _systemIdToLabel('urethra'), icon: Icons.linear_scale),
          Category(id: 'urinary_bladder', label: _systemIdToLabel('urinary_bladder'), icon: Icons.opacity),
        ],
      ),
    ];
  }

  static List<Category> _getDogSystemsCategories() {
    return [
      // Cardiovascular System
      Category(
        id: 'cardiovascular_system',
        label: _systemIdToLabel('cardiovascular_system'),
        icon: _getSystemIcon('cardiovascular_system'),
        imagePath: 'assets/images/systems/cardiovascular_system.webp',
        subcategories: [
          Category(id: 'arteries', label: _systemIdToLabel('arteries'), icon: Icons.linear_scale),
          Category(id: 'blood', label: _systemIdToLabel('blood'), icon: Icons.bloodtype),
          Category(id: 'capillaries', label: _systemIdToLabel('capillaries'), icon: Icons.linear_scale),
          Category(id: 'heart', label: _systemIdToLabel('heart'), icon: Icons.favorite),
          Category(id: 'pericardium', label: _systemIdToLabel('pericardium'), icon: Icons.favorite),
          Category(id: 'veins', label: _systemIdToLabel('veins'), icon: Icons.linear_scale),
        ],
      ),
      // Cranial Nerves
      Category(
        id: 'cranial_nerves',
        label: _systemIdToLabel('cranial_nerves'),
        icon: _getSystemIcon('cranial_nerves'),
        subcategories: [
          Category(id: 'abducent_nerve_vi', label: _systemIdToLabel('abducent_nerve_vi'), icon: Icons.psychology),
          Category(id: 'accessory_nerve_xi', label: _systemIdToLabel('accessory_nerve_xi'), icon: Icons.psychology),
          Category(id: 'facial_nerve_vii', label: _systemIdToLabel('facial_nerve_vii'), icon: Icons.psychology),
          Category(id: 'glossopharyngeal_nerve_ix', label: _systemIdToLabel('glossopharyngeal_nerve_ix'), icon: Icons.psychology),
          Category(id: 'hypoglossal_nerve_xii', label: _systemIdToLabel('hypoglossal_nerve_xii'), icon: Icons.psychology),
          Category(id: 'oculomotor_nerve_iii', label: _systemIdToLabel('oculomotor_nerve_iii'), icon: Icons.psychology),
          Category(id: 'olfactory_nerve_i', label: _systemIdToLabel('olfactory_nerve_i'), icon: Icons.psychology),
          Category(id: 'optic_nerve_ii', label: _systemIdToLabel('optic_nerve_ii'), icon: Icons.psychology),
          Category(id: 'trigeminal_nerve_v', label: _systemIdToLabel('trigeminal_nerve_v'), icon: Icons.psychology),
          Category(id: 'trochlear_nerve_iv', label: _systemIdToLabel('trochlear_nerve_iv'), icon: Icons.psychology),
          Category(id: 'vagus_nerve_x', label: _systemIdToLabel('vagus_nerve_x'), icon: Icons.psychology),
          Category(id: 'vestibulocochlear_nerve_viii', label: _systemIdToLabel('vestibulocochlear_nerve_viii'), icon: Icons.psychology),
        ],
      ),
      // Digestive System
      Category(
        id: 'digestive_system',
        label: _systemIdToLabel('digestive_system'),
        icon: _getSystemIcon('digestive_system'),
        imagePath: 'assets/images/systems/digestive_system.webp',
        subcategories: [
          Category(
            id: 'lower_tract',
            label: _systemIdToLabel('lower_tract'),
            icon: _getSystemIcon('lower_tract'),
            subcategories: [
              Category(id: 'anus', label: _systemIdToLabel('anus'), icon: Icons.circle),
              Category(id: 'large_intestine', label: _systemIdToLabel('large_intestine'), icon: Icons.linear_scale),
              Category(id: 'liver', label: _systemIdToLabel('liver'), icon: Icons.local_hospital),
              Category(id: 'pancreas', label: _systemIdToLabel('pancreas'), icon: Icons.scatter_plot),
              Category(id: 'rectum', label: _systemIdToLabel('rectum'), icon: Icons.circle),
              Category(id: 'small_intestine', label: _systemIdToLabel('small_intestine'), icon: Icons.linear_scale),
            ],
          ),
          Category(
            id: 'upper_tract',
            label: _systemIdToLabel('upper_tract'),
            icon: _getSystemIcon('upper_tract'),
            subcategories: [
              Category(id: 'esophagus', label: _systemIdToLabel('esophagus'), icon: Icons.linear_scale),
              Category(id: 'mouth', label: _systemIdToLabel('mouth'), icon: Icons.circle),
              Category(id: 'pharynx', label: _systemIdToLabel('pharynx'), icon: Icons.circle),
              Category(id: 'salivary_glands', label: _systemIdToLabel('salivary_glands'), icon: Icons.scatter_plot),
              Category(id: 'stomach', label: _systemIdToLabel('stomach'), icon: Icons.restaurant),
              Category(id: 'teeth', label: _systemIdToLabel('teeth'), icon: Icons.circle),
              Category(id: 'tongue', label: _systemIdToLabel('tongue'), icon: Icons.circle),
            ],
          ),
        ],
      ),
      // Endocrine System
      Category(
        id: 'endocrine_system',
        label: _systemIdToLabel('endocrine_system'),
        icon: _getSystemIcon('endocrine_system'),
        imagePath: 'assets/images/systems/endocrine_system.webp',
        subcategories: [
          Category(id: 'adrenal_glands', label: _systemIdToLabel('adrenal_glands'), icon: Icons.scatter_plot),
          Category(id: 'endocrine_axis', label: _systemIdToLabel('endocrine_axis'), icon: Icons.scatter_plot),
          Category(id: 'gonads', label: _systemIdToLabel('gonads'), icon: Icons.scatter_plot),
          Category(id: 'hypothalamus', label: _systemIdToLabel('hypothalamus'), icon: Icons.scatter_plot),
          Category(id: 'pancreas_endocrine', label: _systemIdToLabel('pancreas_endocrine'), icon: Icons.scatter_plot),
          Category(id: 'parathyroid_glands', label: _systemIdToLabel('parathyroid_glands'), icon: Icons.scatter_plot),
          Category(id: 'pineal_gland', label: _systemIdToLabel('pineal_gland'), icon: Icons.scatter_plot),
          Category(id: 'pituitary', label: _systemIdToLabel('pituitary'), icon: Icons.scatter_plot),
          Category(id: 'thymus_endocrine', label: _systemIdToLabel('thymus_endocrine'), icon: Icons.scatter_plot),
          Category(id: 'thyroid_gland', label: _systemIdToLabel('thyroid_gland'), icon: Icons.scatter_plot),
        ],
      ),
      // Hepatobiliary System
      Category(
        id: 'hepatobiliary_system',
        label: _systemIdToLabel('hepatobiliary_system'),
        icon: _getSystemIcon('hepatobiliary_system'),
        subcategories: [
          Category(id: 'bile_canaliculi', label: _systemIdToLabel('bile_canaliculi'), icon: Icons.linear_scale),
          Category(id: 'bile_ducts', label: _systemIdToLabel('bile_ducts'), icon: Icons.linear_scale),
          Category(id: 'common_bile_duct', label: _systemIdToLabel('common_bile_duct'), icon: Icons.linear_scale),
          Category(id: 'cystic_duct', label: _systemIdToLabel('cystic_duct'), icon: Icons.linear_scale),
          Category(id: 'gallbladder', label: _systemIdToLabel('gallbladder'), icon: Icons.water),
          Category(id: 'hepatic_artery', label: _systemIdToLabel('hepatic_artery'), icon: Icons.linear_scale),
          Category(id: 'hepatic_ducts', label: _systemIdToLabel('hepatic_ducts'), icon: Icons.linear_scale),
          Category(id: 'hepatic_lobules', label: _systemIdToLabel('hepatic_lobules'), icon: Icons.circle),
          Category(id: 'hepatic_vein', label: _systemIdToLabel('hepatic_vein'), icon: Icons.linear_scale),
          Category(id: 'kupffer_cells', label: _systemIdToLabel('kupffer_cells'), icon: Icons.circle),
          Category(id: 'liver', label: _systemIdToLabel('liver'), icon: Icons.local_hospital),
          Category(id: 'portal_vein', label: _systemIdToLabel('portal_vein'), icon: Icons.linear_scale),
        ],
      ),
      // Integumentary System
      Category(
        id: 'integumentary_system',
        label: _systemIdToLabel('integumentary_system'),
        icon: _getSystemIcon('integumentary_system'),
        subcategories: [
          Category(id: 'dermis', label: _systemIdToLabel('dermis'), icon: Icons.layers),
          Category(id: 'epidermis', label: _systemIdToLabel('epidermis'), icon: Icons.layers),
          Category(id: 'glands', label: _systemIdToLabel('glands'), icon: Icons.scatter_plot),
          Category(id: 'hair_coat', label: _systemIdToLabel('hair_coat'), icon: Icons.brush),
          Category(id: 'hair_follicle_receptors', label: _systemIdToLabel('hair_follicle_receptors'), icon: Icons.sensors),
          Category(id: 'hypodermis', label: _systemIdToLabel('hypodermis'), icon: Icons.layers),
          Category(id: 'mane_tail', label: _systemIdToLabel('mane_tail'), icon: Icons.brush),
          Category(id: 'pigmentation_color_patterns', label: _systemIdToLabel('pigmentation_color_patterns'), icon: Icons.palette),
          Category(id: 'protective_structures', label: _systemIdToLabel('protective_structures'), icon: Icons.shield),
          Category(id: 'whiskers_vibrissae', label: _systemIdToLabel('whiskers_vibrissae'), icon: Icons.sensors),
        ],
      ),
      // Lumbosacral Plexus
      Category(
        id: 'lumbosacral_plexus',
        label: _systemIdToLabel('lumbosacral_plexus'),
        icon: _getSystemIcon('lumbosacral_plexus'),
        subcategories: [
          Category(
            id: 'lumbar_plexus',
            label: _systemIdToLabel('lumbar_plexus'),
            icon: _getSystemIcon('lumbar_plexus'),
            subcategories: [
              Category(id: 'femoral_nerve', label: _systemIdToLabel('femoral_nerve'), icon: Icons.linear_scale),
              Category(id: 'lateral_cutaneous_femoral_nerve', label: _systemIdToLabel('lateral_cutaneous_femoral_nerve'), icon: Icons.linear_scale),
              Category(id: 'obturator_nerve', label: _systemIdToLabel('obturator_nerve'), icon: Icons.linear_scale),
            ],
          ),
          Category(
            id: 'major_nerves',
            label: _systemIdToLabel('major_nerves'),
            icon: _getSystemIcon('major_nerves'),
            subcategories: [],
          ),
          Category(
            id: 'sacral_plexus',
            label: _systemIdToLabel('sacral_plexus'),
            icon: _getSystemIcon('sacral_plexus'),
            subcategories: [
              Category(id: 'gluteal_nerves', label: _systemIdToLabel('gluteal_nerves'), icon: Icons.linear_scale),
              Category(id: 'pudendal_nerve', label: _systemIdToLabel('pudendal_nerve'), icon: Icons.linear_scale),
              Category(id: 'sciatic_nerve', label: _systemIdToLabel('sciatic_nerve'), icon: Icons.linear_scale),
            ],
          ),
        ],
      ),
      // Lymphatic System
      Category(
        id: 'lymphatic_system',
        label: _systemIdToLabel('lymphatic_system'),
        icon: _getSystemIcon('lymphatic_system'),
        imagePath: 'assets/images/systems/lymphatic_system.webp',
        subcategories: [
          Category(id: 'lymph', label: _systemIdToLabel('lymph'), icon: Icons.water),
          Category(id: 'lymph_capillaries', label: _systemIdToLabel('lymph_capillaries'), icon: Icons.water),
          Category(id: 'lymph_nodes', label: _systemIdToLabel('lymph_nodes'), icon: Icons.water),
          Category(id: 'lymph_vessels', label: _systemIdToLabel('lymph_vessels'), icon: Icons.water),
          Category(id: 'peyers_patches', label: _systemIdToLabel('peyers_patches'), icon: Icons.water),
          Category(id: 'right_lymphatic_duct', label: _systemIdToLabel('right_lymphatic_duct'), icon: Icons.water),
          Category(id: 'spleen', label: _systemIdToLabel('spleen'), icon: Icons.water),
          Category(id: 'thoracic_duct', label: _systemIdToLabel('thoracic_duct'), icon: Icons.water),
          Category(id: 'thymus', label: _systemIdToLabel('thymus'), icon: Icons.water),
          Category(id: 'tonsils', label: _systemIdToLabel('tonsils'), icon: Icons.water),
        ],
      ),
      // Nervous System
      Category(
        id: 'nervous_system',
        label: _systemIdToLabel('nervous_system'),
        icon: _getSystemIcon('nervous_system'),
        imagePath: 'assets/images/systems/nervous_system.webp',
        subcategories: [
          Category(
            id: 'autonomic',
            label: _systemIdToLabel('autonomic'),
            icon: _getSystemIcon('autonomic'),
            subcategories: [
              Category(id: 'enteric_system', label: _systemIdToLabel('enteric_system'), icon: Icons.settings),
              Category(id: 'parasympathetic', label: _systemIdToLabel('parasympathetic'), icon: Icons.settings),
              Category(id: 'sympathetic', label: _systemIdToLabel('sympathetic'), icon: Icons.settings),
            ],
          ),
          Category(
            id: 'cns',
            label: _systemIdToLabel('cns').toUpperCase(),
            icon: _getSystemIcon('cns'),
            subcategories: [
              Category(id: 'brain', label: _systemIdToLabel('brain'), icon: Icons.psychology),
              Category(id: 'brainstem', label: _systemIdToLabel('brainstem'), icon: Icons.psychology),
              Category(id: 'cerebellum', label: _systemIdToLabel('cerebellum'), icon: Icons.psychology),
              Category(id: 'spinal_cord', label: _systemIdToLabel('spinal_cord'), icon: Icons.psychology),
            ],
          ),
          Category(
            id: 'pns',
            label: _systemIdToLabel('pns').toUpperCase(),
            icon: _getSystemIcon('pns'),
            subcategories: [
              Category(id: 'brachial_plexus', label: _systemIdToLabel('brachial_plexus'), icon: Icons.scatter_plot),
              Category(id: 'cranial_nerves', label: _systemIdToLabel('cranial_nerves'), icon: Icons.scatter_plot),
              Category(id: 'motor_nerves', label: _systemIdToLabel('motor_nerves'), icon: Icons.scatter_plot),
              Category(id: 'sensory_nerves', label: _systemIdToLabel('sensory_nerves'), icon: Icons.scatter_plot),
              Category(id: 'spinal_nerves', label: _systemIdToLabel('spinal_nerves'), icon: Icons.scatter_plot),
            ],
          ),
        ],
      ),
      // Reproductive System
      Category(
        id: 'reproductive_system',
        label: _systemIdToLabel('reproductive_system'),
        icon: _getSystemIcon('reproductive_system'),
        imagePath: 'assets/images/systems/reproductive_system.webp',
        subcategories: [
          Category(
            id: 'female',
            label: _systemIdToLabel('female'),
            icon: _getSystemIcon('female'),
            subcategories: [
              Category(id: 'cervix', label: _systemIdToLabel('cervix'), icon: Icons.circle),
              Category(id: 'external_genitalia', label: _systemIdToLabel('external_genitalia'), icon: Icons.crop_portrait),
              Category(id: 'mammary_glands', label: _systemIdToLabel('mammary_glands'), icon: Icons.scatter_plot),
              Category(id: 'ovaries', label: _systemIdToLabel('ovaries'), icon: Icons.circle),
              Category(id: 'placenta', label: _systemIdToLabel('placenta'), icon: Icons.favorite),
              Category(id: 'uterine_tubes', label: _systemIdToLabel('uterine_tubes'), icon: Icons.linear_scale),
              Category(id: 'uterus', label: _systemIdToLabel('uterus'), icon: Icons.favorite),
              Category(id: 'vagina', label: _systemIdToLabel('vagina'), icon: Icons.linear_scale),
            ],
          ),
          Category(
            id: 'male',
            label: _systemIdToLabel('male'),
            icon: _getSystemIcon('male'),
            subcategories: [
              Category(id: 'accessory_glands', label: _systemIdToLabel('accessory_glands'), icon: Icons.scatter_plot),
              Category(id: 'epididymis', label: _systemIdToLabel('epididymis'), icon: Icons.circle),
              Category(id: 'mammary_glands', label: _systemIdToLabel('mammary_glands'), icon: Icons.scatter_plot),
              Category(id: 'penis', label: _systemIdToLabel('penis'), icon: Icons.scatter_plot),
              Category(id: 'prepuce', label: _systemIdToLabel('prepuce'), icon: Icons.scatter_plot),
              Category(id: 'sperm_duct', label: _systemIdToLabel('sperm_duct'), icon: Icons.linear_scale),
              Category(id: 'testes', label: _systemIdToLabel('testes'), icon: Icons.circle),
            ],
          ),
        ],
      ),
      // Respiratory System
      Category(
        id: 'respiratory_system',
        label: _systemIdToLabel('respiratory_system'),
        icon: _getSystemIcon('respiratory_system'),
        imagePath: 'assets/images/systems/respiratory_system.webp',
        subcategories: [
          Category(
            id: 'lower',
            label: _systemIdToLabel('lower'),
            icon: _getSystemIcon('lower'),
            subcategories: [
              Category(id: 'alveoli', label: _systemIdToLabel('alveoli'), icon: Icons.circle),
              Category(id: 'bronchi', label: _systemIdToLabel('bronchi'), icon: Icons.linear_scale),
              Category(id: 'bronchioles', label: _systemIdToLabel('bronchioles'), icon: Icons.linear_scale),
              Category(id: 'carina', label: _systemIdToLabel('carina'), icon: Icons.linear_scale),
              Category(id: 'lungs', label: _systemIdToLabel('lungs'), icon: Icons.air),
            ],
          ),
          Category(
            id: 'upper',
            label: _systemIdToLabel('upper'),
            icon: _getSystemIcon('upper'),
            subcategories: [
              Category(id: 'epiglottis', label: _systemIdToLabel('epiglottis'), icon: Icons.layers),
              Category(id: 'ethmoid_turbinates', label: _systemIdToLabel('ethmoid_turbinates'), icon: Icons.layers),
              Category(id: 'eustachian_tube', label: _systemIdToLabel('eustachian_tube'), icon: Icons.linear_scale),
              Category(id: 'larynx', label: _systemIdToLabel('larynx'), icon: Icons.record_voice_over),
              Category(id: 'nasal_septum', label: _systemIdToLabel('nasal_septum'), icon: Icons.layers),
              Category(id: 'nasal_turbinates', label: _systemIdToLabel('nasal_turbinates'), icon: Icons.layers),
              Category(id: 'nose_and_nasal_cavity', label: _systemIdToLabel('nose_and_nasal_cavity'), icon: Icons.circle),
              Category(id: 'paranasal_sinuses', label: _systemIdToLabel('paranasal_sinuses'), icon: Icons.circle),
              Category(id: 'pharynx', label: _systemIdToLabel('pharynx'), icon: Icons.circle),
              Category(id: 'soft_palate', label: _systemIdToLabel('soft_palate'), icon: Icons.layers),
              Category(id: 'trachea', label: _systemIdToLabel('trachea'), icon: Icons.linear_scale),
            ],
          ),
        ],
      ),
      // Urinary System
      Category(
        id: 'urinary_system',
        label: _systemIdToLabel('urinary_system'),
        icon: _getSystemIcon('urinary_system'),
        imagePath: 'assets/images/systems/urinary_system.webp',
        subcategories: [
          Category(id: 'kidneys', label: _systemIdToLabel('kidneys'), icon: Icons.water_drop),
          Category(id: 'ureters', label: _systemIdToLabel('ureters'), icon: Icons.linear_scale),
          Category(id: 'urethra', label: _systemIdToLabel('urethra'), icon: Icons.linear_scale),
          Category(id: 'urinary_bladder', label: _systemIdToLabel('urinary_bladder'), icon: Icons.opacity),
        ],
      ),
    ];
  }

  static List<Category> _getCatSystemsCategories() {
    return [
      // Cardiovascular System
      Category(
        id: 'cardiovascular_system',
        label: _systemIdToLabel('cardiovascular_system'),
        icon: _getSystemIcon('cardiovascular_system'),
        imagePath: 'assets/images/systems/cardiovascular_system.webp',
        subcategories: [
          Category(id: 'arteries', label: _systemIdToLabel('arteries'), icon: Icons.linear_scale),
          Category(id: 'blood', label: _systemIdToLabel('blood'), icon: Icons.bloodtype),
          Category(id: 'capillaries', label: _systemIdToLabel('capillaries'), icon: Icons.linear_scale),
          Category(id: 'heart', label: _systemIdToLabel('heart'), icon: Icons.favorite),
          Category(id: 'pericardium', label: _systemIdToLabel('pericardium'), icon: Icons.favorite),
          Category(id: 'veins', label: _systemIdToLabel('veins'), icon: Icons.linear_scale),
        ],
      ),
      // Cranial Nerves
      Category(
        id: 'cranial_nerves',
        label: _systemIdToLabel('cranial_nerves'),
        icon: _getSystemIcon('cranial_nerves'),
        subcategories: [
          Category(id: 'abducent_nerve_vi', label: _systemIdToLabel('abducent_nerve_vi'), icon: Icons.psychology),
          Category(id: 'accessory_nerve_xi', label: _systemIdToLabel('accessory_nerve_xi'), icon: Icons.psychology),
          Category(id: 'facial_nerve_vii', label: _systemIdToLabel('facial_nerve_vii'), icon: Icons.psychology),
          Category(id: 'glossopharyngeal_nerve_ix', label: _systemIdToLabel('glossopharyngeal_nerve_ix'), icon: Icons.psychology),
          Category(id: 'hypoglossal_nerve_xii', label: _systemIdToLabel('hypoglossal_nerve_xii'), icon: Icons.psychology),
          Category(id: 'oculomotor_nerve_iii', label: _systemIdToLabel('oculomotor_nerve_iii'), icon: Icons.psychology),
          Category(id: 'olfactory_nerve_i', label: _systemIdToLabel('olfactory_nerve_i'), icon: Icons.psychology),
          Category(id: 'optic_nerve_ii', label: _systemIdToLabel('optic_nerve_ii'), icon: Icons.psychology),
          Category(id: 'trigeminal_nerve_v', label: _systemIdToLabel('trigeminal_nerve_v'), icon: Icons.psychology),
          Category(id: 'trochlear_nerve_iv', label: _systemIdToLabel('trochlear_nerve_iv'), icon: Icons.psychology),
          Category(id: 'vagus_nerve_x', label: _systemIdToLabel('vagus_nerve_x'), icon: Icons.psychology),
          Category(id: 'vestibulocochlear_nerve_viii', label: _systemIdToLabel('vestibulocochlear_nerve_viii'), icon: Icons.psychology),
        ],
      ),
      // Digestive System
      Category(
        id: 'digestive_system',
        label: _systemIdToLabel('digestive_system'),
        icon: _getSystemIcon('digestive_system'),
        imagePath: 'assets/images/systems/digestive_system.webp',
        subcategories: [
          Category(
            id: 'lower_tract',
            label: _systemIdToLabel('lower_tract'),
            icon: _getSystemIcon('lower_tract'),
            subcategories: [
              Category(id: 'anus', label: _systemIdToLabel('anus'), icon: Icons.circle),
              Category(id: 'large_intestine', label: _systemIdToLabel('large_intestine'), icon: Icons.linear_scale),
              Category(id: 'liver', label: _systemIdToLabel('liver'), icon: Icons.local_hospital),
              Category(id: 'pancreas', label: _systemIdToLabel('pancreas'), icon: Icons.scatter_plot),
              Category(id: 'rectum', label: _systemIdToLabel('rectum'), icon: Icons.circle),
              Category(id: 'small_intestine', label: _systemIdToLabel('small_intestine'), icon: Icons.linear_scale),
            ],
          ),
          Category(
            id: 'upper_tract',
            label: _systemIdToLabel('upper_tract'),
            icon: _getSystemIcon('upper_tract'),
            subcategories: [
              Category(id: 'esophagus', label: _systemIdToLabel('esophagus'), icon: Icons.linear_scale),
              Category(id: 'mouth', label: _systemIdToLabel('mouth'), icon: Icons.circle),
              Category(id: 'pharynx', label: _systemIdToLabel('pharynx'), icon: Icons.circle),
              Category(id: 'salivary_glands', label: _systemIdToLabel('salivary_glands'), icon: Icons.scatter_plot),
              Category(id: 'stomach', label: _systemIdToLabel('stomach'), icon: Icons.restaurant),
              Category(id: 'teeth', label: _systemIdToLabel('teeth'), icon: Icons.circle),
              Category(id: 'tongue', label: _systemIdToLabel('tongue'), icon: Icons.circle),
            ],
          ),
        ],
      ),
      // Endocrine System
      Category(
        id: 'endocrine_system',
        label: _systemIdToLabel('endocrine_system'),
        icon: _getSystemIcon('endocrine_system'),
        imagePath: 'assets/images/systems/endocrine_system.webp',
        subcategories: [
          Category(id: 'adrenal_glands', label: _systemIdToLabel('adrenal_glands'), icon: Icons.scatter_plot),
          Category(id: 'endocrine_axis', label: _systemIdToLabel('endocrine_axis'), icon: Icons.scatter_plot),
          Category(id: 'gonads', label: _systemIdToLabel('gonads'), icon: Icons.scatter_plot),
          Category(id: 'hypothalamus', label: _systemIdToLabel('hypothalamus'), icon: Icons.scatter_plot),
          Category(id: 'pancreas_endocrine', label: _systemIdToLabel('pancreas_endocrine'), icon: Icons.scatter_plot),
          Category(id: 'parathyroid_glands', label: _systemIdToLabel('parathyroid_glands'), icon: Icons.scatter_plot),
          Category(id: 'pineal_gland', label: _systemIdToLabel('pineal_gland'), icon: Icons.scatter_plot),
          Category(id: 'pituitary', label: _systemIdToLabel('pituitary'), icon: Icons.scatter_plot),
          Category(id: 'thymus_endocrine', label: _systemIdToLabel('thymus_endocrine'), icon: Icons.scatter_plot),
          Category(id: 'thyroid_gland', label: _systemIdToLabel('thyroid_gland'), icon: Icons.scatter_plot),
        ],
      ),
      // Hepatobiliary System
      Category(
        id: 'hepatobiliary_system',
        label: _systemIdToLabel('hepatobiliary_system'),
        icon: _getSystemIcon('hepatobiliary_system'),
        subcategories: [
          Category(id: 'bile_canaliculi', label: _systemIdToLabel('bile_canaliculi'), icon: Icons.linear_scale),
          Category(id: 'bile_ducts', label: _systemIdToLabel('bile_ducts'), icon: Icons.linear_scale),
          Category(id: 'common_bile_duct', label: _systemIdToLabel('common_bile_duct'), icon: Icons.linear_scale),
          Category(id: 'cystic_duct', label: _systemIdToLabel('cystic_duct'), icon: Icons.linear_scale),
          Category(id: 'gallbladder', label: _systemIdToLabel('gallbladder'), icon: Icons.water),
          Category(id: 'hepatic_artery', label: _systemIdToLabel('hepatic_artery'), icon: Icons.linear_scale),
          Category(id: 'hepatic_ducts', label: _systemIdToLabel('hepatic_ducts'), icon: Icons.linear_scale),
          Category(id: 'hepatic_lobules', label: _systemIdToLabel('hepatic_lobules'), icon: Icons.circle),
          Category(id: 'hepatic_vein', label: _systemIdToLabel('hepatic_vein'), icon: Icons.linear_scale),
          Category(id: 'kupffer_cells', label: _systemIdToLabel('kupffer_cells'), icon: Icons.circle),
          Category(id: 'liver', label: _systemIdToLabel('liver'), icon: Icons.local_hospital),
          Category(id: 'portal_vein', label: _systemIdToLabel('portal_vein'), icon: Icons.linear_scale),
        ],
      ),
      // Integumentary System
      Category(
        id: 'integumentary_system',
        label: _systemIdToLabel('integumentary_system'),
        icon: _getSystemIcon('integumentary_system'),
        subcategories: [
          Category(id: 'dermis', label: _systemIdToLabel('dermis'), icon: Icons.layers),
          Category(id: 'epidermis', label: _systemIdToLabel('epidermis'), icon: Icons.layers),
          Category(id: 'glands', label: _systemIdToLabel('glands'), icon: Icons.scatter_plot),
          Category(id: 'hair_coat', label: _systemIdToLabel('hair_coat'), icon: Icons.brush),
          Category(id: 'hair_follicle_receptors', label: _systemIdToLabel('hair_follicle_receptors'), icon: Icons.sensors),
          Category(id: 'hypodermis', label: _systemIdToLabel('hypodermis'), icon: Icons.layers),
          Category(id: 'mane_tail', label: _systemIdToLabel('mane_tail'), icon: Icons.brush),
          Category(id: 'pigmentation_color_patterns', label: _systemIdToLabel('pigmentation_color_patterns'), icon: Icons.palette),
          Category(id: 'protective_structures', label: _systemIdToLabel('protective_structures'), icon: Icons.shield),
          Category(id: 'whiskers_vibrissae', label: _systemIdToLabel('whiskers_vibrissae'), icon: Icons.sensors),
        ],
      ),
      // Lumbosacral Plexus
      Category(
        id: 'lumbosacral_plexus',
        label: _systemIdToLabel('lumbosacral_plexus'),
        icon: _getSystemIcon('lumbosacral_plexus'),
        subcategories: [
          Category(
            id: 'lumbar_plexus',
            label: _systemIdToLabel('lumbar_plexus'),
            icon: _getSystemIcon('lumbar_plexus'),
            subcategories: [],
          ),
          Category(
            id: 'major_nerves',
            label: _systemIdToLabel('major_nerves'),
            icon: _getSystemIcon('major_nerves'),
            subcategories: [],
          ),
          Category(
            id: 'sacral_plexus',
            label: _systemIdToLabel('sacral_plexus'),
            icon: _getSystemIcon('sacral_plexus'),
            subcategories: [],
          ),
        ],
      ),
      // Lymphatic System
      Category(
        id: 'lymphatic_system',
        label: _systemIdToLabel('lymphatic_system'),
        icon: _getSystemIcon('lymphatic_system'),
        imagePath: 'assets/images/systems/lymphatic_system.webp',
        subcategories: [
          Category(id: 'lymph', label: _systemIdToLabel('lymph'), icon: Icons.water),
          Category(id: 'lymph_capillaries', label: _systemIdToLabel('lymph_capillaries'), icon: Icons.water),
          Category(id: 'lymph_nodes', label: _systemIdToLabel('lymph_nodes'), icon: Icons.water),
          Category(id: 'lymph_vessels', label: _systemIdToLabel('lymph_vessels'), icon: Icons.water),
          Category(id: 'peyers_patches', label: _systemIdToLabel('peyers_patches'), icon: Icons.water),
          Category(id: 'right_lymphatic_duct', label: _systemIdToLabel('right_lymphatic_duct'), icon: Icons.water),
          Category(id: 'spleen', label: _systemIdToLabel('spleen'), icon: Icons.water),
          Category(id: 'thoracic_duct', label: _systemIdToLabel('thoracic_duct'), icon: Icons.water),
          Category(id: 'thymus', label: _systemIdToLabel('thymus'), icon: Icons.water),
          Category(id: 'tonsils', label: _systemIdToLabel('tonsils'), icon: Icons.water),
        ],
      ),
      // Nervous System
      Category(
        id: 'nervous_system',
        label: _systemIdToLabel('nervous_system'),
        icon: _getSystemIcon('nervous_system'),
        imagePath: 'assets/images/systems/nervous_system.webp',
        subcategories: [
          Category(
            id: 'autonomic',
            label: _systemIdToLabel('autonomic'),
            icon: _getSystemIcon('autonomic'),
            subcategories: [
              Category(id: 'enteric_system', label: _systemIdToLabel('enteric_system'), icon: Icons.settings),
              Category(id: 'parasympathetic', label: _systemIdToLabel('parasympathetic'), icon: Icons.settings),
              Category(id: 'sympathetic', label: _systemIdToLabel('sympathetic'), icon: Icons.settings),
            ],
          ),
          Category(
            id: 'cns',
            label: _systemIdToLabel('cns').toUpperCase(),
            icon: _getSystemIcon('cns'),
            subcategories: [
              Category(id: 'brain', label: _systemIdToLabel('brain'), icon: Icons.psychology),
              Category(id: 'brainstem', label: _systemIdToLabel('brainstem'), icon: Icons.psychology),
              Category(id: 'cerebellum', label: _systemIdToLabel('cerebellum'), icon: Icons.psychology),
              Category(id: 'spinal_cord', label: _systemIdToLabel('spinal_cord'), icon: Icons.psychology),
            ],
          ),
          Category(
            id: 'pns',
            label: _systemIdToLabel('pns').toUpperCase(),
            icon: _getSystemIcon('pns'),
            subcategories: [
              Category(id: 'brachial_plexus', label: _systemIdToLabel('brachial_plexus'), icon: Icons.scatter_plot),
              Category(id: 'cranial_nerves', label: _systemIdToLabel('cranial_nerves'), icon: Icons.scatter_plot),
              Category(id: 'motor_nerves', label: _systemIdToLabel('motor_nerves'), icon: Icons.scatter_plot),
              Category(id: 'sensory_nerves', label: _systemIdToLabel('sensory_nerves'), icon: Icons.scatter_plot),
              Category(id: 'spinal_nerves', label: _systemIdToLabel('spinal_nerves'), icon: Icons.scatter_plot),
            ],
          ),
        ],
      ),
      // Reproductive System
      Category(
        id: 'reproductive_system',
        label: _systemIdToLabel('reproductive_system'),
        icon: _getSystemIcon('reproductive_system'),
        imagePath: 'assets/images/systems/reproductive_system.webp',
        subcategories: [
          Category(
            id: 'female',
            label: _systemIdToLabel('female'),
            icon: _getSystemIcon('female'),
            subcategories: [],
          ),
          Category(
            id: 'male',
            label: _systemIdToLabel('male'),
            icon: _getSystemIcon('male'),
            subcategories: [],
          ),
        ],
      ),
      // Respiratory System
      Category(
        id: 'respiratory_system',
        label: _systemIdToLabel('respiratory_system'),
        icon: _getSystemIcon('respiratory_system'),
        imagePath: 'assets/images/systems/respiratory_system.webp',
        subcategories: [
          Category(
            id: 'lower',
            label: _systemIdToLabel('lower'),
            icon: _getSystemIcon('lower'),
            subcategories: [
              Category(id: 'alveoli', label: _systemIdToLabel('alveoli'), icon: Icons.circle),
              Category(id: 'bronchi', label: _systemIdToLabel('bronchi'), icon: Icons.linear_scale),
              Category(id: 'bronchioles', label: _systemIdToLabel('bronchioles'), icon: Icons.linear_scale),
              Category(id: 'carina', label: _systemIdToLabel('carina'), icon: Icons.linear_scale),
              Category(id: 'lungs', label: _systemIdToLabel('lungs'), icon: Icons.air),
            ],
          ),
          Category(
            id: 'upper',
            label: _systemIdToLabel('upper'),
            icon: _getSystemIcon('upper'),
            subcategories: [
              Category(id: 'epiglottis', label: _systemIdToLabel('epiglottis'), icon: Icons.layers),
              Category(id: 'ethmoid_turbinates', label: _systemIdToLabel('ethmoid_turbinates'), icon: Icons.layers),
              Category(id: 'eustachian_tube', label: _systemIdToLabel('eustachian_tube'), icon: Icons.linear_scale),
              Category(id: 'larynx', label: _systemIdToLabel('larynx'), icon: Icons.record_voice_over),
              Category(id: 'nasal_septum', label: _systemIdToLabel('nasal_septum'), icon: Icons.layers),
              Category(id: 'nasal_turbinates', label: _systemIdToLabel('nasal_turbinates'), icon: Icons.layers),
              Category(id: 'nose_and_nasal_cavity', label: _systemIdToLabel('nose_and_nasal_cavity'), icon: Icons.circle),
              Category(id: 'paranasal_sinuses', label: _systemIdToLabel('paranasal_sinuses'), icon: Icons.circle),
              Category(id: 'pharynx', label: _systemIdToLabel('pharynx'), icon: Icons.circle),
              Category(id: 'soft_palate', label: _systemIdToLabel('soft_palate'), icon: Icons.layers),
              Category(id: 'trachea', label: _systemIdToLabel('trachea'), icon: Icons.linear_scale),
            ],
          ),
        ],
      ),
      // Urinary System
      Category(
        id: 'urinary_system',
        label: _systemIdToLabel('urinary_system'),
        icon: _getSystemIcon('urinary_system'),
        imagePath: 'assets/images/systems/urinary_system.webp',
        subcategories: [
          Category(id: 'kidneys', label: _systemIdToLabel('kidneys'), icon: Icons.water_drop),
          Category(id: 'ureters', label: _systemIdToLabel('ureters'), icon: Icons.linear_scale),
          Category(id: 'urethra', label: _systemIdToLabel('urethra'), icon: Icons.linear_scale),
          Category(id: 'urinary_bladder', label: _systemIdToLabel('urinary_bladder'), icon: Icons.opacity),
        ],
      ),
    ];
  }

  static List<Category> _getBirdSystemsCategories() {
    return [
      // Cardiovascular System
      Category(
        id: 'cardiovascular_system',
        label: _systemIdToLabel('cardiovascular_system'),
        icon: _getSystemIcon('cardiovascular_system'),
        imagePath: 'assets/images/systems/cardiovascular_system.webp',
        subcategories: [
          Category(id: 'arteries', label: _systemIdToLabel('arteries'), icon: Icons.linear_scale),
          Category(id: 'blood', label: _systemIdToLabel('blood'), icon: Icons.bloodtype),
          Category(id: 'capillaries', label: _systemIdToLabel('capillaries'), icon: Icons.linear_scale),
          Category(id: 'heart', label: _systemIdToLabel('heart'), icon: Icons.favorite),
          Category(id: 'pericardium', label: _systemIdToLabel('pericardium'), icon: Icons.favorite),
          Category(id: 'veins', label: _systemIdToLabel('veins'), icon: Icons.linear_scale),
        ],
      ),
      // Cranial Nerves (note: folder has typo "cranial_neves")
      Category(
        id: 'cranial_neves',
        label: 'Cranial Nerves',
        icon: _getSystemIcon('cranial_nerves'),
        subcategories: [
          Category(id: 'abducent_nerve_vi', label: _systemIdToLabel('abducent_nerve_vi'), icon: Icons.psychology),
          Category(id: 'accessory_nerve_xi', label: _systemIdToLabel('accessory_nerve_xi'), icon: Icons.psychology),
          Category(id: 'facial_nerve_vii', label: _systemIdToLabel('facial_nerve_vii'), icon: Icons.psychology),
          Category(id: 'glossopharyngeal_nerve_ix', label: _systemIdToLabel('glossopharyngeal_nerve_ix'), icon: Icons.psychology),
          Category(id: 'hypoglossal_nerve_xii', label: _systemIdToLabel('hypoglossal_nerve_xii'), icon: Icons.psychology),
          Category(id: 'oculomotor_nerve_iii', label: _systemIdToLabel('oculomotor_nerve_iii'), icon: Icons.psychology),
          Category(id: 'olfactory_nerve_i', label: _systemIdToLabel('olfactory_nerve_i'), icon: Icons.psychology),
          Category(id: 'optic_nerve_ii', label: _systemIdToLabel('optic_nerve_ii'), icon: Icons.psychology),
          Category(id: 'trigeminal_nerve_v', label: _systemIdToLabel('trigeminal_nerve_v'), icon: Icons.psychology),
          Category(id: 'trochlear_nerve_iv', label: _systemIdToLabel('trochlear_nerve_iv'), icon: Icons.psychology),
          Category(id: 'vagus_nerve_x', label: _systemIdToLabel('vagus_nerve_x'), icon: Icons.psychology),
          Category(id: 'vestibulocochlear_nerve_viii', label: _systemIdToLabel('vestibulocochlear_nerve_viii'), icon: Icons.psychology),
        ],
      ),
      // Digestive System
      Category(
        id: 'digestive_system',
        label: _systemIdToLabel('digestive_system'),
        icon: _getSystemIcon('digestive_system'),
        imagePath: 'assets/images/systems/digestive_system.webp',
        subcategories: [
          Category(
            id: 'lower_tract',
            label: _systemIdToLabel('lower_tract'),
            icon: _getSystemIcon('lower_tract'),
            subcategories: [
              Category(id: 'ceca', label: _systemIdToLabel('ceca'), icon: Icons.circle),
              Category(id: 'cloaca', label: _systemIdToLabel('cloaca'), icon: Icons.circle),
              Category(id: 'crop', label: _systemIdToLabel('crop'), icon: Icons.restaurant),
              Category(id: 'duodenum', label: _systemIdToLabel('duodenum'), icon: Icons.linear_scale),
              Category(id: 'esophagus', label: _systemIdToLabel('esophagus'), icon: Icons.linear_scale),
              Category(id: 'gizzard', label: _systemIdToLabel('gizzard'), icon: Icons.restaurant),
              Category(id: 'jejunum_ileum', label: _systemIdToLabel('jejunum_ileum'), icon: Icons.linear_scale),
              Category(id: 'large_intestine', label: _systemIdToLabel('large_intestine'), icon: Icons.linear_scale),
              Category(id: 'proventriculus', label: _systemIdToLabel('proventriculus'), icon: Icons.restaurant),
            ],
          ),
          Category(
            id: 'upper_tract',
            label: _systemIdToLabel('upper_tract'),
            icon: _getSystemIcon('upper_tract'),
            subcategories: [
              Category(id: 'beak', label: _systemIdToLabel('beak'), icon: Icons.circle),
              Category(id: 'choana', label: _systemIdToLabel('choana'), icon: Icons.circle),
              Category(id: 'oral_cavity', label: _systemIdToLabel('oral_cavity'), icon: Icons.circle),
              Category(id: 'pharynx', label: _systemIdToLabel('pharynx'), icon: Icons.circle),
              Category(id: 'salivary_glands', label: _systemIdToLabel('salivary_glands'), icon: Icons.scatter_plot),
              Category(id: 'tongue', label: _systemIdToLabel('tongue'), icon: Icons.circle),
            ],
          ),
        ],
      ),
      // Endocrine System
      Category(
        id: 'endocrine_system',
        label: _systemIdToLabel('endocrine_system'),
        icon: _getSystemIcon('endocrine_system'),
        imagePath: 'assets/images/systems/endocrine_system.webp',
        subcategories: [
          Category(id: 'adrenal_glands', label: _systemIdToLabel('adrenal_glands'), icon: Icons.scatter_plot),
          Category(id: 'bursa_of_fabricius', label: _systemIdToLabel('bursa_of_fabricius'), icon: Icons.scatter_plot),
          Category(id: 'gonads', label: _systemIdToLabel('gonads'), icon: Icons.scatter_plot),
          Category(id: 'hypothalamus', label: _systemIdToLabel('hypothalamus'), icon: Icons.scatter_plot),
          Category(id: 'pancreas_endocrine', label: _systemIdToLabel('pancreas_endocrine'), icon: Icons.scatter_plot),
          Category(id: 'parathyroid_glands', label: _systemIdToLabel('parathyroid_glands'), icon: Icons.scatter_plot),
          Category(id: 'pineal_gland', label: _systemIdToLabel('pineal_gland'), icon: Icons.scatter_plot),
          Category(id: 'pituitary_gland', label: _systemIdToLabel('pituitary_gland'), icon: Icons.scatter_plot),
          Category(id: 'thyroid_glands', label: _systemIdToLabel('thyroid_glands'), icon: Icons.scatter_plot),
          Category(id: 'ultimobranchial_glands', label: _systemIdToLabel('ultimobranchial_glands'), icon: Icons.scatter_plot),
        ],
      ),
      // Integumentary System
      Category(
        id: 'integumentary_system',
        label: _systemIdToLabel('integumentary_system'),
        icon: _getSystemIcon('integumentary_system'),
        subcategories: [
          Category(id: 'claws_talons', label: _systemIdToLabel('claws_talons'), icon: Icons.layers),
          Category(id: 'dermis', label: _systemIdToLabel('dermis'), icon: Icons.layers),
          Category(id: 'down_feathers', label: _systemIdToLabel('down_feathers'), icon: Icons.brush),
          Category(id: 'epidermis', label: _systemIdToLabel('epidermis'), icon: Icons.layers),
          Category(id: 'feather_follicles', label: _systemIdToLabel('feather_follicles'), icon: Icons.brush),
          Category(id: 'feathers', label: _systemIdToLabel('feathers'), icon: Icons.brush),
          Category(id: 'filoplumes', label: _systemIdToLabel('filoplumes'), icon: Icons.brush),
          Category(id: 'glands', label: _systemIdToLabel('glands'), icon: Icons.scatter_plot),
          Category(id: 'hypodermis', label: _systemIdToLabel('hypodermis'), icon: Icons.layers),
          Category(id: 'pigmentation_coloration', label: _systemIdToLabel('pigmentation_coloration'), icon: Icons.palette),
          Category(id: 'rictal_bristles', label: _systemIdToLabel('rictal_bristles'), icon: Icons.brush),
          Category(id: 'scales_beak', label: _systemIdToLabel('scales_beak'), icon: Icons.layers),
          Category(id: 'sensory_feathers', label: _systemIdToLabel('sensory_feathers'), icon: Icons.sensors),
          Category(id: 'skin_sensory_receptors', label: _systemIdToLabel('skin_sensory_receptors'), icon: Icons.sensors),
          Category(id: 'uropygial_gland', label: _systemIdToLabel('uropygial_gland'), icon: Icons.scatter_plot),
        ],
      ),
      // Lumbosacral Plexus
      Category(
        id: 'lumbosacral_plexus',
        label: _systemIdToLabel('lumbosacral_plexus'),
        icon: _getSystemIcon('lumbosacral_plexus'),
        subcategories: [
          Category(
            id: 'lumbar_plexus',
            label: _systemIdToLabel('lumbar_plexus'),
            icon: _getSystemIcon('lumbar_plexus'),
            subcategories: [],
          ),
          Category(
            id: 'major_nerves',
            label: _systemIdToLabel('major_nerves'),
            icon: _getSystemIcon('major_nerves'),
            subcategories: [],
          ),
          Category(
            id: 'sacral_plexus',
            label: _systemIdToLabel('sacral_plexus'),
            icon: _getSystemIcon('sacral_plexus'),
            subcategories: [],
          ),
        ],
      ),
      // Lymphatic System
      Category(
        id: 'lymphatic_system',
        label: _systemIdToLabel('lymphatic_system'),
        icon: _getSystemIcon('lymphatic_system'),
        imagePath: 'assets/images/systems/lymphatic_system.webp',
        subcategories: [
          Category(id: 'bursa_of_fabricius', label: _systemIdToLabel('bursa_of_fabricius'), icon: Icons.water),
          Category(id: 'lymph_hearts', label: _systemIdToLabel('lymph_hearts'), icon: Icons.water),
          Category(id: 'lymph_vessels', label: _systemIdToLabel('lymph_vessels'), icon: Icons.water),
          Category(id: 'lymphoid_tissue', label: _systemIdToLabel('lymphoid_tissue'), icon: Icons.water),
          Category(id: 'spleen', label: _systemIdToLabel('spleen'), icon: Icons.water),
          Category(id: 'thymus', label: _systemIdToLabel('thymus'), icon: Icons.water),
        ],
      ),
      // Nervous System
      Category(
        id: 'nervous_system',
        label: _systemIdToLabel('nervous_system'),
        icon: _getSystemIcon('nervous_system'),
        imagePath: 'assets/images/systems/nervous_system.webp',
        subcategories: [
          Category(
            id: 'autonomic',
            label: _systemIdToLabel('autonomic'),
            icon: _getSystemIcon('autonomic'),
            subcategories: [
              Category(id: 'autonomic_system', label: _systemIdToLabel('autonomic_system'), icon: Icons.settings),
              Category(id: 'enteric_plexuses', label: _systemIdToLabel('enteric_plexuses'), icon: Icons.settings),
              Category(id: 'sympathetic_chain', label: _systemIdToLabel('sympathetic_chain'), icon: Icons.settings),
              Category(id: 'vagus_nerve', label: _systemIdToLabel('vagus_nerve'), icon: Icons.settings),
            ],
          ),
          Category(
            id: 'cns',
            label: _systemIdToLabel('cns').toUpperCase(),
            icon: _getSystemIcon('cns'),
            subcategories: [
              Category(id: 'brain', label: _systemIdToLabel('brain'), icon: Icons.psychology),
              Category(id: 'brain_meninges', label: _systemIdToLabel('brain_meninges'), icon: Icons.psychology),
              Category(id: 'spinal_cord', label: _systemIdToLabel('spinal_cord'), icon: Icons.psychology),
            ],
          ),
          Category(
            id: 'pns',
            label: _systemIdToLabel('pns').toUpperCase(),
            icon: _getSystemIcon('pns'),
            subcategories: [
              Category(id: 'cranial_nerves', label: _systemIdToLabel('cranial_nerves'), icon: Icons.scatter_plot),
              Category(id: 'peripheral_ganglia', label: _systemIdToLabel('peripheral_ganglia'), icon: Icons.scatter_plot),
              Category(id: 'sensory_receptors', label: _systemIdToLabel('sensory_receptors'), icon: Icons.scatter_plot),
              Category(id: 'spinal_nerves', label: _systemIdToLabel('spinal_nerves'), icon: Icons.scatter_plot),
            ],
          ),
        ],
      ),
      // Reproductive System
      Category(
        id: 'reproductive_system',
        label: _systemIdToLabel('reproductive_system'),
        icon: _getSystemIcon('reproductive_system'),
        imagePath: 'assets/images/systems/reproductive_system.webp',
        subcategories: [
          Category(
            id: 'female',
            label: _systemIdToLabel('female'),
            icon: _getSystemIcon('female'),
            subcategories: [
              Category(id: 'cloacal_region', label: _systemIdToLabel('cloacal_region'), icon: Icons.circle),
              Category(id: 'infundibulum', label: _systemIdToLabel('infundibulum'), icon: Icons.circle),
              Category(id: 'isthmus', label: _systemIdToLabel('isthmus'), icon: Icons.circle),
              Category(id: 'magnum', label: _systemIdToLabel('magnum'), icon: Icons.circle),
              Category(id: 'ovary', label: _systemIdToLabel('ovary'), icon: Icons.circle),
              Category(id: 'oviduct', label: _systemIdToLabel('oviduct'), icon: Icons.linear_scale),
              Category(id: 'shell_gland_uterus', label: _systemIdToLabel('shell_gland_uterus'), icon: Icons.favorite),
              Category(id: 'sperm_storage_tubules', label: _systemIdToLabel('sperm_storage_tubules'), icon: Icons.linear_scale),
            ],
          ),
          Category(
            id: 'male',
            label: _systemIdToLabel('male'),
            icon: _getSystemIcon('male'),
            subcategories: [
              Category(id: 'cloaca', label: _systemIdToLabel('cloaca'), icon: Icons.scatter_plot),
              Category(id: 'copulatory_organ', label: _systemIdToLabel('copulatory_organ'), icon: Icons.scatter_plot),
              Category(id: 'epididymis', label: _systemIdToLabel('epididymis'), icon: Icons.circle),
              Category(id: 'phallus', label: _systemIdToLabel('phallus'), icon: Icons.scatter_plot),
              Category(id: 'seminal_glomus', label: _systemIdToLabel('seminal_glomus'), icon: Icons.scatter_plot),
              Category(id: 'sperm_duct', label: _systemIdToLabel('sperm_duct'), icon: Icons.linear_scale),
              Category(id: 'testes', label: _systemIdToLabel('testes'), icon: Icons.circle),
            ],
          ),
        ],
      ),
      // Respiratory System
      Category(
        id: 'respiratory_system',
        label: _systemIdToLabel('respiratory_system'),
        icon: _getSystemIcon('respiratory_system'),
        imagePath: 'assets/images/systems/respiratory_system.webp',
        subcategories: [
          Category(
            id: 'lower',
            label: _systemIdToLabel('lower'),
            icon: _getSystemIcon('lower'),
            subcategories: [
              Category(id: 'air_sacs', label: _systemIdToLabel('air_sacs'), icon: Icons.air),
              Category(id: 'bronchi', label: _systemIdToLabel('bronchi'), icon: Icons.linear_scale),
              Category(id: 'lungs', label: _systemIdToLabel('lungs'), icon: Icons.air),
              Category(id: 'syrinx', label: _systemIdToLabel('syrinx'), icon: Icons.record_voice_over),
              Category(id: 'trachea', label: _systemIdToLabel('trachea'), icon: Icons.linear_scale),
            ],
          ),
          Category(
            id: 'upper',
            label: _systemIdToLabel('upper'),
            icon: _getSystemIcon('upper'),
            subcategories: [
              Category(id: 'larynx', label: _systemIdToLabel('larynx'), icon: Icons.record_voice_over),
              Category(id: 'nasal_cavities', label: _systemIdToLabel('nasal_cavities'), icon: Icons.circle),
              Category(id: 'nostrils', label: _systemIdToLabel('nostrils'), icon: Icons.circle),
              Category(id: 'pharynx', label: _systemIdToLabel('pharynx'), icon: Icons.circle),
            ],
          ),
        ],
      ),
      // Urinary System (bird does not have a separate urinary system folder)
      // Water Balance System
      Category(
        id: 'water_balance_system',
        label: _systemIdToLabel('water_balance_system'),
        icon: Icons.water_drop,
        subcategories: [
          Category(id: 'water_air_sacs', label: _systemIdToLabel('water_air_sacs'), icon: Icons.water_drop),
          Category(id: 'water_cloacal_urodeum', label: _systemIdToLabel('water_cloacal_urodeum'), icon: Icons.water_drop),
          Category(id: 'water_kidneys', label: _systemIdToLabel('water_kidneys'), icon: Icons.water_drop),
          Category(id: 'water_lower_intestine', label: _systemIdToLabel('water_lower_intestine'), icon: Icons.water_drop),
          Category(id: 'water_lungs', label: _systemIdToLabel('water_lungs'), icon: Icons.water_drop),
          Category(id: 'water_ureters', label: _systemIdToLabel('water_ureters'), icon: Icons.linear_scale),
          Category(id: 'water_uric_acid_metabolism', label: _systemIdToLabel('water_uric_acid_metabolism'), icon: Icons.science),
        ],
      ),
    ];
  }
}
