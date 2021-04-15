{assign var="product" value=$product|fn_get_ee_options:$product}
{if $product.ee_target_param_badge == 1 && $_REQUEST.dispatch != 'products.view'}
	<div class="{$addons.ee_changes_rgw.ee_changes_rgw_badge_style} cm-tooltip"
	 style="background-color: {$addons.ee_changes_rgw.ee_changes_rgw_badge_back_color}!important; color: {$addons.ee_changes_rgw.ee_changes_rgw_badge_color}!important;"
	 title="{$addons.ee_changes_rgw.ee_changes_rgw_badge_title}">{$addons.ee_changes_rgw.ee_changes_rgw_text_badge}</div>
{/if}