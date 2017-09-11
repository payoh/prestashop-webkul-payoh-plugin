{capture name=path}
	<a {if $logged}href="{$link->getModuleLink('marketplace', 'dashboard')|escape:'html':'UTF-8'}"{/if}>
		{l s='Marketplace' mod='payohmkt'}
	</a>
	<span class="navigation-pipe">{$navigationPipe}</span>
	<span class="navigation_page">{l s='Iban' mod='payohmkt'}</span>
{/capture}
{if $logged}
	<div class="main_block">
	{include file="$tpl_dir./errors.tpl"}
		{hook h="DisplayMpmenuhook"}
		<div class="dashboard_content">
			<div class="dashboard">
				<div class="page-title">
					<span>{l s='Iban' mod='payohmkt'}</span>
				</div>
				<div class="wk_right_col">
				{if isset($success) && $success}
        			<p class="alert alert-success">
            			{l s='Your Iban has been successfully saved.' mod='payohmkt'}
        			</p>
				{else}
					<form action="{$link->getModuleLink('payohmkt', 'iban',['add'=>1])|escape:'html':'UTF-8'}" method="post" class="std">
						<div class="form-group">
							<label for="holder" class="required"  >{l s='Holder' mod='payohmkt'}</label>
							<input type="text" data-validate="isName" class="form-control is_required validate" id="holder" name="iban_data[holder]" value="{$iban->holder}" placeholder="{l s='Holder account name' mod='payohmkt'}" >
						</div>
						<div class="form-group">
							<label for="iban" class="required">{l s='Iban' mod='payohmkt'}</label>
							<input type="text" data-validate="isGenericName" class="form-control is_required validate" id="iban" name="iban_data[iban]" value="{$iban->iban}" placeholder="{l s='Iban number' mod='payohmkt'}" >
						</div>
						<div class="form-group">
							<label for="bic" >{l s='BIC' mod='payohmkt'}</label>
							<input type="text" data-validate="isGenericName" class="form-control validate" id="bic" name="iban_data[bic]"  value="{$iban->bic}" placeholder="{l s='BIC number' mod='payohmkt'}" >
						</div>
						<div class="form-group">
							<label for="dom1">{l s='Agency' mod='payohmkt'}</label>
							<input type="text" data-validate="isGenericName" class="form-control validate" id="dom1" name="iban_data[dom1]"  value="{$iban->dom1}" placeholder="{l s='Agency name' mod='payohmkt'}" >
						</div>
						<div class="form-group">
							<label for="dom2">{l s='Agency street' mod='payohmkt'}</label>
							<input type="text" data-validate="isGenericName" class="form-control validate" id="dom2" name="iban_data[dom2]"  value="{$iban->dom2}" placeholder="{l s='Agency street' mod='payohmkt'}" >
						</div>
						<button type="submit" name="addIbanSubmit" class="button btn btn-default button-medium">
							<span>{l s='Save' mod='payohmkt'}</span>
						</button>

					</form>
				{/if}
				</div>
			</div>
		</div>
	</div>
{/if}
