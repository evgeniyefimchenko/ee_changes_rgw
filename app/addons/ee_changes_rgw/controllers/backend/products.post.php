<?php

use Tygh\Registry;

if (!defined('BOOTSTRAP')) { die('Access denied'); }

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if ($mode == 'update') {
		$_REQUEST['product_data']['product_id'] = $_REQUEST['product_id'];
		fn_set_ee_options($_REQUEST['product_data']);
    }
}

if ($mode == 'update') {
	Tygh::$app['view']->assign('product_data', fn_get_ee_options(Tygh::$app['view']->getTemplateVars('product_data')));
}