{if $mpmenu==0}
	<li>
		<a title="{l s='Payoh payment' mod='payohmkt'}" href="{$link->getModuleLink('payohmkt', 'wallet')|escape:'html':'UTF-8'}" title="{l s='Payoh payment' mod='payohmkt'}">
			<i class="icon-money"></i>
			<span>{l s='Payoh payment' mod='payohmkt'}</span>
		</a>
	</li>
{else}
	<li {if $logic=='payohmkt_wallet'}class="menu_active"{/if}>
		<span>
			<a title="{l s='Payoh payment' mod='payohmkt'}" href="{$link->getModuleLink('payohmkt', 'wallet')|escape:'html':'UTF-8'}">
				{l s='Payoh payment' mod='payohmkt'}
			</a>
		</span>
	</li>
{/if}