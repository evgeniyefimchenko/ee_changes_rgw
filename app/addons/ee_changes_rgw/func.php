<?php
if (!defined('BOOTSTRAP')) { die('Access denied'); }

use Tygh\Registry;

global $ee_changes_rgw;
$ee_changes_rgw = Registry::get('addons.ee_changes_rgw');

function fn_set_ee_options($product_data) {
	$variation_code = db_get_row('SELECT pvg.code as var_code, pvgp.group_id as id_group FROM ?:product_variation_groups as pvg, ?:product_variation_group_products as pvgp WHERE pvgp.product_id = ?i AND pvgp.group_id = pvg.id', $product_data['product_id']);
	$ee_variation_group_code = $variation_code['var_code'] ? $variation_code['var_code'] : '';		
	if ($ee_variation_group_code) {
		$all_variation = db_get_array('SELECT product_id, parent_product_id as ee_parent_group FROM ?:product_variation_group_products WHERE group_id = ?i', $variation_code['id_group']);
		foreach ($all_variation as $variant) {
			$ee_parent_group = $variant['ee_parent_group'] ? $variant['ee_parent_group'] : '';
			db_query('REPLACE INTO ?:ee_options SET ee_ab_motivation_description = ?s, ee_target_param_product = ?i, product_id = ?i, ee_variation_group_code = ?s, ee_parent_group = ?i, ee_target_param_badge = ?i, ee_target_param_badge_whom = ?i',
			$product_data['ee_ab_motivation_description'], $product_data['ee_target_param_product'], $variant['product_id'], $ee_variation_group_code, $ee_parent_group, $product_data['ee_target_param_badge'], $product_data['ee_target_param_badge_whom']);			
		}
	} else {
		db_query('REPLACE INTO ?:ee_options SET ee_ab_motivation_description = ?s, ee_target_param_product = ?i, product_id = ?i, ee_variation_group_code = ?s, ee_parent_group = ?i, ee_target_param_badge = ?i, ee_target_param_badge_whom = ?i',
		$product_data['ee_ab_motivation_description'], $product_data['ee_target_param_product'], $product_data['product_id'], $ee_variation_group_code, $ee_parent_group, $product_data['ee_target_param_badge'], $product_data['ee_target_param_badge_whom']);
	}
	fn_set_ab__mb_motivation_item_descriptions();
}

function fn_get_ee_options($product_data = []) {
	Registry::set('addons.ab__video_gallery.vertical', 'N');
	return array_merge($product_data, db_get_row('SELECT * FROM ?:ee_options WHERE product_id = ?i LIMIT 1', $product_data['product_id']));
}

function fn_ee_changes_rgw_get_information() {
	Registry::set('addons.ab__video_gallery.vertical', 'N');
	return ;
}

function fn_set_ab__mb_motivation_item_descriptions() {
	global $ee_changes_rgw;	
	if (isset($ee_changes_rgw['ee_changes_rgw_motivation_item_id']) && $ee_changes_rgw['ee_changes_rgw_motivation_item_id'] > 0 && $ee_changes_rgw['ee_changes_rgw_motivation_block_active'] == "Y") {
		if (db_get_field('SELECT 10 FROM ?:ab__mb_motivation_item_descriptions WHERE motivation_item_id = ?i', $ee_changes_rgw['ee_changes_rgw_motivation_item_id']) == 10) {
			$body_block = '';
			$end_block = '<script>
			var block_item_id = "{$block.block_id}' . '_' . $ee_changes_rgw['ee_changes_rgw_motivation_item_id'] . '";
			if ($("#ab__mb_id_" + block_item_id).text().length <= 5) {
				$("#sw_ab__mb_id_" + block_item_id).parent().hide();
			}console.log("#ab__mb_id_" + block_item_id, $("#ab__mb_id_" + block_item_id).text().length);</script>' . PHP_EOL;
			foreach (db_get_array('SELECT * FROM ?:ee_options') as $option) {
				if (mb_strlen($option['ee_ab_motivation_description']) > 3) {
					if ($option['ee_target_param_product'] == 1) {
						$body_block .= '{if $product.product_id == ' . $option['product_id'] . '}' . PHP_EOL;
						$body_block .= $option['ee_ab_motivation_description'] . PHP_EOL;
						$body_block .= '{/if}' . PHP_EOL;
					} elseif(!$option['ee_parent_group']) {
						$body_block .= '{if $product.variation_group_code == "' . $option['ee_variation_group_code'] . '"}' . PHP_EOL;
						$body_block .= $option['ee_ab_motivation_description'] . PHP_EOL;
						$body_block .= '{/if}' . PHP_EOL;
					}
				}
			}
			$res = $body_block . $end_block;
			$res = db_query('UPDATE ?:ab__mb_motivation_item_descriptions SET description = ?s WHERE motivation_item_id = ?i', $res, $ee_changes_rgw['ee_changes_rgw_motivation_item_id']);
		} else {
			fn_set_notification('E', __('error'), 'Блок мотивации с motivation_item_id = ' . $ee_changes_rgw['ee_changes_rgw_motivation_item_id'] . ' не найден!');
		}
	} else {
		if ($ee_changes_rgw['ee_changes_rgw_motivation_block_active'] == "Y") {
			fn_set_notification('E', __('error'), 'Установите motivation_item_id блока мотивации в настройках модуля!');
		}
	}
}

function fn_ee_changes_rgw_install() {
	Registry::set('addons.ab__video_gallery.vertical', 'N');
}

function fn_ee_changes_rgw_uninstall() {
	return true;
}