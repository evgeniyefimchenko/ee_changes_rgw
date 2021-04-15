{if $show_product_amount && $product.is_edp != "Y" && $settings.General.inventory_tracking == "Y"}
    <div class="cm-reload-{$obj_prefix}{$obj_id} stock-wrap" id="product_amount_update_{$obj_prefix}{$obj_id}">
        <input type="hidden" name="appearance[show_product_amount]" value="{$show_product_amount}" />
        {if !$product.hide_stock_info}
            {if $settings.Appearance.in_stock_field == "Y"}
                {if $product.tracking != "ProductTracking::DO_NOT_TRACK"|enum}
                    {if ($product_amount > 0 && $product_amount >= $product.min_qty) && $settings.General.inventory_tracking == "Y" || $details_page}
                        {if (
                                $product_amount > 0
                                && $product_amount >= $product.min_qty
                                || $product.out_of_stock_actions == "OutOfStockActions::BUY_IN_ADVANCE"|enum
                                )
                            && $settings.General.inventory_tracking == "Y"
                        }
                            <div class="ty-control-group product-list-field">
                                {if $show_amount_label}
                                    <label class="ty-control-group__label">{__("availability")}:</label>
                                {/if}
                                <span id="qty_in_stock_{$obj_prefix}{$obj_id}" class="ty-qty-in-stock ty-control-group__item">
                                    {if $product_amount > 0}
                                        {$product_amount}&nbsp;{__("items")} <i class="material-icons">&#xE86C;</i>
                                    {else}
                                        <i class="material-icons">&#xE924;</i>{__("on_backorder")}
                                    {/if}
                                </span>
                            </div>
                        {elseif $settings.General.inventory_tracking == "Y" && $settings.General.allow_negative_amount != "Y"}
                            <div class="ty-control-group product-list-field">
                                {if $show_amount_label}
                                    <label class="ty-control-group__label">{__("in_stock")}:</label>
                                {/if}
                                <span class="ty-qty-out-of-stock ty-control-group__item">{$out_of_stock_text}<i class="material-icons">&#xE5C9;</i></span>
                            </div>
                        {/if}
                    {/if}
                {/if}
            {else}
                {if (
                        $product_amount > 0
                        && $product_amount >= $product.min_qty
                        || $product.tracking == "ProductTracking::DO_NOT_TRACK"|enum
                    )
                    && $settings.General.inventory_tracking == "Y"
                    && $settings.General.allow_negative_amount != "Y"
                    || $settings.General.inventory_tracking == "Y"
                    && (
                        $settings.General.allow_negative_amount == "Y"
                        || $product.out_of_stock_actions == "OutOfStockActions::BUY_IN_ADVANCE"|enum
                    )
                }
                    <div class="ty-control-group product-list-field">
                        {if $product_amount > 0}
                            <span class="ty-qty-in-stock ty-control-group__item" id="in_stock_info_{$obj_prefix}{$obj_id}">
                                {__("in_stock")}<i class="material-icons">&#xE86C;</i>
                            </span>
                        {else}
                            {if $product.out_of_stock_actions == "OutOfStockActions::BUY_IN_ADVANCE"|enum}
								<span title="{if in_array(9, $auth.usergroup_ids)}{$addons.ee_changes_rgw.ee_changes_rgw_badge_text_title}{else}{$addons.ee_changes_rgw.ee_changes_rgw_badge_other_text_title}{/if}" class="ty-qty-in-stock preorder ty-control-group__item cm-tooltip" id="in_stock_info_{$obj_prefix}{$obj_id}">
								{if in_array(9, $auth.usergroup_ids)}
									{$addons.ee_changes_rgw.ee_changes_rgw_badge_text}
								{else}
									{$addons.ee_changes_rgw.ee_changes_rgw_badge_other_text}
								{/if}                                
									{*__("on_backorder")*}<i class="material-icons">&#xE924;</i>
								</span>
							{else}
								<span class="ty-qty-out-of-stock ty-control-group__item">{$out_of_stock_text}<i class="material-icons">&#xE5C9;</i></span>
							{/if}
                        {/if}
                    </div>
                {elseif  $details_page
                    && (
                        $product_amount <= 0
                        || $product_amount < $product.min_qty
                )
                    && $settings.General.inventory_tracking == "Y"
                    && $settings.General.allow_negative_amount != "Y"
                }
                    <div class="ty-control-group product-list-field">
                        <span class="ty-qty-out-of-stock ty-control-group__item" id="out_of_stock_info_{$obj_prefix}{$obj_id}">{$out_of_stock_text}<i class="material-icons">&#xE5C9;</i></span>
                    </div>
                {/if}
            {/if}
        {/if}
    <!--product_amount_update_{$obj_prefix}{$obj_id}--></div>
{/if}

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