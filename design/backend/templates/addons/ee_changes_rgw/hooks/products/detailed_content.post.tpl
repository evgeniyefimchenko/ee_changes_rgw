<div class="control-group field-to-show">
	{if $addons.ee_changes_rgw.ee_changes_rgw_motivation_block_active == "Y"}
		<label class="control-label" for="ab__mb_description">Пользовательское содержимое(текст или HTML):</label>
		<div class="controls">
			<textarea id="ee_ab__mb_description" name="product_data[ee_ab_motivation_description]" cols="35" rows="8" class="input-large user-success" aria-invalid="false">{$product_data.ee_ab_motivation_description}</textarea>
		</div>
		{include file="common/subheader.tpl" title="Кому будет назначено содержимое" target="#ee_product_setting"}
		<div id="ee_product_setting" class="in collapse">
			<fieldset>
				<div class="control-group cm-no-hide-input">
					<label class="control-label" for="discussion_type">Параметр:</label>
					<div class="controls">	
						<select name="product_data[ee_target_param_product]">						
							<option {if $product_data.ee_target_param_product == 1}selected{/if} value="1">ID продукта</option>
							{if $product_data.variation_group_code}<option {if $product_data.ee_target_param_product == 2}selected{/if} value="2">Код группы вариации</option>{/if}
						</select>					
					</div>
				</div>
			</fieldset>
		</div>
	{/if}
	{include file="common/subheader.tpl" title="Бейдж товара" target="#ee_product_setting_badge"}
	<div id="ee_product_setting_badge" class="collapse in">
		<div class="control-group">			
			<div class="controls">
				<label class="checkbox inline" for="ee_product_setting_badge_input">Вывести бейдж определённый в настроеках модуля: </label>			
				<input type="checkbox" style="margin-left: 5px; margin-bottom: 2px;" id="ee_product_setting_badge_input" onclick="$(this).val() == 0 ? $(this).val(1) : $(this).val(0)" name="product_data[ee_target_param_badge]" {if $product_data.ee_target_param_badge == 1}checked{/if} value="{if $product_data.ee_target_param_badge_whom}{$product_data.ee_target_param_badge_whom}{else}0{/if}"/>
			</div>
			{if $product_data.variation_group_code}
				<div class="controls">
					<label class="checkbox inline" for="ee_product_setting_badge_input">Применить бейдж для группы вариаций товара: </label>			
					<input type="checkbox" style="margin-left: 5px; margin-bottom: 2px;" id="ee_product_setting_badge_input" onclick="$(this).val() == 0 ? $(this).val(1) : $(this).val(0)" name="product_data[ee_target_param_badge_whom]" {if $product_data.ee_target_param_badge_whom == 1}checked{/if} value="{if $product_data.ee_target_param_badge_whom}{$product_data.ee_target_param_badge_whom}{else}0{/if}"/>
				</div>
			{/if}
		</div>
	</div>	
</div>
