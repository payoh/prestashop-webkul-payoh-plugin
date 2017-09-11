{capture name=path}
	<a {if $logged}href="{$link->getModuleLink('marketplace', 'dashboard')|escape:'html':'UTF-8'}"{/if}>
		{l s='Marketplace' mod='lemonwamkt'}
	</a>
	<span class="navigation-pipe">{$navigationPipe}</span>
	<span class="navigation_page">{l s='Payoh payment' mod='payohmkt'}</span>
{/capture}
{if $logged}
	<div class="main_block">
{include file="$tpl_dir./errors.tpl"}
		{hook h="DisplayMpmenuhook"}
		<div class="dashboard_content">
			<div class="dashboard">
				<div class="page-title">
					<span>{l s='Payoh payment' mod='payohmkt'}</span>
				</div>
				<div class="wk_right_col">
				{if isset($success) && $success}
        			<p class="alert alert-success">{$success}</p>
				{/if}
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-5 col-lg-6" >
							<div class="panel panel-default">
								<div class="panel-heading">
									<h2>{l s='My Wallet' mod='payohmkt'}</h2>
								</div>
								<div class="panel-body">
									<p>{l s='You can find your wallet informations here. You will be interested by balance amount.' mod='payohmkt'}</p>
								</div>
		
								{if $has_wallet }
									<table class="table">
										<tbody>
											<tr><td>{l s='ID' mod='payohmkt'}</td><td>{$wallet->id_lw_wallet}</td></tr>
											<tr><td>{l s='Holder' mod='payohmkt'}</td><td>{$wallet->customer_firstname} {$wallet->customer_lastname}</td></tr>
											<tr><td>{l s='Email' mod='payohmkt'}</td><td>{$wallet->customer_email}</td></tr>											
											<tr><td>{l s='Balance' mod='payohmkt'}</td><td>{if $bal}<span class="badge alert-success">{displayWtPriceWithCurrency price=$bal currency=$currency}</span>{else}<span class="badge alert-danger">{displayWtPriceWithCurrency price=0 currency=$currency}</span>{/if}</td></tr>											
											{if $status}
												<tr><td>{l s='Status' mod='payohmkt'}</td><td><span class="label label{$badge_status}">{$status}</span></td></tr>
											{/if}
											<tr>
												<td colspan="2">
													<form class="form-inline" id="form_upload" action="{$link->getModuleLink('payohmkt', 'wallet',[])|escape:'html':'UTF-8'}" method="post" enctype="multipart/form-data">
														<label for="fileUpload">{l s='Upload document' mod='payohmkt'}</label>
														<div class="form-group">
															<label class="radio-inline">
															  <input type="radio" name="file_type" id="file_type_id" value="0"> {l s='ID' mod='payohmkt'}
															</label>
															<label class="radio-inline">
															  <input type="radio" name="file_type" id="file_type_dom" value="1"> {l s='Proof of address' mod='payohmkt'}
															</label>
															<label class="radio-inline">
															  <input type="radio" name="file_type" id="file_type_rib" value="2"> {l s='RIB' mod='payohmkt'}
															</label>
															<label class="radio-inline">
															  <input type="radio" name="file_type" id="file_type_kbis" value="7"> {l s='KBIS' mod='payohmkt'}
															</label>
															<label class="radio-inline">
															  <input type="radio" name="file_type" id="file_type_rib" value="11"> {l s='Other' mod='payohmkt'}
															</label>
														</div>
														<div class="form-group">
															
															<input type="hidden" name="MAX_FILE_SIZE" value="{if isset($max_upload_size) && $max_upload_size}{$max_upload_size|intval}{else}2000000{/if}" />
															<input type="file" name="fileUpload" id="fileUpload" class="form-control" />
														</div>
														<button type="submit" name="uploadDocSubmit" class="btn btn-small"><span><i class="icon-upload"></i></span></button>
													</form>
												<td>
											</tr>
										</tbody>
									</table>
								{else}
									<p class="alert alert-warning">{l s='No wallet are available.' mod='payohmkt'}&nbsp;<a href="{$link->getModuleLink('payohmkt', 'wallet',['createWalletSubmit'=>1])|escape:'html':'UTF-8'}">{l s='Create your wallet' mod='payohmkt'}</a></p>
								{/if}
							</div><!-- End panel wallet -->
						</div>
						<div class="col-xs-12 col-sm-12 col-md-7 col-lg-6" >
							<div class="panel panel-default">
								<div class="panel-heading">
									<h2>{l s='My Ibans' mod='payohmkt'}</h2>
								</div>
								<div class="panel-body">
									<p>{l s='You can find yours ibans informations here. Regsiter your iban is necessary for payment by bankwire' mod='payohmkt'}</p>
								</div>
									{if $ibans && count($ibans)}
										
										<table class="table table-striped">
											<thead>
												<tr>
													<th class="first_item">{l s='Iban' mod='payohmkt'}</th>
													<th class="item">{l s='Bic' mod='payohmkt'}</th>
													<th class="item" data-hide="phone" data-sort-ignore="true">{l s='Holder' mod='payohmkt'}</th>
													<th class="item">{l s='Status' mod='payohmkt'}</th>
												</tr>
											</thead>
											<tbody>
											{foreach from=$ibans item=iban name=myLoop}
												<tr class="{if $smarty.foreach.myLoop.first}first_item{elseif $smarty.foreach.myLoop.last}last_item{else}item{/if} {if $smarty.foreach.myLoop.index % 2}alternate_item{/if}">
													<td>{$iban.iban}</td>
													<td>{$iban.bic}</td>
													<td>{$iban.holder}</td>
													<td>{$iban.id_status}</td>
												</tr>
											{/foreach}
											</tbody>
										</table>
										<div class="panel-footer">
											<a role="button" href="{$link->getModuleLink('payohmkt', 'iban',['add'=>1])|escape:'html':'UTF-8'}" class="button btn btn-default button-medium">
												<span>{l s='Add a new IBAN' mod='payohmkt'}</span>
											</a>
										</div>
		
									{else}
										<p class="alert alert-warning">{l s='No ibans are available.' mod='payohmkt'}&nbsp;<a href="{$link->getModuleLink('payohmkt', 'iban',['add'=>1])|escape:'html':'UTF-8'}">{l s='Register your first iban' mod='payohmkt'}</a></p>
									{/if}
								
							</div><!-- End panel Iban -->
						</div>
					</div><!-- end row  -->
					{if $has_wallet && $ibans && count($ibans) > 0 }
					<div class="row">
						<div class="col-md-12">				
							<div class="panel panel-default">
								<div class="panel-heading">
									<h2>{l s='My money out' mod='payohmkt'}</h2>
								</div>
								<div class="panel-body">
									<p>{l s='You can find list of your last 10 money out below. Click on add money out to do a new money out' mod='payohmkt'}</p>
								</div>
									{if $moneyouts && count($moneyouts) && $bal && $bal > 0}
										
										<table class="table table-striped">
											<thead>
												<tr>
													<th class="first_item">{l s='Amount' mod='payohmkt'}</th>
													<th class="item" data-sort-ignore="true">{l s='New balance' mod='payohmkt'}</th>
													<th class="item" >{l s='Date' mod='payohmkt'}</th>
												</tr>
											</thead>
											<tbody>
											{foreach from=$moneyouts item=moneyout name=myLoop}
												<tr class="{if $smarty.foreach.myLoop.first}first_item{elseif $smarty.foreach.myLoop.last}last_item{else}item{/if} {if $smarty.foreach.myLoop.index % 2}alternate_item{/if}">
													<td>{displayWtPriceWithCurrency price=$moneyout.amount_to_pay currency=$currency}</td>
													<td>{displayWtPriceWithCurrency price=$moneyout.new_bal currency=$currency}</td>
													<td data-value="{$moneyout.date_add|regex_replace:"/[\-\:\ ]/":""}" class="bold">
														{dateFormat date=$moneyout.date_add full=0}
													</td>
												</tr>
											{/foreach}
											</tbody>
										</table>
										<div class="panel-footer">
											<a role="button" href="{$link->getModuleLink('payohmkt', 'moneyout',['add'=>1])|escape:'html':'UTF-8'}" class="button btn btn-default button-medium">
												<span>{l s='Do a new money out' mod='payohmkt'}</span>
											</a>
										</div>
									{elseif !$bal && $bal < 1}<!-- @TODO Ask for minimum amount -->
											<p class="alert alert-info">{l s='You do not have sufficient funds to make a bank transfer.' mod='payohmkt'}</a></p>
									{else}
										<p class="alert alert-info">{l s='You have not money out' mod='payohmkt'}&nbsp;<a class="alert-link" href="{$link->getModuleLink('payohmkt', 'moneyout',['add'=>1])|escape:'html':'UTF-8'}">{l s='Make the first one' mod='payohmkt'}</a></p>
									{/if}
								
							</div><!-- End panel Money out -->
	 					</div>
					</div>
				{/if}
				</div>
			</div>
		</div>
	</div>
{/if}
