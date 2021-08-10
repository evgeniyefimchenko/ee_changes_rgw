ee_changes_rgw - модуль вносит изменения на сайт согласно ТЗ

Разработка модуля для платформы CS CART согласно предоставленного задания:

1) шоурум https://disk.yandex.ru/i/ps2Cdz09qY_vAA выводит бейдж определённый в настройках модуля товару, настройки находятся в карточке товара раздел модули

2) блок мотивации https://disk.yandex.ru/i/a8yaS5c82hdhZg добавляет произвольный текст или код в блок мотивации
Тебуются доп настройки в самом блоке мотивации, что б не появлялись пустые блоки
<script>
			var block_item_id = "{$block.block_id}_7";
			if ($("#ab__mb_id_" + block_item_id).text().length <= 5) {
				$("#sw_ab__mb_id_" + block_item_id).parent().hide();
			}console.log("#ab__mb_id_" + block_item_id, $("#ab__mb_id_" + block_item_id).text().length);
	</script>

3) слайдер на карточке https://disk.yandex.ru/i/ThLshXifpewoLQ переносит миниатюры картинок под основную фотографию