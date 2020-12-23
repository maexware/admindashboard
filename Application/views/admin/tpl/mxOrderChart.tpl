<input type="hidden" id="mwHorizonOrders" value="[{$horizont}]" />
<input type="hidden" id="mwHorizonOrders_maxCount" value="[{$maxCount}]" />
<input type="hidden" id="mwHorizonOrders_optionMonth" value="[{$optionTitle}]" />
<input type="hidden" id="mwHorizonOrders_optionYear" value="[{$year}]" />
<input type="hidden" id="mwHorizonOrders_option" value="[{$option}]" />

[{foreach from=$result item=point name="datapoints"}]
    <input type="hidden" id="mwHorizonOrders_point-[{$point.horizontitem}]" value="[{$point.ordercount}]" />
[{/foreach}]
<script>
    updateOrderChartIncome([{$incomeBrut}],[{$incomeNet}]);
</script>
