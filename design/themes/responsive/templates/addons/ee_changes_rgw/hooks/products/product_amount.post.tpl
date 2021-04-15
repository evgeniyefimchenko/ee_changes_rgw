<style>
	.cm-thumbnails-mini.ty-product-thumbnails__item {
		padding: 0px;
	}
	.cm-thumbnails-mini.ty-product-thumbnails__item>img {
		height: 60px;
		width: 60px;
	}
</style>
{if $product.ee_target_param_badge == 1}
	<div id="ee_show_room" class="ty-qty-in-stock ty-control-group__item {$addons.ee_changes_rgw.ee_changes_rgw_badge_style} cm-tooltip"
	 style="top: 1px; background-color: {$addons.ee_changes_rgw.ee_changes_rgw_badge_back_color}!important; color: {$addons.ee_changes_rgw.ee_changes_rgw_badge_color}!important;"
	 title="{$addons.ee_changes_rgw.ee_changes_rgw_badge_title}">{$addons.ee_changes_rgw.ee_changes_rgw_text_badge}</div>
	<script>
		$('.ty-control-group.product-list-field').append($('#ee_show_room'));
	</script>	 
{/if}