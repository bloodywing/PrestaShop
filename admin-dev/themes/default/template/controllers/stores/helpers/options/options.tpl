{*
* 2007-2012 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2012 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{extends file="helpers/options/options.tpl"}

{block name="after"}
<script type="text/javascript">
    function ajaxStoreStates(id_state_selected)
{
    $.ajax({
	url: "ajax.php",
	cache: false,
	data: "ajaxStates=1&id_country="+$('#PS_SHOP_COUNTRY_ID').val() + "&id_state=" + $('#PS_SHOP_STATE_ID').val(),
	success: function(html)
	{
	    if (html == 'false')
	    {
		$("#conf_id_PS_SHOP_STATE_ID").fadeOut();
		$('#id_state option[value=0]').attr("selected", "selected");
	    }
	    else
	    {
		$("#PS_SHOP_STATE_ID").html(html);
		$("#conf_id_PS_SHOP_STATE_ID").fadeIn();
		$('#PS_SHOP_STATE_ID option[value=' + id_state_selected + ']').attr("selected", "selected");
	    }
	}
    });
}

$(document).ready(function(){
    {if isset($categoryData.fields.PS_SHOP_STATE_ID.value)}
    if ($('#PS_SHOP_COUNTRY_ID') && $('#PS_SHOP_STATE_ID'))
    {
	ajaxStoreStates({$categoryData.fields.PS_SHOP_STATE_ID.value});
	$('#PS_SHOP_COUNTRY_ID').change(function() {
	    ajaxStoreStates();
	});
    }
    {/if}
});
</script>
{/block}
