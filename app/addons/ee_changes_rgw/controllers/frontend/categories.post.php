<?

if ($mode == 'view') {
	$products = Tygh::$app['view']->getTemplateVars('products');
	foreach ($products as $key => $product) {
		$products[$key] = fn_get_ee_options($product);
	}	
	Tygh::$app['view']->assign('products', $products);
}
