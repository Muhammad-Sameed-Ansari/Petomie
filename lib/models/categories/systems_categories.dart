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
      case 'immune_system':
        return Icons.shield;
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
          Category(
            id: 'arteries', 
            label: _systemIdToLabel('arteries'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/cardiovascular_system/arteries.webp',
          ),
          Category(
            id: 'blood', 
            label: _systemIdToLabel('blood'), 
            icon: Icons.bloodtype,
            imagePath: 'assets/images/systems/cardiovascular_system/blood.webp',
          ),
          Category(
            id: 'capillaries', 
            label: _systemIdToLabel('capillaries'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/cardiovascular_system/capillaries.webp',
          ),
          Category(
            id: 'heart', 
            label: _systemIdToLabel('heart'), 
            icon: Icons.favorite,
            imagePath: 'assets/images/systems/cardiovascular_system/heart.webp',
          ),
          Category(
            id: 'pericardium', 
            label: _systemIdToLabel('pericardium'), 
            icon: Icons.favorite,
            imagePath: 'assets/images/systems/cardiovascular_system/pericardium.webp',
          ),
          Category(
            id: 'veins', 
            label: _systemIdToLabel('veins'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/cardiovascular_system/veins.webp',
          ),
        ],
      ),
      // Cranial Nerves
      Category(
        id: 'cranial_nerves',
        label: _systemIdToLabel('cranial_nerves'),
        icon: _getSystemIcon('cranial_nerves'),
        imagePath: 'assets/images/systems/cranial_nerves_main.webp',
        subcategories: [
          Category(
            id: 'abducent_nerve_vi', 
            label: _systemIdToLabel('abducent_nerve_vi'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'accessory_nerve_xi', 
            label: _systemIdToLabel('accessory_nerve_xi'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'facial_nerve_vii', 
            label: _systemIdToLabel('facial_nerve_vii'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'glossopharyngeal_nerve_ix', 
            label: _systemIdToLabel('glossopharyngeal_nerve_ix'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'hypoglossal_nerve_xii', 
            label: _systemIdToLabel('hypoglossal_nerve_xii'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'oculomotor_nerve_iii', 
            label: _systemIdToLabel('oculomotor_nerve_iii'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'olfactory_nerve_i', 
            label: _systemIdToLabel('olfactory_nerve_i'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'optic_nerve_ii', 
            label: _systemIdToLabel('optic_nerve_ii'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'trigeminal_nerve_v', 
            label: _systemIdToLabel('trigeminal_nerve_v'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'trochlear_nerve_iv', 
            label: _systemIdToLabel('trochlear_nerve_iv'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'vagus_nerve_x', 
            label: _systemIdToLabel('vagus_nerve_x'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'vestibulocochlear_nerve_viii', 
            label: _systemIdToLabel('vestibulocochlear_nerve_viii'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
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
            imagePath: 'assets/images/systems/digestive_system/lower_tract.webp',
            subcategories: [
              Category(
                id: 'anus', 
                label: _systemIdToLabel('anus'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/anus_horse.webp',
              ),
              Category(
                id: 'large_intestine', 
                label: _systemIdToLabel('large_intestine'), 
                icon: Icons.linear_scale,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/large_intestine.webp',
              ),
              Category(
                id: 'liver', 
                label: _systemIdToLabel('liver'), 
                icon: Icons.local_hospital,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/liver.webp',
              ),
              Category(
                id: 'pancreas', 
                label: _systemIdToLabel('pancreas'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/pancreas.webp',
              ),
              Category(
                id: 'rectum', 
                label: _systemIdToLabel('rectum'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/rectum.webp',
              ),
              Category(
                id: 'small_intestine', 
                label: _systemIdToLabel('small_intestine'), 
                icon: Icons.linear_scale,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/small_intestine.webp',
              ),
            ],
          ),
          Category(
            id: 'upper_tract',
            label: _systemIdToLabel('upper_tract'),
            icon: _getSystemIcon('upper_tract'),
            imagePath: 'assets/images/systems/digestive_system/upper_tract.webp',
            subcategories: [
              Category(
                id: 'esophagus', 
                label: _systemIdToLabel('esophagus'), 
                icon: Icons.linear_scale,
                imagePath: 'assets/images/systems/digestive_system/upper_tract/esophagus.webp',
              ),
              Category(
                id: 'mouth', 
                label: _systemIdToLabel('mouth'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/digestive_system/upper_tract/mouth_horse.webp',
              ),
              Category(
                id: 'pharynx', 
                label: _systemIdToLabel('pharynx'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/digestive_system/upper_tract/pharynx_horse.webp',
              ),
              Category(
                id: 'salivary_glands', 
                label: _systemIdToLabel('salivary_glands'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/digestive_system/upper_tract/salivary_glands.webp',
              ),
              Category(
                id: 'stomach', 
                label: _systemIdToLabel('stomach'), 
                icon: Icons.restaurant,
                imagePath: 'assets/images/systems/digestive_system/upper_tract/stomach.webp',
              ),
              Category(
                id: 'teeth', 
                label: _systemIdToLabel('teeth'), 
                icon: Icons.circle,
                imagePath: 'assets/images/horse/systems/digestive_system/upper_tract/teeth.webp',
              ),
              Category(
                id: 'tongue', 
                label: _systemIdToLabel('tongue'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/digestive_system/upper_tract/mouth_horse.webp',
              ),
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
          Category(
            id: 'adrenal_glands', 
            label: _systemIdToLabel('adrenal_glands'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/adrenal_glands.webp',
          ),
          Category(
            id: 'endocrine_axis', 
            label: _systemIdToLabel('endocrine_axis'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/endocrine_axis.webp',
          ),
          Category(
            id: 'gonads', 
            label: _systemIdToLabel('gonads'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/gonads.webp',
          ),
          Category(
            id: 'hypothalamus', 
            label: _systemIdToLabel('hypothalamus'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/hypothalamus.webp',
          ),
          Category(
            id: 'pancreas_endocrine', 
            label: _systemIdToLabel('pancreas_endocrine'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/pancreas_endocrine.webp',
          ),
          Category(
            id: 'parathyroid_glands', 
            label: _systemIdToLabel('parathyroid_glands'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/parathyroid_glands.webp',
          ),
          Category(
            id: 'pineal_gland', 
            label: _systemIdToLabel('pineal_gland'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/pineal_gland.webp',
          ),
          Category(
            id: 'pituitary', 
            label: _systemIdToLabel('pituitary'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/pituitary.webp',
          ),
          Category(
            id: 'thymus_endocrine', 
            label: _systemIdToLabel('thymus_endocrine'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/thymus_endocrine.webp',
          ),
          Category(
            id: 'thyroid_gland', 
            label: _systemIdToLabel('thyroid_gland'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/thyroid_gland.webp',
          ),
        ],
      ),
      // Hepatobiliary System
      Category(
        id: 'hepatobiliary_system',
        label: _systemIdToLabel('hepatobiliary_system'),
        icon: _getSystemIcon('hepatobiliary_system'),
        imagePath: 'assets/images/systems/hepatobiliary_system.webp',
        subcategories: [
          Category(
            id: 'bile_canaliculi', 
            label: _systemIdToLabel('bile_canaliculi'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/bile_canaliculi.webp',
          ),
          Category(
            id: 'bile_ducts', 
            label: _systemIdToLabel('bile_ducts'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/bile_ducts.webp',
          ),
          Category(
            id: 'bile_storage_and_flow', 
            label: _systemIdToLabel('bile_storage_and_flow'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/hepatobiliary_system/bile_storage_and_flow.webp',
          ),
          Category(
            id: 'common_bile_duct', 
            label: _systemIdToLabel('common_bile_duct'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/common_bile_duct.webp',
          ),
          Category(
            id: 'cystic_duct', 
            label: _systemIdToLabel('cystic_duct'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/cystic_duct.webp',
          ),
          Category(
            id: 'hepatic_artery', 
            label: _systemIdToLabel('hepatic_artery'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/hepatic_artery.webp',
          ),
          Category(
            id: 'hepatic_ducts', 
            label: _systemIdToLabel('hepatic_ducts'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/hepatic_ducts.webp',
          ),
          Category(
            id: 'hepatic_lobules', 
            label: _systemIdToLabel('hepatic_lobules'), 
            icon: Icons.circle,
            imagePath: 'assets/images/systems/hepatobiliary_system/hepatic_lobules.webp',
          ),
          Category(
            id: 'hepatic_vein', 
            label: _systemIdToLabel('hepatic_vein'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/hepatic_vein.webp',
          ),
          Category(
            id: 'kupffer_cells', 
            label: _systemIdToLabel('kupffer_cells'), 
            icon: Icons.circle,
            imagePath: 'assets/images/systems/hepatobiliary_system/kupffer_cells.webp',
          ),
          Category(
            id: 'liver', 
            label: _systemIdToLabel('liver'), 
            icon: Icons.local_hospital,
            imagePath: 'assets/images/systems/hepatobiliary_system/liver.webp',
          ),
          Category(
            id: 'portal_vein', 
            label: _systemIdToLabel('portal_vein'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/portal_vein.webp',
          ),
        ],
      ),
      // Immune System
      Category(
        id: 'immune_system',
        label: _systemIdToLabel('immune_system'),
        icon: _getSystemIcon('immune_system'),
        imagePath: 'assets/images/systems/immune_system.webp',
        subcategories: [
          Category(id: 'bone_marrow', label: _systemIdToLabel('bone_marrow'), icon: Icons.shield),
          Category(id: 'harderian_gland', label: _systemIdToLabel('harderian_gland'), icon: Icons.shield),
          Category(id: 'liver_immune', label: _systemIdToLabel('liver_immune'), icon: Icons.shield),
          Category(id: 'lymph_nodes', label: _systemIdToLabel('lymph_nodes'), icon: Icons.water),
          Category(id: 'peyers_patches', label: _systemIdToLabel('peyers_patches'), icon: Icons.shield),
          Category(id: 'spleen', label: _systemIdToLabel('spleen'), icon: Icons.shield),
          Category(id: 'thymus', label: _systemIdToLabel('thymus'), icon: Icons.shield),
          Category(
            id: 'tissues',
            label: _systemIdToLabel('tissues'),
            icon: Icons.shield,
            subcategories: [
              Category(id: 'BALT', label: 'BALT', icon: Icons.shield),
              Category(id: 'CALT', label: 'CALT', icon: Icons.shield),
              Category(id: 'GALT', label: 'GALT', icon: Icons.shield),
              Category(id: 'MALT', label: 'MALT', icon: Icons.shield),
              Category(id: 'NALT', label: 'NALT', icon: Icons.shield),
              Category(id: 'SALT', label: 'SALT', icon: Icons.shield),
              Category(id: 'hemal_nodes', label: _systemIdToLabel('hemal_nodes'), icon: Icons.shield),
            ],
          ),
          Category(id: 'tonsils', label: _systemIdToLabel('tonsils'), icon: Icons.shield),
        ],
      ),
      // Integumentary System
      Category(
        id: 'integumentary_system',
        label: _systemIdToLabel('integumentary_system'),
        icon: _getSystemIcon('integumentary_system'),
        imagePath: 'assets/images/systems/integumentary_system.webp',
        subcategories: [
          Category(
            id: 'dermis', 
            label: _systemIdToLabel('dermis'), 
            icon: Icons.layers,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'epidermis', 
            label: _systemIdToLabel('epidermis'), 
            icon: Icons.layers,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'glands', 
            label: _systemIdToLabel('glands'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'hair_coat', 
            label: _systemIdToLabel('hair_coat'), 
            icon: Icons.brush,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'hair_follicle_receptors',
            label: _systemIdToLabel('hair_follicle_receptors'), 
            icon: Icons.sensors,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'hypodermis', 
            label: _systemIdToLabel('hypodermis'), 
            icon: Icons.layers,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'mane_tail', 
            label: _systemIdToLabel('mane_tail'), 
            icon: Icons.brush,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'pigmentation_color_patterns', 
            label: _systemIdToLabel('pigmentation_color_patterns'), 
            icon: Icons.palette,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'protective_structures', 
            label: _systemIdToLabel('protective_structures'), 
            icon: Icons.shield,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'whiskers_vibrissae', 
            label: _systemIdToLabel('whiskers_vibrissae'),
            icon: Icons.sensors,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
        ],
      ),
      // Lumbosacral Plexus
      Category(
        id: 'lumbosacral_plexus',
        label: _systemIdToLabel('lumbosacral_plexus'),
        icon: _getSystemIcon('lumbosacral_plexus'),
        imagePath: 'assets/images/systems/lumbosacral_plexus.webp',
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
          Category(
            id: 'lymph', 
            label: _systemIdToLabel('lymph'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/lymph.webp',
          ),
          Category(
            id: 'lymph_capillaries',
            label: _systemIdToLabel('lymph_capillaries'),
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/lymph_capillaries.webp',
          ),
          Category(
            id: 'lymph_nodes', 
            label: _systemIdToLabel('lymph_nodes'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/lymph_nodes.webp',
          ),
          Category(
            id: 'lymph_vessels', 
            label: _systemIdToLabel('lymph_vessels'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/lymph_vessels.webp',
          ),
          Category(
            id: 'peyers_patches', 
            label: _systemIdToLabel('peyers_patches'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/peyers_patches.webp',
          ),
          Category(
            id: 'right_lymphatic_duct', 
            label: _systemIdToLabel('right_lymphatic_duct'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/right_lymphatic_duct.webp',
          ),
          Category(
            id: 'spleen', 
            label: _systemIdToLabel('spleen'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/spleen.webp',
          ),
          Category(
            id: 'thoracic_duct', 
            label: _systemIdToLabel('thoracic_duct'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/thoracic_duct.webp',
          ),
          Category(
            id: 'thymus', 
            label: _systemIdToLabel('thymus'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/thymus.webp',
          ),
          Category(
            id: 'tonsils', 
            label: _systemIdToLabel('tonsils'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/tonsils.webp',
          ),
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
            imagePath: 'assets/images/systems/nervous_system/nervous_system_horse.webp',
            subcategories: [
              Category(
                id: 'enteric_system', 
                label: _systemIdToLabel('enteric_system'), 
                icon: Icons.settings,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_horse.webp',
              ),
              Category(
                id: 'parasympathetic', 
                label: _systemIdToLabel('parasympathetic'), 
                icon: Icons.settings,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_horse.webp',
              ),
              Category(
                id: 'sympathetic', 
                label: _systemIdToLabel('sympathetic'), 
                icon: Icons.settings,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_horse.webp',
              ),
            ],
          ),
          Category(
            id: 'cns',
            label: _systemIdToLabel('cns').toUpperCase(),
            icon: _getSystemIcon('cns'),
            imagePath: 'assets/images/systems/nervous_system/nervous_system_horse.webp',
            subcategories: [
              Category(
                id: 'brain', 
                label: _systemIdToLabel('brain'), 
                icon: Icons.psychology,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_horse.webp',
              ),
              Category(
                id: 'brainstem', 
                label: _systemIdToLabel('brainstem'), 
                icon: Icons.psychology,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_horse.webp',
              ),
              Category(
                id: 'cerebellum', 
                label: _systemIdToLabel('cerebellum'), 
                icon: Icons.psychology,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_horse.webp',
              ),
              Category(
                id: 'spinal_cord', 
                label: _systemIdToLabel('spinal_cord'), 
                icon: Icons.psychology,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_horse.webp',
              ),
            ],
          ),
          Category(
            id: 'pns',
            label: _systemIdToLabel('pns').toUpperCase(),
            icon: _getSystemIcon('pns'),
            imagePath: 'assets/images/systems/nervous_system/nervous_system_horse.webp',
            subcategories: [
              Category(
                id: 'brachial_plexus', 
                label: _systemIdToLabel('brachial_plexus'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_horse.webp',
              ),
              Category(
                id: 'cranial_nerves', 
                label: _systemIdToLabel('cranial_nerves'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_horse.webp',
              ),
              Category(
                id: 'motor_nerves', 
                label: _systemIdToLabel('motor_nerves'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_horse.webp',
              ),
              Category(
                id: 'sensory_nerves', 
                label: _systemIdToLabel('sensory_nerves'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_horse.webp',
              ),
              Category(
                id: 'spinal_nerves', 
                label: _systemIdToLabel('spinal_nerves'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_horse.webp',
              ),
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
            imagePath: 'assets/images/systems/reproductive_system/female.webp',
            subcategories: [
              Category(
                id: 'cervix', 
                label: _systemIdToLabel('cervix'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/female/cervix.webp',
              ),
              Category(
                id: 'external_genitalia', 
                label: _systemIdToLabel('external_genitalia'), 
                icon: Icons.crop_portrait,
                imagePath: 'assets/images/horse/systems/reproductive_system/female/external_genitalia.webp',
              ),
              Category(
                id: 'mammary_glands', 
                label: _systemIdToLabel('mammary_glands'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/reproductive_system/female/mammary_glands.webp',
              ),
              Category(
                id: 'ovaries', 
                label: _systemIdToLabel('ovaries'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/female/ovaries.webp',
              ),
              Category(
                id: 'placenta', 
                label: _systemIdToLabel('placenta'), 
                icon: Icons.favorite,
                imagePath: 'assets/images/horse/systems/reproductive_system/female/placenta.webp',
              ),
              Category(
                id: 'uterine_tubes', 
                label: _systemIdToLabel('uterine_tubes'), 
                icon: Icons.linear_scale,
                imagePath: 'assets/images/systems/reproductive_system/female/uterine_tubes.webp',
              ),
              Category(
                id: 'uterus', 
                label: _systemIdToLabel('uterus'), 
                icon: Icons.favorite,
                imagePath: 'assets/images/systems/reproductive_system/female/uterus.webp',
              ),
              Category(
                id: 'vagina', 
                label: _systemIdToLabel('vagina'), 
                icon: Icons.linear_scale,
                imagePath: 'assets/images/systems/reproductive_system/female/vagina.webp',
              ),
            ],
          ),
          Category(
            id: 'male',
            label: _systemIdToLabel('male'),
            icon: _getSystemIcon('male'),
            imagePath: 'assets/images/systems/reproductive_system/male.webp',
            subcategories: [
              Category(
                id: 'accessory_glands', 
                label: _systemIdToLabel('accessory_glands'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/reproductive_system/male/accessory_glands.webp',
              ),
              Category(
                id: 'epididymis', 
                label: _systemIdToLabel('epididymis'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/male/epididymis.webp',
              ),
              Category(
                id: 'mammary_glands', 
                label: _systemIdToLabel('mammary_glands'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/reproductive_system/male/mammary_glands.webp',
              ),
              Category(
                id: 'penis', 
                label: _systemIdToLabel('penis'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/reproductive_system/male/penis.webp',
              ),
              Category(
                id: 'prepuce', 
                label: _systemIdToLabel('prepuce'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/reproductive_system/male/prepuce.webp',
              ),
              Category(
                id: 'sperm_duct', 
                label: _systemIdToLabel('sperm_duct'), 
                icon: Icons.linear_scale,
                imagePath: 'assets/images/systems/reproductive_system/male/sperm_duct.webp',
              ),
              Category(
                id: 'testes', 
                label: _systemIdToLabel('testes'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/male/testes.webp',
              ),
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
          Category(
            id: 'kidneys', 
            label: _systemIdToLabel('kidneys'), 
            icon: Icons.water_drop,
            imagePath: 'assets/images/systems/urinary_system/kidneys.webp',
          ),
          Category(
            id: 'ureters', 
            label: _systemIdToLabel('ureters'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/urinary_system/ureters.webp',
          ),
          Category(
            id: 'urethra', 
            label: _systemIdToLabel('urethra'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/urinary_system/urethra.webp',
          ),
          Category(
            id: 'urinary_bladder', 
            label: _systemIdToLabel('urinary_bladder'), 
            icon: Icons.opacity,
            imagePath: 'assets/images/systems/urinary_system/urinary_bladder.webp',
          ),
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
          Category(
            id: 'arteries', 
            label: _systemIdToLabel('arteries'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/cardiovascular_system/arteries.webp',
          ),
          Category(
            id: 'blood', 
            label: _systemIdToLabel('blood'), 
            icon: Icons.bloodtype,
            imagePath: 'assets/images/systems/cardiovascular_system/blood.webp',
          ),
          Category(
            id: 'capillaries', 
            label: _systemIdToLabel('capillaries'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/cardiovascular_system/capillaries.webp',
          ),
          Category(
            id: 'heart', 
            label: _systemIdToLabel('heart'), 
            icon: Icons.favorite,
            imagePath: 'assets/images/systems/cardiovascular_system/heart.webp',
          ),
          Category(
            id: 'pericardium', 
            label: _systemIdToLabel('pericardium'), 
            icon: Icons.favorite,
            imagePath: 'assets/images/systems/cardiovascular_system/pericardium.webp',
          ),
          Category(
            id: 'veins', 
            label: _systemIdToLabel('veins'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/cardiovascular_system/veins.webp',
          ),
        ],
      ),
      // Cranial Nerves
      Category(
        id: 'cranial_nerves',
        label: _systemIdToLabel('cranial_nerves'),
        icon: _getSystemIcon('cranial_nerves'),
        imagePath: 'assets/images/systems/cranial_nerves_main.webp',
        subcategories: [
          Category(
            id: 'abducent_nerve_vi', 
            label: _systemIdToLabel('abducent_nerve_vi'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'accessory_nerve_xi', 
            label: _systemIdToLabel('accessory_nerve_xi'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'facial_nerve_vii', 
            label: _systemIdToLabel('facial_nerve_vii'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'glossopharyngeal_nerve_ix', 
            label: _systemIdToLabel('glossopharyngeal_nerve_ix'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'hypoglossal_nerve_xii', 
            label: _systemIdToLabel('hypoglossal_nerve_xii'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'oculomotor_nerve_iii', 
            label: _systemIdToLabel('oculomotor_nerve_iii'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'olfactory_nerve_i', 
            label: _systemIdToLabel('olfactory_nerve_i'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'optic_nerve_ii', 
            label: _systemIdToLabel('optic_nerve_ii'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'trigeminal_nerve_v', 
            label: _systemIdToLabel('trigeminal_nerve_v'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'trochlear_nerve_iv', 
            label: _systemIdToLabel('trochlear_nerve_iv'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'vagus_nerve_x', 
            label: _systemIdToLabel('vagus_nerve_x'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'vestibulocochlear_nerve_viii', 
            label: _systemIdToLabel('vestibulocochlear_nerve_viii'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
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
            imagePath: 'assets/images/systems/digestive_system/lower_tract.webp',
            subcategories: [
              Category(
                id: 'anus', 
                label: _systemIdToLabel('anus'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/anus_dog.webp',
              ),
              Category(
                id: 'large_intestine', 
                label: _systemIdToLabel('large_intestine'), 
                icon: Icons.linear_scale,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/large_intestine.webp',
              ),
              Category(
                id: 'liver', 
                label: _systemIdToLabel('liver'), 
                icon: Icons.local_hospital,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/liver.webp',
              ),
              Category(
                id: 'pancreas', 
                label: _systemIdToLabel('pancreas'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/pancreas.webp',
                ),
              Category(
                id: 'rectum', 
                label: _systemIdToLabel('rectum'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/rectum.webp',
              ),
              Category(
                id: 'small_intestine', 
                label: _systemIdToLabel('small_intestine'), 
                icon: Icons.linear_scale,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/small_intestine.webp',
              ),
            ],
          ),
          Category(
            id: 'upper_tract',
            label: _systemIdToLabel('upper_tract'),
            icon: _getSystemIcon('upper_tract'),
            imagePath: 'assets/images/systems/digestive_system/upper_tract.webp',
            subcategories: [
              Category(
                id: 'esophagus', 
                label: _systemIdToLabel('esophagus'), 
                icon: Icons.linear_scale,
                imagePath: 'assets/images/systems/digestive_system/upper_tract/esophagus.webp',
              ),
              Category(
                id: 'mouth', 
                label: _systemIdToLabel('mouth'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/digestive_system/upper_tract/mouth_dog.webp',
              ),
              Category(
                id: 'pharynx', 
                label: _systemIdToLabel('pharynx'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/digestive_system/upper_tract/pharynx_dog.webp',
              ),
              Category(
                id: 'salivary_glands', 
                label: _systemIdToLabel('salivary_glands'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/digestive_system/upper_tract/salivary_glands.webp',
              ),
              Category(
                id: 'stomach', 
                label: _systemIdToLabel('stomach'), 
                icon: Icons.restaurant,
                imagePath: 'assets/images/systems/digestive_system/upper_tract/stomach.webp',
              ),
              Category(
                id: 'teeth', 
                label: _systemIdToLabel('teeth'), 
                icon: Icons.circle,
                imagePath: 'assets/images/dog/systems/digestive_system/upper_tract/teeth.webp',
              ),
              Category(
                id: 'tongue', 
                label: _systemIdToLabel('tongue'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/digestive_system/upper_tract/mouth_dog.webp',
              ),
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
          Category(
            id: 'adrenal_glands', 
            label: _systemIdToLabel('adrenal_glands'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/adrenal_glands.webp',
          ),
          Category(
            id: 'endocrine_axis',
            label: _systemIdToLabel('endocrine_axis'),
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/endocrine_axis.webp',
          ),
          Category(
            id: 'gonads', 
            label: _systemIdToLabel('gonads'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/gonads.webp',
          ),
          Category(
            id: 'hypothalamus',
            label: _systemIdToLabel('hypothalamus'),
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/hypothalamus.webp',
          ),
          Category(
            id: 'pancreas_endocrine',
            label: _systemIdToLabel('pancreas_endocrine'),
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/pancreas_endocrine.webp',
          ),
          Category(
            id: 'parathyroid_glands',
            label: _systemIdToLabel('parathyroid_glands'),
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/parathyroid_glands.webp',
          ),
          Category(
            id: 'pineal_gland',
            label: _systemIdToLabel('pineal_gland'),
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/pineal_gland.webp',
          ),
          Category(
            id: 'pituitary',
            label: _systemIdToLabel('pituitary'),
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/pituitary.webp',
          ),
          Category(
            id: 'thymus_endocrine',
            label: _systemIdToLabel('thymus_endocrine'),
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/thymus_endocrine.webp',
          ),
          Category(
            id: 'thyroid_gland',
            label: _systemIdToLabel('thyroid_gland'),
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/thyroid_gland.webp',
          ),
        ],
      ),
      // Hepatobiliary System
      Category(
        id: 'hepatobiliary_system',
        label: _systemIdToLabel('hepatobiliary_system'),
        icon: _getSystemIcon('hepatobiliary_system'),
        imagePath: 'assets/images/systems/hepatobiliary_system.webp',
        subcategories: [
          Category(
            id: 'bile_canaliculi', 
            label: _systemIdToLabel('bile_canaliculi'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/bile_canaliculi.webp',
          ),
          Category(
            id: 'bile_ducts', 
            label: _systemIdToLabel('bile_ducts'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/bile_ducts.webp',
          ),
          Category(
            id: 'common_bile_duct', 
            label: _systemIdToLabel('common_bile_duct'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/common_bile_duct.webp',
          ),
          Category(
            id: 'cystic_duct', 
            label: _systemIdToLabel('cystic_duct'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/cystic_duct.webp',
          ),
          Category(
            id: 'gallbladder', 
            label: _systemIdToLabel('gallbladder'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/hepatobiliary_system/gallbladder.webp',
          ),
          Category(
            id: 'hepatic_artery', 
            label: _systemIdToLabel('hepatic_artery'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/hepatic_artery.webp',
          ),
          Category(
            id: 'hepatic_ducts', 
            label: _systemIdToLabel('hepatic_ducts'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/hepatic_ducts.webp',
          ),
          Category(
            id: 'hepatic_lobules', 
            label: _systemIdToLabel('hepatic_lobules'), 
            icon: Icons.circle,
            imagePath: 'assets/images/systems/hepatobiliary_system/hepatic_lobules.webp',
          ),
          Category(
            id: 'hepatic_vein', 
            label: _systemIdToLabel('hepatic_vein'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/hepatic_vein.webp',
          ),
          Category(
            id: 'kupffer_cells', 
            label: _systemIdToLabel('kupffer_cells'), 
            icon: Icons.circle,
            imagePath: 'assets/images/systems/hepatobiliary_system/kupffer_cells.webp',
          ),
          Category(
            id: 'liver', 
            label: _systemIdToLabel('liver'), 
            icon: Icons.local_hospital,
            imagePath: 'assets/images/systems/hepatobiliary_system/liver.webp',
          ),
          Category(
            id: 'portal_vein', 
            label: _systemIdToLabel('portal_vein'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/portal_vein.webp',
          ),
        ],
      ),
      // Immune System
      Category(
        id: 'immune_system',
        label: _systemIdToLabel('immune_system'),
        icon: _getSystemIcon('immune_system'),
        imagePath: 'assets/images/systems/immune_system.webp',
        subcategories: [
          Category(id: 'bone_marrow', label: _systemIdToLabel('bone_marrow'), icon: Icons.shield),
          Category(id: 'harderian_gland', label: _systemIdToLabel('harderian_gland'), icon: Icons.shield),
          Category(id: 'liver_immune', label: _systemIdToLabel('liver_immune'), icon: Icons.shield),
          Category(id: 'lymph_nodes', label: _systemIdToLabel('lymph_nodes'), icon: Icons.water),
          Category(id: 'peyers_patches', label: _systemIdToLabel('peyers_patches'), icon: Icons.shield),
          Category(id: 'spleen', label: _systemIdToLabel('spleen'), icon: Icons.shield),
          Category(id: 'thymus', label: _systemIdToLabel('thymus'), icon: Icons.shield),
          Category(
            id: 'tissues',
            label: _systemIdToLabel('tissues'),
            icon: Icons.shield,
            subcategories: [
              Category(id: 'BALT', label: 'BALT', icon: Icons.shield),
              Category(id: 'CALT', label: 'CALT', icon: Icons.shield),
              Category(id: 'GALT', label: 'GALT', icon: Icons.shield),
              Category(id: 'MALT', label: 'MALT', icon: Icons.shield),
              Category(id: 'hemal_nodes', label: _systemIdToLabel('hemal_nodes'), icon: Icons.shield),
            ],
          ),
          Category(id: 'tonsils', label: _systemIdToLabel('tonsils'), icon: Icons.shield),
        ],
      ),
      // Integumentary System
      Category(
        id: 'integumentary_system',
        label: _systemIdToLabel('integumentary_system'),
        icon: _getSystemIcon('integumentary_system'),
        imagePath: 'assets/images/systems/integumentary_system.webp',
        subcategories: [
          Category(
            id: 'dermis', 
            label: _systemIdToLabel('dermis'), 
            icon: Icons.layers,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'epidermis', 
            label: _systemIdToLabel('epidermis'),
            icon: Icons.layers,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'glands', 
            label: _systemIdToLabel('glands'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'hair_coat', 
            label: _systemIdToLabel('hair_coat'), 
            icon: Icons.brush,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'hair_follicle_receptors', 
            label: _systemIdToLabel('hair_follicle_receptors'), 
            icon: Icons.sensors,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'hypodermis', 
            label: _systemIdToLabel('hypodermis'), 
            icon: Icons.layers,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'mane_tail', 
            label: _systemIdToLabel('mane_tail'), 
            icon: Icons.brush,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'pigmentation_color_patterns', 
            label: _systemIdToLabel('pigmentation_color_patterns'), 
            icon: Icons.palette,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'protective_structures', 
            label: _systemIdToLabel('protective_structures'), 
            icon: Icons.shield,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'whiskers_vibrissae', 
            label: _systemIdToLabel('whiskers_vibrissae'), 
            icon: Icons.sensors,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
        ],
      ),
      // Lumbosacral Plexus
      Category(
        id: 'lumbosacral_plexus',
        label: _systemIdToLabel('lumbosacral_plexus'),
        icon: _getSystemIcon('lumbosacral_plexus'),
        imagePath: 'assets/images/systems/lumbosacral_plexus.webp',
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
          Category(
            id: 'lymph', 
            label: _systemIdToLabel('lymph'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/lymph.webp',
          ),
          Category(
            id: 'lymph_capillaries', 
            label: _systemIdToLabel('lymph_capillaries'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/lymph_capillaries.webp',
          ),
          Category(
            id: 'lymph_nodes', 
            label: _systemIdToLabel('lymph_nodes'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/lymph_nodes.webp',
          ),
          Category(
            id: 'lymph_vessels', 
            label: _systemIdToLabel('lymph_vessels'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/lymph_vessels.webp',
          ),
          Category(
            id: 'peyers_patches', 
            label: _systemIdToLabel('peyers_patches'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/peyers_patches.webp',
          ),
          Category(
            id: 'right_lymphatic_duct', 
            label: _systemIdToLabel('right_lymphatic_duct'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/right_lymphatic_duct.webp',
          ),
          Category(
            id: 'spleen', 
            label: _systemIdToLabel('spleen'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/spleen.webp',
          ),
          Category(
            id: 'thoracic_duct', 
            label: _systemIdToLabel('thoracic_duct'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/thoracic_duct.webp',
          ),
          Category(
            id: 'thymus', 
            label: _systemIdToLabel('thymus'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/thymus.webp',
          ),
          Category(
            id: 'tonsils', 
            label: _systemIdToLabel('tonsils'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/tonsils.webp',
          ),
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
            imagePath: 'assets/images/systems/nervous_system/nervous_system_dog.webp',
            subcategories: [
              Category(
                id: 'enteric_system', 
                label: _systemIdToLabel('enteric_system'), 
                icon: Icons.settings,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_dog.webp',
              ),
              Category(
                id: 'parasympathetic', 
                label: _systemIdToLabel('parasympathetic'), 
                icon: Icons.settings,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_dog.webp',
              ),
              Category(
                id: 'sympathetic', 
                label: _systemIdToLabel('sympathetic'), 
                icon: Icons.settings,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_dog.webp',
              ),
            ],
          ),
          Category(
            id: 'cns',
            label: _systemIdToLabel('cns').toUpperCase(),
            icon: _getSystemIcon('cns'),
            imagePath: 'assets/images/systems/nervous_system/nervous_system_dog.webp',
            subcategories: [
              Category(
                id: 'brain', 
                label: _systemIdToLabel('brain'), 
                icon: Icons.psychology,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_dog.webp',
              ),
              Category(
                id: 'brainstem', 
                label: _systemIdToLabel('brainstem'), 
                icon: Icons.psychology,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_dog.webp',
              ),
              Category(
                id: 'cerebellum', 
                label: _systemIdToLabel('cerebellum'), 
                icon: Icons.psychology,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_dog.webp',
              ),
              Category(
                id: 'spinal_cord', 
                label: _systemIdToLabel('spinal_cord'), 
                icon: Icons.psychology,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_dog.webp',
              ),
            ],
          ),
          Category(
            id: 'pns',
            label: _systemIdToLabel('pns').toUpperCase(),
            icon: _getSystemIcon('pns'),
            imagePath: 'assets/images/systems/nervous_system/nervous_system_dog.webp',
            subcategories: [
              Category(
                id: 'brachial_plexus', 
                label: _systemIdToLabel('brachial_plexus'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_dog.webp',
              ),
              Category(
                id: 'cranial_nerves',
                label: _systemIdToLabel('cranial_nerves'),
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_dog.webp',
              ),
              Category(
                id: 'motor_nerves', 
                label: _systemIdToLabel('motor_nerves'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_dog.webp',
              ),
              Category(
                id: 'sensory_nerves', 
                label: _systemIdToLabel('sensory_nerves'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_dog.webp',
              ),
              Category(
                id: 'spinal_nerves', 
                label: _systemIdToLabel('spinal_nerves'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_dog.webp',
              ),
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
            imagePath: 'assets/images/systems/reproductive_system/female.webp',
            subcategories: [
              Category(
                id: 'cervix', 
                label: _systemIdToLabel('cervix'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/female/cervix.webp',
              ),
              Category(
                id: 'external_genitalia', 
                label: _systemIdToLabel('external_genitalia'), 
                icon: Icons.crop_portrait,
                imagePath: 'assets/images/dog/systems/reproductive_system/female/external_genitalia.webp',
              ),
              Category(
                id: 'mammary_glands', 
                label: _systemIdToLabel('mammary_glands'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/reproductive_system/female/mammary_glands.webp',
              ),
              Category(
                id: 'ovaries', 
                label: _systemIdToLabel('ovaries'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/female/ovaries.webp',
              ),
              Category(
                id: 'placenta', 
                label: _systemIdToLabel('placenta'), 
                icon: Icons.favorite,
                imagePath: 'assets/images/systems/reproductive_system/female/placenta_dog.webp',
              ),
              Category(
                id: 'uterine_tubes', 
                label: _systemIdToLabel('uterine_tubes'), 
                icon: Icons.linear_scale,
                imagePath: 'assets/images/systems/reproductive_system/female/uterine_tubes.webp',
              ),
              Category(
                id: 'uterus', 
                label: _systemIdToLabel('uterus'), 
                icon: Icons.favorite,
                imagePath: 'assets/images/systems/reproductive_system/female/uterus.webp',
              ),
              Category(
                id: 'vagina', 
                label: _systemIdToLabel('vagina'), 
                icon: Icons.linear_scale,
                imagePath: 'assets/images/systems/reproductive_system/female/vagina.webp',
              ),
            ],
          ),
          Category(
            id: 'male',
            label: _systemIdToLabel('male'),
            icon: _getSystemIcon('male'),
            imagePath: 'assets/images/systems/reproductive_system/male.webp',
            subcategories: [
              Category(
                id: 'accessory_glands', 
                label: _systemIdToLabel('accessory_glands'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/reproductive_system/male/accessory_glands.webp',
              ),
              Category(
                id: 'epididymis', 
                label: _systemIdToLabel('epididymis'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/male/epididymis.webp',
              ),
              Category(
                id: 'mammary_glands', 
                label: _systemIdToLabel('mammary_glands'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/reproductive_system/male/mammary_glands.webp',
              ),
              Category(
                id: 'penis', 
                label: _systemIdToLabel('penis'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/reproductive_system/male/penis.webp',
              ),
              Category(
                id: 'prepuce', 
                label: _systemIdToLabel('prepuce'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/reproductive_system/male/prepuce.webp',
              ),
              Category(
                id: 'sperm_duct', 
                label: _systemIdToLabel('sperm_duct'), 
                icon: Icons.linear_scale,
                imagePath: 'assets/images/systems/reproductive_system/male/sperm_duct.webp',
              ),
              Category(
                id: 'testes', 
                label: _systemIdToLabel('testes'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/male/testes.webp',
              ),
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
          Category(
            id: 'kidneys', 
            label: _systemIdToLabel('kidneys'), 
            icon: Icons.water_drop,
            imagePath: 'assets/images/systems/urinary_system/kidneys.webp',
          ),
          Category(
            id: 'ureters', 
            label: _systemIdToLabel('ureters'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/urinary_system/ureters.webp',
          ),
          Category(
            id: 'urethra', 
            label: _systemIdToLabel('urethra'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/urinary_system/urethra.webp',
          ),
          Category(
            id: 'urinary_bladder', 
            label: _systemIdToLabel('urinary_bladder'), 
            icon: Icons.opacity,
            imagePath: 'assets/images/systems/urinary_system/urinary_bladder.webp',
          ),
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
          Category(
            id: 'arteries', 
            label: _systemIdToLabel('arteries'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/cardiovascular_system/arteries.webp',
          ),
          Category(
            id: 'blood', 
            label: _systemIdToLabel('blood'), 
            icon: Icons.bloodtype,
            imagePath: 'assets/images/systems/cardiovascular_system/blood.webp',
          ),
          Category(
            id: 'capillaries', 
            label: _systemIdToLabel('capillaries'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/cardiovascular_system/capillaries.webp',
          ),
          Category(
            id: 'heart', 
            label: _systemIdToLabel('heart'), 
            icon: Icons.favorite,
            imagePath: 'assets/images/systems/cardiovascular_system/heart.webp',
          ),
          Category(
            id: 'pericardium', 
            label: _systemIdToLabel('pericardium'), 
            icon: Icons.favorite,
            imagePath: 'assets/images/systems/cardiovascular_system/pericardium.webp',
          ),
          Category(
            id: 'veins', 
            label: _systemIdToLabel('veins'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/cardiovascular_system/veins.webp',
          ),
        ],
      ),
      // Cranial Nerves
      Category(
        id: 'cranial_nerves',
        label: _systemIdToLabel('cranial_nerves'),
        icon: _getSystemIcon('cranial_nerves'),
        imagePath: 'assets/images/systems/cranial_nerves_main.webp',
        subcategories: [
          Category(
            id: 'abducent_nerve_vi', 
            label: _systemIdToLabel('abducent_nerve_vi'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'accessory_nerve_xi', 
            label: _systemIdToLabel('accessory_nerve_xi'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'facial_nerve_vii', 
            label: _systemIdToLabel('facial_nerve_vii'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'glossopharyngeal_nerve_ix', 
            label: _systemIdToLabel('glossopharyngeal_nerve_ix'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'hypoglossal_nerve_xii', 
            label: _systemIdToLabel('hypoglossal_nerve_xii'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'oculomotor_nerve_iii', 
            label: _systemIdToLabel('oculomotor_nerve_iii'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'olfactory_nerve_i', 
            label: _systemIdToLabel('olfactory_nerve_i'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'optic_nerve_ii', 
            label: _systemIdToLabel('optic_nerve_ii'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'trigeminal_nerve_v', 
            label: _systemIdToLabel('trigeminal_nerve_v'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'trochlear_nerve_iv', 
            label: _systemIdToLabel('trochlear_nerve_iv'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'vagus_nerve_x', 
            label: _systemIdToLabel('vagus_nerve_x'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'vestibulocochlear_nerve_viii', 
            label: _systemIdToLabel('vestibulocochlear_nerve_viii'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
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
            imagePath: 'assets/images/systems/digestive_system/lower_tract.webp',
            subcategories: [
              Category(
                id: 'anus', 
                label: _systemIdToLabel('anus'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/anus_cat.webp',
              ),
              Category(
                id: 'large_intestine', 
                label: _systemIdToLabel('large_intestine'), 
                icon: Icons.linear_scale,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/large_intestine.webp',
              ),
              Category(
                id: 'liver', 
                label: _systemIdToLabel('liver'), 
                icon: Icons.local_hospital,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/liver.webp',
              ),
              Category(
                id: 'pancreas', 
                label: _systemIdToLabel('pancreas'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/pancreas.webp',
              ),
              Category(
                id: 'rectum', 
                label: _systemIdToLabel('rectum'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/rectum.webp',
              ),
              Category(
                id: 'small_intestine', 
                label: _systemIdToLabel('small_intestine'), 
                icon: Icons.linear_scale,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/small_intestine.webp',
              ),
            ],
          ),
          Category(
            id: 'upper_tract',
            label: _systemIdToLabel('upper_tract'),
            icon: _getSystemIcon('upper_tract'),
            imagePath: 'assets/images/systems/digestive_system/upper_tract.webp',
            subcategories: [
              Category(
                id: 'esophagus', 
                label: _systemIdToLabel('esophagus'), 
                icon: Icons.linear_scale,
                imagePath: 'assets/images/systems/digestive_system/upper_tract/esophagus.webp',
              ),
              Category(
                id: 'mouth', 
                label: _systemIdToLabel('mouth'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/digestive_system/upper_tract/mouth_cat.webp',
              ),
              Category(
                id: 'pharynx', 
                label: _systemIdToLabel('pharynx'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/digestive_system/upper_tract/pharynx_cat.webp',
              ),
              Category(
                id: 'salivary_glands', 
                label: _systemIdToLabel('salivary_glands'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/digestive_system/upper_tract/salivary_glands.webp',
              ),
              Category(
                id: 'stomach', 
                label: _systemIdToLabel('stomach'), 
                icon: Icons.restaurant,
                imagePath: 'assets/images/systems/digestive_system/upper_tract/stomach.webp',
              ),
              Category(
                id: 'teeth', 
                label: _systemIdToLabel('teeth'), 
                icon: Icons.circle,
                imagePath: 'assets/images/cat/systems/digestive_system/upper_tract/teeth.webp',
              ),
              Category(
                id: 'tongue', 
                label: _systemIdToLabel('tongue'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/digestive_system/upper_tract/mouth_cat.webp',
              ),
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
          Category(
            id: 'adrenal_glands', 
            label: _systemIdToLabel('adrenal_glands'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/adrenal_glands.webp',
          ),
          Category(
            id: 'endocrine_axis', 
            label: _systemIdToLabel('endocrine_axis'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/endocrine_axis.webp',
          ),
          Category(
            id: 'gonads', 
            label: _systemIdToLabel('gonads'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/gonads.webp',
          ),
          Category(
            id: 'hypothalamus', 
            label: _systemIdToLabel('hypothalamus'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/hypothalamus.webp',
          ),
          Category(
            id: 'pancreas_endocrine', 
            label: _systemIdToLabel('pancreas_endocrine'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/pancreas_endocrine.webp',
          ),
          Category(
            id: 'parathyroid_glands', 
            label: _systemIdToLabel('parathyroid_glands'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/parathyroid_glands.webp',
          ),
          Category(
            id: 'pineal_gland', 
            label: _systemIdToLabel('pineal_gland'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/pineal_gland.webp',
          ),
          Category(
            id: 'pituitary', 
            label: _systemIdToLabel('pituitary'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/pituitary.webp',
          ),
          Category(
            id: 'thymus_endocrine', 
            label: _systemIdToLabel('thymus_endocrine'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/thymus_endocrine.webp',
          ),
          Category(
            id: 'thyroid_gland', 
            label: _systemIdToLabel('thyroid_gland'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/thyroid_gland.webp',
          ),
        ],
      ),
      // Hepatobiliary System
      Category(
        id: 'hepatobiliary_system',
        label: _systemIdToLabel('hepatobiliary_system'),
        icon: _getSystemIcon('hepatobiliary_system'),
        imagePath: 'assets/images/systems/hepatobiliary_system.webp',
        subcategories: [
          Category(
            id: 'bile_canaliculi', 
            label: _systemIdToLabel('bile_canaliculi'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/bile_canaliculi.webp',
          ),
          Category(
            id: 'bile_ducts', 
            label: _systemIdToLabel('bile_ducts'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/bile_ducts.webp',
          ),
          Category(
            id: 'common_bile_duct', 
            label: _systemIdToLabel('common_bile_duct'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/common_bile_duct.webp',
          ),
          Category(
            id: 'cystic_duct', 
            label: _systemIdToLabel('cystic_duct'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/cystic_duct.webp',
          ),
          Category(
            id: 'gallbladder', 
            label: _systemIdToLabel('gallbladder'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/hepatobiliary_system/gallbladder.webp',
          ),
          Category(
            id: 'hepatic_artery', 
            label: _systemIdToLabel('hepatic_artery'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/hepatic_artery.webp',
          ),
          Category(
            id: 'hepatic_ducts', 
            label: _systemIdToLabel('hepatic_ducts'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/hepatic_ducts.webp',
          ),
          Category(
            id: 'hepatic_lobules', 
            label: _systemIdToLabel('hepatic_lobules'), 
            icon: Icons.circle,
            imagePath: 'assets/images/systems/hepatobiliary_system/hepatic_lobules.webp',
          ),
          Category(
            id: 'hepatic_vein', 
            label: _systemIdToLabel('hepatic_vein'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/hepatic_vein.webp',
          ),
          Category(
            id: 'kupffer_cells', 
            label: _systemIdToLabel('kupffer_cells'), 
            icon: Icons.circle,
            imagePath: 'assets/images/systems/hepatobiliary_system/kupffer_cells.webp',
          ),
          Category(
            id: 'liver', 
            label: _systemIdToLabel('liver'), 
            icon: Icons.local_hospital,
            imagePath: 'assets/images/systems/hepatobiliary_system/liver.webp',
          ),
          Category(
            id: 'portal_vein', 
            label: _systemIdToLabel('portal_vein'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/portal_vein.webp',
          ),
        ],
      ),
      // Immune System
      Category(
        id: 'immune_system',
        label: _systemIdToLabel('immune_system'),
        icon: _getSystemIcon('immune_system'),
        imagePath: 'assets/images/systems/immune_system.webp',
        subcategories: [
          Category(id: 'bone_marrow', label: _systemIdToLabel('bone_marrow'), icon: Icons.shield),
          Category(id: 'harderian_gland', label: _systemIdToLabel('harderian_gland'), icon: Icons.shield),
          Category(id: 'liver_immune', label: _systemIdToLabel('liver_immune'), icon: Icons.shield),
          Category(id: 'lymph_nodes', label: _systemIdToLabel('lymph_nodes'), icon: Icons.water),
          Category(id: 'peyers_patches', label: _systemIdToLabel('peyers_patches'), icon: Icons.shield),
          Category(id: 'spleen', label: _systemIdToLabel('spleen'), icon: Icons.shield),
          Category(id: 'thymus', label: _systemIdToLabel('thymus'), icon: Icons.shield),
          Category(
            id: 'tissues',
            label: _systemIdToLabel('tissues'),
            icon: Icons.shield,
            subcategories: [
              Category(id: 'BALT', label: 'BALT', icon: Icons.shield),
              Category(id: 'CALT', label: 'CALT', icon: Icons.shield),
              Category(id: 'GALT', label: 'GALT', icon: Icons.shield),
              Category(id: 'MALT', label: 'MALT', icon: Icons.shield),
              Category(id: 'hemal_nodes', label: _systemIdToLabel('hemal_nodes'), icon: Icons.shield),
            ],
          ),
          Category(id: 'tonsils', label: _systemIdToLabel('tonsils'), icon: Icons.shield),
        ],
      ),
      // Integumentary System
      Category(
        id: 'integumentary_system',
        label: _systemIdToLabel('integumentary_system'),
        icon: _getSystemIcon('integumentary_system'),
        imagePath: 'assets/images/systems/integumentary_system.webp',
        subcategories: [
          Category(
            id: 'dermis', 
            label: _systemIdToLabel('dermis'), 
            icon: Icons.layers,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'epidermis', 
            label: _systemIdToLabel('epidermis'), 
            icon: Icons.layers,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'glands', 
            label: _systemIdToLabel('glands'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'hair_coat', 
            label: _systemIdToLabel('hair_coat'), 
            icon: Icons.brush,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'hair_follicle_receptors', 
            label: _systemIdToLabel('hair_follicle_receptors'), 
            icon: Icons.sensors,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'hypodermis', 
            label: _systemIdToLabel('hypodermis'), 
            icon: Icons.layers,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'mane_tail', 
            label: _systemIdToLabel('mane_tail'), 
            icon: Icons.brush,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'pigmentation_color_patterns', 
            label: _systemIdToLabel('pigmentation_color_patterns'),
            icon: Icons.palette,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'protective_structures', 
            label: _systemIdToLabel('protective_structures'), 
            icon: Icons.shield,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
          Category(
            id: 'whiskers_vibrissae', 
            label: _systemIdToLabel('whiskers_vibrissae'), 
            icon: Icons.sensors,
            imagePath: 'assets/images/systems/integumentary_system/integumentary_parts.webp',
          ),
        ],
      ),
      // Lumbosacral Plexus
      Category(
        id: 'lumbosacral_plexus',
        label: _systemIdToLabel('lumbosacral_plexus'),
        icon: _getSystemIcon('lumbosacral_plexus'),
        imagePath: 'assets/images/systems/lumbosacral_plexus.webp',
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
          Category(
            id: 'lymph', 
            label: _systemIdToLabel('lymph'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/lymph.webp',
          ),
          Category(
            id: 'lymph_capillaries', 
            label: _systemIdToLabel('lymph_capillaries'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/lymph_capillaries.webp',
          ),
          Category(
            id: 'lymph_nodes', 
            label: _systemIdToLabel('lymph_nodes'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/lymph_nodes.webp',
          ),
          Category(
            id: 'lymph_vessels', 
            label: _systemIdToLabel('lymph_vessels'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/lymph_vessels.webp',
          ),
          Category(
            id: 'peyers_patches', 
            label: _systemIdToLabel('peyers_patches'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/peyers_patches.webp',
          ),
          Category(
            id: 'right_lymphatic_duct', 
            label: _systemIdToLabel('right_lymphatic_duct'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/right_lymphatic_duct.webp',
          ),
          Category(
            id: 'spleen', 
            label: _systemIdToLabel('spleen'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/spleen.webp',
          ),
          Category(
            id: 'thoracic_duct', 
            label: _systemIdToLabel('thoracic_duct'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/thoracic_duct.webp',
          ),
          Category(
            id: 'thymus', 
            label: _systemIdToLabel('thymus'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/thymus.webp',
          ),
          Category(
            id: 'tonsils', 
            label: _systemIdToLabel('tonsils'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/tonsils.webp',
          ),
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
            imagePath: 'assets/images/systems/nervous_system/nervous_system_cat.webp',
            subcategories: [
              Category(
                id: 'enteric_system', 
                label: _systemIdToLabel('enteric_system'), 
                icon: Icons.settings,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_cat.webp',
              ),
              Category(
                id: 'parasympathetic', 
                label: _systemIdToLabel('parasympathetic'), 
                icon: Icons.settings,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_cat.webp',
              ),
              Category(
                id: 'sympathetic', 
                label: _systemIdToLabel('sympathetic'), 
                icon: Icons.settings,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_cat.webp',
              ),
            ],
          ),
          Category(
            id: 'cns',
            label: _systemIdToLabel('cns').toUpperCase(),
            icon: _getSystemIcon('cns'),
            imagePath: 'assets/images/systems/nervous_system/nervous_system_cat.webp',
            subcategories: [
              Category(
                id: 'brain', 
                label: _systemIdToLabel('brain'), 
                icon: Icons.psychology,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_cat.webp',
              ),
              Category(
                id: 'brainstem', 
                label: _systemIdToLabel('brainstem'), 
                icon: Icons.psychology,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_cat.webp',
              ),
              Category(
                id: 'cerebellum', 
                label: _systemIdToLabel('cerebellum'), 
                icon: Icons.psychology,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_cat.webp',
              ),
              Category(
                id: 'spinal_cord', 
                label: _systemIdToLabel('spinal_cord'), 
                icon: Icons.psychology,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_cat.webp',
              ),
            ],
          ),
          Category(
            id: 'pns',
            label: _systemIdToLabel('pns').toUpperCase(),
            icon: _getSystemIcon('pns'),
            imagePath: 'assets/images/systems/nervous_system/nervous_system_cat.webp',
            subcategories: [
              Category(
                id: 'brachial_plexus', 
                label: _systemIdToLabel('brachial_plexus'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_cat.webp',
              ),
              Category(
                id: 'cranial_nerves',
                label: _systemIdToLabel('cranial_nerves'),
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_cat.webp',
              ),
              Category(
                id: 'motor_nerves', 
                label: _systemIdToLabel('motor_nerves'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_cat.webp',
              ),
              Category(
                id: 'sensory_nerves', 
                label: _systemIdToLabel('sensory_nerves'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_cat.webp',
              ),
              Category(
                id: 'spinal_nerves', 
                label: _systemIdToLabel('spinal_nerves'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_cat.webp',
              ),
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
            imagePath: 'assets/images/systems/reproductive_system/female.webp',
            subcategories: [
              Category(
                id: 'cervix', 
                label: _systemIdToLabel('cervix'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/female/cervix.webp',
              ),
              Category(
                id: 'external_genitalia', 
                label: _systemIdToLabel('external_genitalia'), 
                icon: Icons.circle,
                imagePath: 'assets/images/cat/systems/reproductive_system/female/external_genitalia.webp',
              ),
              Category(
                id: 'mammary_glands', 
                label: _systemIdToLabel('mammary_glands'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/female/mammary_glands.webp',
              ),
              Category(
                id: 'ovaries', 
                label: _systemIdToLabel('ovaries'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/female/ovaries.webp',
              ),
              Category(
                id: 'placenta', 
                label: _systemIdToLabel('placenta'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/female/placenta_cat.webp',
              ),
              Category(
                id: 'uterine_tubes', 
                label: _systemIdToLabel('uterine_tubes'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/female/uterine_tubes.webp',
              ),
              Category(
                id: 'uterus', 
                label: _systemIdToLabel('uterus'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/female/uterus.webp',
              ),
              Category(
                id: 'vagina', 
                label: _systemIdToLabel('vagina'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/female/vagina.webp',
              ),
            ],
          ),
          Category(
            id: 'male',
            label: _systemIdToLabel('male'),
            icon: _getSystemIcon('male'),
            imagePath: 'assets/images/systems/reproductive_system/male.webp',
            subcategories: [
              Category(
                id: 'accessory_glands', 
                label: _systemIdToLabel('accessory_glands'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/male/accessory_glands.webp',
              ),
              Category(
                id: 'epididymis', 
                label: _systemIdToLabel('epididymis'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/male/epididymis.webp',
              ),
              Category(
                id: 'mammary_glands', 
                label: _systemIdToLabel('mammary_glands'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/male/mammary_glands.webp',
              ),
              Category(
                id: 'penis', 
                label: _systemIdToLabel('penis'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/male/penis.webp',
              ),
              Category(
                id: 'prepuce', 
                label: _systemIdToLabel('prepuce'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/male/prepuce.webp',
              ),
              Category(
                id: 'sperm_duct', 
                label: _systemIdToLabel('sperm_duct'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/male/sperm_duct.webp',
              ),
              Category(
                id: 'testes', 
                label: _systemIdToLabel('testes'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/male/testes.webp',
              ),
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
          Category(
            id: 'kidneys', 
            label: _systemIdToLabel('kidneys'), 
            icon: Icons.water_drop,
            imagePath: 'assets/images/systems/urinary_system/kidneys.webp',
          ),
          Category(
            id: 'ureters', 
            label: _systemIdToLabel('ureters'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/urinary_system/ureters.webp',
          ),
          Category(
            id: 'urethra', 
            label: _systemIdToLabel('urethra'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/urinary_system/urethra.webp',
          ),
          Category(
            id: 'urinary_bladder', 
            label: _systemIdToLabel('urinary_bladder'), 
            icon: Icons.opacity,
            imagePath: 'assets/images/systems/urinary_system/urinary_bladder.webp',
          ),
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
          Category(
            id: 'arteries', 
            label: _systemIdToLabel('arteries'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/cardiovascular_system/arteries.webp',
          ),
          Category(
            id: 'blood', 
            label: _systemIdToLabel('blood'), 
            icon: Icons.bloodtype,
            imagePath: 'assets/images/systems/cardiovascular_system/blood.webp',
          ),
          Category(
            id: 'capillaries', 
            label: _systemIdToLabel('capillaries'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/cardiovascular_system/capillaries.webp',
          ),
          Category(
            id: 'heart', 
            label: _systemIdToLabel('heart'), 
            icon: Icons.favorite,
            imagePath: 'assets/images/systems/cardiovascular_system/heart.webp',
          ),
          Category(
            id: 'pericardium', 
            label: _systemIdToLabel('pericardium'), 
            icon: Icons.favorite,
            imagePath: 'assets/images/systems/cardiovascular_system/pericardium.webp',
          ),
          Category(
            id: 'veins', 
            label: _systemIdToLabel('veins'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/cardiovascular_system/veins.webp',
          ),
        ],
      ),
      // Cranial Nerves (note: folder has typo "cranial_neves")
      Category(
        id: 'cranial_neves',
        label: 'Cranial Nerves',
        icon: _getSystemIcon('cranial_nerves'),
        imagePath: 'assets/images/systems/cranial_nerves_main.webp',
        subcategories: [
          Category(
            id: 'abducent_nerve_vi', 
            label: _systemIdToLabel('abducent_nerve_vi'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'accessory_nerve_xi', 
            label: _systemIdToLabel('accessory_nerve_xi'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'facial_nerve_vii', 
            label: _systemIdToLabel('facial_nerve_vii'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'glossopharyngeal_nerve_ix', 
            label: _systemIdToLabel('glossopharyngeal_nerve_ix'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'hypoglossal_nerve_xii', 
            label: _systemIdToLabel('hypoglossal_nerve_xii'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'oculomotor_nerve_iii', 
            label: _systemIdToLabel('oculomotor_nerve_iii'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'olfactory_nerve_i', 
            label: _systemIdToLabel('olfactory_nerve_i'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'optic_nerve_ii', 
            label: _systemIdToLabel('optic_nerve_ii'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'trigeminal_nerve_v', 
            label: _systemIdToLabel('trigeminal_nerve_v'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'trochlear_nerve_iv', 
            label: _systemIdToLabel('trochlear_nerve_iv'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'vagus_nerve_x', 
            label: _systemIdToLabel('vagus_nerve_x'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
          Category(
            id: 'vestibulocochlear_nerve_viii', 
            label: _systemIdToLabel('vestibulocochlear_nerve_viii'), 
            icon: Icons.psychology,
            imagePath: 'assets/images/systems/cranial_nerves.webp',
          ),
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
            imagePath: 'assets/images/systems/digestive_system/lower_tract.webp',
            subcategories: [
              Category(
                id: 'ceca', 
                label: _systemIdToLabel('ceca'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/ceca.webp',
              ),
              Category(
                id: 'cloaca', 
                label: _systemIdToLabel('cloaca'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/cloaca.webp',
              ),
              Category(
                id: 'crop', 
                label: _systemIdToLabel('crop'), 
                icon: Icons.restaurant,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/crop.webp',
              ),
              Category(
                id: 'duodenum', 
                label: _systemIdToLabel('duodenum'), 
                icon: Icons.linear_scale,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/duodenum.webp',
              ),
              Category(
                id: 'esophagus', 
                label: _systemIdToLabel('esophagus'), 
                icon: Icons.linear_scale,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/esophagus.webp',
              ),
              Category(
                id: 'gizzard', 
                label: _systemIdToLabel('gizzard'), 
                icon: Icons.restaurant,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/gizzard.webp',
              ),
              Category(
                id: 'jejunum_ileum', 
                label: _systemIdToLabel('jejunum_ileum'), 
                icon: Icons.linear_scale,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/jejunum_ileum.webp',
              ),
              Category(
                id: 'large_intestine', 
                label: _systemIdToLabel('large_intestine'), 
                icon: Icons.linear_scale,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/large_intestine_bird.webp',
              ),
              Category(
                id: 'proventriculus', 
                label: _systemIdToLabel('proventriculus'), 
                icon: Icons.restaurant,
                imagePath: 'assets/images/systems/digestive_system/lower_tract/proventriculus.webp',
              ),
            ],
          ),
          Category(
            id: 'upper_tract',
            label: _systemIdToLabel('upper_tract'),
            icon: _getSystemIcon('upper_tract'),
            imagePath: 'assets/images/systems/digestive_system/upper_tract.webp',
            subcategories: [
              Category(
                id: 'beak', 
                label: _systemIdToLabel('beak'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/digestive_system/upper_tract/beak.webp',
              ),
              Category(
                id: 'choana', 
                label: _systemIdToLabel('choana'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/digestive_system/upper_tract/choana.webp',
              ),
              Category(
                id: 'oral_cavity', 
                label: _systemIdToLabel('oral_cavity'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/digestive_system/upper_tract/tongue_bird.webp',
              ),
              Category(
                id: 'pharynx', 
                label: _systemIdToLabel('pharynx'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/digestive_system/upper_tract/pharynx_bird.webp',
              ),
              Category(
                id: 'salivary_glands', 
                label: _systemIdToLabel('salivary_glands'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/digestive_system/upper_tract/salivary_glands.webp',
              ),
              Category(
                id: 'tongue', 
                label: _systemIdToLabel('tongue'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/digestive_system/upper_tract/tongue_bird.webp',
              ),
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
          Category(
            id: 'adrenal_glands', 
            label: _systemIdToLabel('adrenal_glands'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/adrenal_glands.webp',
          ),
          Category(
            id: 'bursa_of_fabricius', 
            label: _systemIdToLabel('bursa_of_fabricius'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/bursa_of_fabricius.webp',
          ),
          Category(
            id: 'gonads', 
            label: _systemIdToLabel('gonads'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/gonads.webp',
          ),
          Category(
            id: 'hypothalamus', 
            label: _systemIdToLabel('hypothalamus'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/hypothalamus.webp',
          ),
          Category(
            id: 'pancreas_endocrine', 
            label: _systemIdToLabel('pancreas_endocrine'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/pancreas_endocrine.webp',
          ),
          Category(
            id: 'parathyroid_glands', 
            label: _systemIdToLabel('parathyroid_glands'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/parathyroid_glands.webp',
          ),
          Category(
            id: 'pineal_gland', 
            label: _systemIdToLabel('pineal_gland'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/pineal_gland.webp',
          ),
          Category(
            id: 'pituitary_gland', 
            label: _systemIdToLabel('pituitary_gland'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/pituitary.webp',
          ),
          Category(
            id: 'thyroid_glands', 
            label: _systemIdToLabel('thyroid_glands'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/thyroid_gland.webp',
          ),
          Category(
            id: 'ultimobranchial_glands', 
            label: _systemIdToLabel('ultimobranchial_glands'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/endocrine_system/ultimobranchial_glands.webp',
          ),
        ],
      ),
      // Integumentary System
      Category(
        id: 'integumentary_system',
        label: _systemIdToLabel('integumentary_system'),
        icon: _getSystemIcon('integumentary_system'),
        imagePath: 'assets/images/systems/integumentary_system_bird.webp',
        subcategories: [
          Category(
            id: 'claws_talons', 
            label: _systemIdToLabel('claws_talons'), 
            icon: Icons.layers,
            imagePath: 'assets/images/systems/integumentary_system_bird.webp',
          ),
          Category(
            id: 'dermis', 
            label: _systemIdToLabel('dermis'), 
            icon: Icons.layers,
            imagePath: 'assets/images/systems/integumentary_system_bird.webp',
          ),
          Category(
            id: 'down_feathers', 
            label: _systemIdToLabel('down_feathers'), 
            icon: Icons.brush,
            imagePath: 'assets/images/systems/integumentary_system_bird.webp',
          ),
          Category(
            id: 'epidermis', 
            label: _systemIdToLabel('epidermis'), 
            icon: Icons.layers,
            imagePath: 'assets/images/systems/integumentary_system_bird.webp',
          ),
          Category(
            id: 'feather_follicles', 
            label: _systemIdToLabel('feather_follicles'), 
            icon: Icons.brush,
            imagePath: 'assets/images/systems/integumentary_system_bird.webp',
          ),
          Category(
            id: 'feathers', 
            label: _systemIdToLabel('feathers'), 
            icon: Icons.brush,
            imagePath: 'assets/images/systems/integumentary_system_bird.webp',
          ),
          Category(
            id: 'filoplumes', 
            label: _systemIdToLabel('filoplumes'), 
            icon: Icons.brush,
            imagePath: 'assets/images/systems/integumentary_system_bird.webp',
          ),
          Category(
            id: 'glands', 
            label: _systemIdToLabel('glands'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/integumentary_system_bird.webp',
          ),
          Category(
            id: 'hypodermis', 
            label: _systemIdToLabel('hypodermis'), 
            icon: Icons.layers,
            imagePath: 'assets/images/systems/integumentary_system_bird.webp',
          ),
          Category(
            id: 'pigmentation_coloration', 
            label: _systemIdToLabel('pigmentation_coloration'), 
            icon: Icons.palette,
            imagePath: 'assets/images/systems/integumentary_system_bird.webp',
          ),
          Category(
            id: 'rictal_bristles', 
            label: _systemIdToLabel('rictal_bristles'), 
            icon: Icons.brush,
            imagePath: 'assets/images/systems/integumentary_system_bird.webp',
          ),
          Category(
            id: 'scales_beak', 
            label: _systemIdToLabel('scales_beak'), 
            icon: Icons.layers,
            imagePath: 'assets/images/systems/integumentary_system_bird.webp',
          ),
          Category(
            id: 'sensory_feathers', 
            label: _systemIdToLabel('sensory_feathers'), 
            icon: Icons.sensors,
            imagePath: 'assets/images/systems/integumentary_system_bird.webp',
          ),
          Category(
            id: 'skin_sensory_receptors', 
            label: _systemIdToLabel('skin_sensory_receptors'), 
            icon: Icons.sensors,
            imagePath: 'assets/images/systems/integumentary_system_bird.webp',
          ),
          Category(
            id: 'uropygial_gland', 
            label: _systemIdToLabel('uropygial_gland'), 
            icon: Icons.scatter_plot,
            imagePath: 'assets/images/systems/integumentary_system_bird.webp',
          ),
        ],
      ),
      Category(
        id: 'hepatobiliary_system',
        label: _systemIdToLabel('hepatobiliary_system'),
        icon: _getSystemIcon('hepatobiliary_system'),
        imagePath: 'assets/images/systems/hepatobiliary_system.webp',
        subcategories: [
          Category(
            id: 'bile_canaliculi', 
            label: _systemIdToLabel('bile_canaliculi'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/bile_canaliculi.webp',
          ),
          Category(
            id: 'bile_ducts', 
            label: _systemIdToLabel('bile_ducts'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/bile_ducts.webp',
          ),
          Category(
            id: 'cystic_duct', 
            label: _systemIdToLabel('cystic_duct'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/cystic_duct.webp',
          ),
          Category(
            id: 'gallbladder', 
            label: _systemIdToLabel('gallbladder'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/gallbladder.webp',
          ),
          Category(
            id: 'hepatic_artery', 
            label: _systemIdToLabel('hepatic_artery'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/hepatic_artery.webp',
          ),
          Category(
            id: 'hepatic_enteric_duct', 
            label: _systemIdToLabel('hepatic_enteric_duct'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/hepatic_enteric_duct.webp',
          ),
          Category(
            id: 'hepatic_lobules', 
            label: _systemIdToLabel('hepatic_lobules'), 
            icon: Icons.circle,
            imagePath: 'assets/images/systems/hepatobiliary_system/hepatic_lobules.webp',
          ),
          Category(
            id: 'hepatic_vein', 
            label: _systemIdToLabel('hepatic_vein'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/hepatic_vein.webp',
          ),
          Category(
            id: 'hepatocytes', 
            label: _systemIdToLabel('hepatocytes'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/hepatocytes.webp',
          ),
          Category(
            id: 'kupffer_cells', 
            label: _systemIdToLabel('kupffer_cells'), 
            icon: Icons.circle,
            imagePath: 'assets/images/systems/hepatobiliary_system/kupffer_cells.webp',
          ),
          Category(
            id: 'liver', 
            label: _systemIdToLabel('liver'), 
            icon: Icons.local_hospital,
            imagePath: 'assets/images/systems/hepatobiliary_system/liver.webp',
          ),
          Category(
            id: 'portal_vein', 
            label: _systemIdToLabel('portal_vein'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/hepatobiliary_system/portal_vein.webp',
          ),
        ],
      ),
      // Immune System
      Category(
        id: 'immune_system',
        label: _systemIdToLabel('immune_system'),
        icon: _getSystemIcon('immune_system'),
        imagePath: 'assets/images/systems/immune_system.webp',
        subcategories: [
          Category(
            id: 'bone_marrow', 
            label: _systemIdToLabel('bone_marrow'), 
            icon: Icons.shield,
            imagePath: 'assets/images/systems/immune_system/bone_marrow.webp',
          ),
          Category(
            id: 'bone_marrow_deep', 
            label: _systemIdToLabel('bone_marrow_deep'), 
            icon: Icons.shield,
            imagePath: 'assets/images/systems/immune_system/bone_marrow.webp',
          ),
          Category(
            id: 'bursa_fabricius', 
            label: _systemIdToLabel('bursa_fabricius'), 
            icon: Icons.shield,
            imagePath: 'assets/images/systems/immune_system/bursa_fabricius.webp',
          ),
          Category(
            id: 'harderian_gland', 
            label: _systemIdToLabel('harderian_gland'), 
            icon: Icons.shield,
            imagePath: 'assets/images/systems/immune_system/harderian_gland.webp',
          ),
          Category(
            id: 'harderian_gland_deep', 
            label: _systemIdToLabel('harderian_gland_deep'), 
            icon: Icons.shield,
            imagePath: 'assets/images/systems/immune_system/harderian_gland.webp',
          ),
          Category(
            id: 'liver_immune', 
            label: _systemIdToLabel('liver_immune'), 
            icon: Icons.shield,
            imagePath: 'assets/images/systems/immune_system/liver.webp',
          ),
          Category(
            id: 'spleen', 
            label: _systemIdToLabel('spleen'), 
            icon: Icons.shield,
            imagePath: 'assets/images/systems/immune_system/spleen.webp',
          ),
          Category(
            id: 'spleen_deep', 
            label: _systemIdToLabel('spleen_deep'), 
            icon: Icons.shield,
            imagePath: 'assets/images/systems/immune_system/spleen.webp',
          ),
          Category(
            id: 'thymus', 
            label: _systemIdToLabel('thymus'), 
            icon: Icons.shield,
            imagePath: 'assets/images/systems/immune_system/thymus.webp',
          ),
          Category(
            id: 'tissues',
            label: _systemIdToLabel('tissues'),
            icon: Icons.layers,
            imagePath: 'assets/images/systems/immune_system/tissues_bird.webp',
            subcategories: [
              Category(
                id: 'balt', 
                label: _systemIdToLabel('balt'), 
                icon: Icons.shield,
                imagePath: 'assets/images/systems/immune_system/tissues/balt_bird.webp',
              ),
              Category(
                id: 'cecal_tonsils', 
                label: _systemIdToLabel('cecal_tonsils'), 
                icon: Icons.shield,
                imagePath: 'assets/images/systems/immune_system/tissues/cecal_tonsils_bird.webp',
              ),
              Category(
                id: 'galt', 
                label: _systemIdToLabel('galt'), 
                icon: Icons.shield,
                imagePath: 'assets/images/systems/immune_system/tissues/galt_bird.webp',
              ),
              Category(
                id: 'lymphoid_tissue', 
                label: _systemIdToLabel('lymphoid_tissue'), 
                icon: Icons.shield,
                imagePath: 'assets/images/systems/immune_system/tissues/lymphoid_tissue_bird.webp',
              ),
              Category(
                id: 'peyers_patches', 
                label: _systemIdToLabel('peyers_patches'), 
                icon: Icons.shield,
                imagePath: 'assets/images/systems/immune_system/tissues/peyers_patches_bird.webp',
              ),
            ],
          ),
        ],
      ),
      // Lumbosacral Plexus
      Category(
        id: 'lumbosacral_plexus',
        label: _systemIdToLabel('lumbosacral_plexus'),
        icon: _getSystemIcon('lumbosacral_plexus'),
        imagePath: 'assets/images/systems/lumbosacral_plexus.webp',
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
          Category(
            id: 'bursa_of_fabricius', 
            label: _systemIdToLabel('bursa_of_fabricius'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/bursa_of_fabricius.webp',
          ),
          Category(
            id: 'lymph_fluid', 
            label: _systemIdToLabel('lymph_fluid'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/lymph_fluid.webp',
          ),
          Category(
            id: 'lymph_hearts', 
            label: _systemIdToLabel('lymph_hearts'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/lymph_hearts.webp',
          ),
          Category(
            id: 'lymph_vessels', 
            label: _systemIdToLabel('lymph_vessels'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/lymph_vessels.webp',
          ),
          Category(
            id: 'lymphoid_tissue', 
            label: _systemIdToLabel('lymphoid_tissue'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/lymphoid_tissue.webp',
          ),
          Category(
            id: 'spleen', 
            label: _systemIdToLabel('spleen'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/spleen.webp',
          ),
          Category(
            id: 'thymus', 
            label: _systemIdToLabel('thymus'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/thymus.webp',
          ),
          Category(
            id: 'harderian_gland', 
            label: _systemIdToLabel('harderian_gland'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/harderian_gland.webp',
          ),
          Category(
            id: 'peyers_patches', 
            label: _systemIdToLabel('peyers_patches'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/peyers_patches.webp',
          ),
          Category(
            id: 'tonsils', 
            label: _systemIdToLabel('tonsils'), 
            icon: Icons.water,
            imagePath: 'assets/images/systems/lymphatic_system/tonsils.webp',
          ),
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
            imagePath: 'assets/images/systems/nervous_system/nervous_system_bird.webp',
            subcategories: [
              Category(
                id: 'autonomic_system', 
                label: _systemIdToLabel('autonomic_system'), 
                icon: Icons.settings,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_bird.webp',
              ),
              Category(
                id: 'enteric_plexuses', 
                label: _systemIdToLabel('enteric_plexuses'), 
                icon: Icons.settings,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_bird.webp',
              ),
              Category(
                id: 'sympathetic_chain', 
                label: _systemIdToLabel('sympathetic_chain'), 
                icon: Icons.settings,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_bird.webp',
              ),
              Category(
                id: 'vagus_nerve', 
                label: _systemIdToLabel('vagus_nerve'), 
                icon: Icons.settings,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_bird.webp',
              ),
            ],
          ),
          Category(
            id: 'cns',
            label: _systemIdToLabel('cns').toUpperCase(),
            icon: _getSystemIcon('cns'),
            imagePath: 'assets/images/systems/nervous_system/nervous_system_bird.webp',
            subcategories: [
              Category(
                id: 'brain', 
                label: _systemIdToLabel('brain'), 
                icon: Icons.psychology,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_bird.webp',
              ),
              Category(
                id: 'brain_meninges', 
                label: _systemIdToLabel('brain_meninges'), 
                icon: Icons.psychology,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_bird.webp',
              ),
              Category(
                id: 'spinal_cord', 
                label: _systemIdToLabel('spinal_cord'), 
                icon: Icons.psychology,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_bird.webp',
              ),
            ],
          ),
          Category(
            id: 'pns',
            label: _systemIdToLabel('pns').toUpperCase(),
            icon: _getSystemIcon('pns'),
            imagePath: 'assets/images/systems/nervous_system/nervous_system_bird.webp',
            subcategories: [
              Category(
                id: 'cranial_nerves',
                label: _systemIdToLabel('cranial_nerves'),
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_bird.webp',
              ),
              Category(
                id: 'peripheral_ganglia', 
                label: _systemIdToLabel('peripheral_ganglia'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_bird.webp',
              ),
              Category(
                id: 'sensory_receptors', 
                label: _systemIdToLabel('sensory_receptors'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_bird.webp',
              ),
              Category(
                id: 'spinal_nerves', 
                label: _systemIdToLabel('spinal_nerves'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/nervous_system/nervous_system_bird.webp',
              ),
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
            imagePath: 'assets/images/organs/reproductive_organs/female.webp',
            subcategories: [
              Category(
                id: 'cloacal_region', 
                label: _systemIdToLabel('cloacal_region'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/female/cloacal_region.webp',
              ),
              Category(
                id: 'infundibulum', 
                label: _systemIdToLabel('infundibulum'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/female/infundibulum.webp',
              ),
              Category(
                id: 'isthmus', 
                label: _systemIdToLabel('isthmus'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/female/isthmus.webp',
              ),
              Category(
                id: 'magnum', 
                label: _systemIdToLabel('magnum'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/female/magnum.webp',
              ),
              Category(
                id: 'ovary', 
                label: _systemIdToLabel('ovary'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/female/ovary.webp',
              ),
              Category(
                id: 'oviduct', 
                label: _systemIdToLabel('oviduct'), 
                icon: Icons.linear_scale,
                imagePath: 'assets/images/systems/reproductive_system/female/oviduct.webp',
              ),
              Category(
                id: 'shell_gland_uterus', 
                label: _systemIdToLabel('shell_gland_uterus'), 
                icon: Icons.favorite,
                imagePath: 'assets/images/systems/reproductive_system/female/shell_gland_uterus.webp',
              ),
              Category(
                id: 'sperm_storage_tubules', 
                label: _systemIdToLabel('sperm_storage_tubules'), 
                icon: Icons.linear_scale,
                imagePath: 'assets/images/systems/reproductive_system/female/sperm_storage_tubules.webp',
              ),
            ],
          ),
          Category(
            id: 'male',
            label: _systemIdToLabel('male'),
            icon: _getSystemIcon('male'),
            imagePath: 'assets/images/organs/reproductive_organs/male.webp',
            subcategories: [
              Category(
                id: 'cloaca', 
                label: _systemIdToLabel('cloaca'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/reproductive_system/male/cloaca.webp',
              ),
              Category(
                id: 'epididymis', 
                label: _systemIdToLabel('epididymis'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/male/epididymis.webp',
              ),
              Category(
                id: 'phallus', 
                label: _systemIdToLabel('phallus'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/reproductive_system/male/phallus.webp',
              ),
              Category(
                id: 'seminal_glomus', 
                label: _systemIdToLabel('seminal_glomus'), 
                icon: Icons.scatter_plot,
                imagePath: 'assets/images/systems/reproductive_system/male/seminal_glomus.webp',
              ),
              Category(
                id: 'sperm_duct', 
                label: _systemIdToLabel('sperm_duct'), 
                icon: Icons.linear_scale,
                imagePath: 'assets/images/systems/reproductive_system/male/sperm_duct.webp',
              ),
              Category(
                id: 'testes', 
                label: _systemIdToLabel('testes'), 
                icon: Icons.circle,
                imagePath: 'assets/images/systems/reproductive_system/male/testes.webp',
              ),
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
      // Urinary System
      Category(
        id: 'urinary_system',
        label: _systemIdToLabel('urinary_system'),
        icon: _getSystemIcon('urinary_system'),
        imagePath: 'assets/images/systems/urinary_system.webp',
        subcategories: [
          Category(
            id: 'cloacal_urodeum', 
            label: _systemIdToLabel('cloacal_urodeum'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/urinary_system/cloacal_urodeum.webp',
          ),
          Category(
            id: 'kidneys', 
            label: _systemIdToLabel('kidneys'), 
            icon: Icons.water_drop,
            imagePath: 'assets/images/systems/urinary_system/kidneys.webp',
          ),
          Category(
            id: 'renal_portal_system', 
            label: _systemIdToLabel('renal_portal_system'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/urinary_system/renal_portal_system.webp',
          ),
          Category(
            id: 'ureters', 
            label: _systemIdToLabel('ureters'), 
            icon: Icons.opacity,
            imagePath: 'assets/images/systems/urinary_system/ureters.webp',
          ),
        ],
      ),
      // Water Balance System
      Category(
        id: 'water_balance_system',
        label: _systemIdToLabel('water_balance_system'),
        icon: Icons.water_drop,
        imagePath: 'assets/images/systems/water_balance_system.webp',
        subcategories: [
          Category(
            id: 'water_air_sacs', 
            label: _systemIdToLabel('water_air_sacs'), 
            icon: Icons.water_drop,
            imagePath: 'assets/images/systems/water_balance_system.webp',
          ),
          Category(
            id: 'water_cloacal_urodeum', 
            label: _systemIdToLabel('water_cloacal_urodeum'), 
            icon: Icons.water_drop,
            imagePath: 'assets/images/systems/water_balance_system.webp',
          ),
          Category(
            id: 'water_kidneys', 
            label: _systemIdToLabel('water_kidneys'), 
            icon: Icons.water_drop,
            imagePath: 'assets/images/systems/water_balance_system.webp',
          ),
          Category(
            id: 'water_lower_intestine', 
            label: _systemIdToLabel('water_lower_intestine'), 
            icon: Icons.water_drop,
            imagePath: 'assets/images/systems/water_balance_system.webp',
          ),
          Category(
            id: 'water_lungs', 
            label: _systemIdToLabel('water_lungs'), 
            icon: Icons.water_drop,
            imagePath: 'assets/images/systems/water_balance_system.webp',
          ),
          Category(
            id: 'water_ureters', 
            label: _systemIdToLabel('water_ureters'), 
            icon: Icons.linear_scale,
            imagePath: 'assets/images/systems/water_balance_system.webp',
          ),
          Category(
            id: 'water_uric_acid_metabolism', 
            label: _systemIdToLabel('water_uric_acid_metabolism'), 
            icon: Icons.science,
            imagePath: 'assets/images/systems/water_balance_system.webp',
          ),
        ],
      ),
    ];
  }
}
