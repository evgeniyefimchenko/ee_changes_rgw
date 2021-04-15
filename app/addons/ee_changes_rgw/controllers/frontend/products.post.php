<?
if ($mode == 'view' || $mode == 'quick_view') {
	Tygh::$app['view']->assign('product', fn_get_ee_options(Tygh::$app['view']->getTemplateVars('product')));
}
