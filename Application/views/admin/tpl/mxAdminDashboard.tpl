<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title>[{ oxmultilang ident="MAIN_TITLE" }]</title>
    <link rel="stylesheet" href="[{$oViewConf->getResourceUrl()}]main.css">
    <link rel="stylesheet" href="[{$oViewConf->getResourceUrl()}]colors.css">
    <meta http-equiv="Content-Type" content="text/html; charset=[{$charset}]">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="../modules/mx/admindashboard/out/src/css/bootstrap.min.css">
    <!-- Optional theme -->
    <link rel="stylesheet" href="../modules/mx/admindashboard/out/src/css/bootstrap-theme.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="../modules/mx/admindashboard/out/src/js/jquery-3.1.1.min.js"></script>
    <script src="../modules/mx/admindashboard/out/src/js/bootstrap.min.js"></script>
    <script src="../modules/mx/admindashboard/out/src/js/jquery.flot.min.js"></script>
    <script src="../modules/mx/admindashboard/out/src/js/jquery.flot.pie.min.js"></script>
    <script src="../modules/mx/admindashboard/out/src/js/jquery.flot.categories.min.js"></script>
    <script src="../modules/mx/admindashboard/out/src/js/mxAdminDashboard.js?[{$smarty.now|date_format:"%H%M%S"}]"></script>

</head>
<body>

<script type="text/javascript">
    parent.sShopTitle = "[{$actshop|oxaddslashes}]";
    parent.setTitle();
</script>
<style>
    #mwToggleSidebar {
        width: 35px;
        height: 35px;
        background: #333;
        color: #fff;
        position: fixed;
        bottom: 10px;
        right: 10px;
        z-index: 100;
        text-align: center;
        line-height: 35px;
        cursor: pointer;
    }

    .panel-body {
        position: relative;
    }
    .panel-body .loader {
        position: absolute;
            top: 0;
            left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.6);
        z-index: 99;
    }

    .vcenter {
        display: inline-block;
        vertical-align: middle;
        float: none;
    }

</style>

<div id="mwToggleSidebar"">><</div>

[{* HEADER BEGINS *}]
<nav class="navbar navbar-inverse navbar-static-top">
    <div class="container-fluid">

        <div class="navbar-header">
            [{*
                NOT USED, perhabs in future

                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                *}]
            <a class="navbar-brand" href="#">[{oxmultilang ident="MXDASHBOARD"}]</a>
        </div>
        [{*
                NOT USED, perhabs in future
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">Dashboard</a></li>
                    <li><a href="#">Settings</a></li>
                    <li><a href="#">Profile</a></li>
                    <li><a href="#">Help</a></li>
                </ul>
                <form class="navbar-form navbar-right">
                    <input type="text" class="form-control" placeholder="Search...">
                </form>
            </div>
            *}]
    </div>
</nav>
[{* HEADER ENDS *}]

[{* CONTENT BEGINS *}]
<div class="container-fluid">

    [{if $aMessage }]
        <div class="messagebox">
            [{ oxmultilang ident="MAIN_INFO" }]:<br>
            [{foreach from=$aMessage item=sMessage key=class }]
            <p class="[{$class}]">[{ $sMessage }]</p>
            [{/foreach}]
        </div>
    <hr>
    [{/if}]

    <!-- First row -->
    [{if $orderCharts != 'DONTSHOW'}]
    <div class="row">
        <div class="col-sm-12 col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">[{oxmultilang ident="MXDASHBOARDORDERDATA"}]</h3>
                </div>
                <div class="panel-body">
                    <div class="loader">
                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="margin: auto; display: block;" width="200px" height="200px" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid">
                            <rect x="19" y="19" width="20" height="20" fill="#93dbe9">
                                <animate attributeName="fill" values="#689cc5;#93dbe9;#93dbe9" keyTimes="0;0.125;1" dur="1s" repeatCount="indefinite" begin="0s" calcMode="discrete"></animate>
                            </rect><rect x="40" y="19" width="20" height="20" fill="#93dbe9">
                                <animate attributeName="fill" values="#689cc5;#93dbe9;#93dbe9" keyTimes="0;0.125;1" dur="1s" repeatCount="indefinite" begin="0.125s" calcMode="discrete"></animate>
                            </rect><rect x="61" y="19" width="20" height="20" fill="#93dbe9">
                                <animate attributeName="fill" values="#689cc5;#93dbe9;#93dbe9" keyTimes="0;0.125;1" dur="1s" repeatCount="indefinite" begin="0.25s" calcMode="discrete"></animate>
                            </rect><rect x="19" y="40" width="20" height="20" fill="#93dbe9">
                                <animate attributeName="fill" values="#689cc5;#93dbe9;#93dbe9" keyTimes="0;0.125;1" dur="1s" repeatCount="indefinite" begin="0.875s" calcMode="discrete"></animate>
                            </rect><rect x="61" y="40" width="20" height="20" fill="#93dbe9">
                                <animate attributeName="fill" values="#689cc5;#93dbe9;#93dbe9" keyTimes="0;0.125;1" dur="1s" repeatCount="indefinite" begin="0.375s" calcMode="discrete"></animate>
                            </rect><rect x="19" y="61" width="20" height="20" fill="#93dbe9">
                                <animate attributeName="fill" values="#689cc5;#93dbe9;#93dbe9" keyTimes="0;0.125;1" dur="1s" repeatCount="indefinite" begin="0.75s" calcMode="discrete"></animate>
                            </rect><rect x="40" y="61" width="20" height="20" fill="#93dbe9">
                                <animate attributeName="fill" values="#689cc5;#93dbe9;#93dbe9" keyTimes="0;0.125;1" dur="1s" repeatCount="indefinite" begin="0.625s" calcMode="discrete"></animate>
                            </rect><rect x="61" y="61" width="20" height="20" fill="#93dbe9">
                                <animate attributeName="fill" values="#689cc5;#93dbe9;#93dbe9" keyTimes="0;0.125;1" dur="1s" repeatCount="indefinite" begin="0.5s" calcMode="discrete"></animate>
                            </rect>
                        </svg>
                    </div>
                    <form name="orderChart" id="orderChart" action="[{ $oViewConf->getSelfLink() }]" method="post">
                        [{ $oViewConf->getHiddenSid() }]
                        <input type="hidden" name="cl" value="mxAdminDashboard">
                        <input type="hidden" name="fnc" value="changeOrderChartView">
                        <input type="hidden" id="orderChartOption" name="option" value="m">

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="btn-group" id="orderoverviewType">
                                    <button type="submit" data-option="m" class="btn btn-default active">[{oxmultilang ident="MXDASHBOARDORDERDATA_MONTH"}]</button>
                                    <button type="submit" data-option="y" class="btn btn-default">[{oxmultilang ident="MXDASHBOARDORDERDATA_YEAR"}]</button>
                                    [{*<button type="submit" data-option="p" class="btn btn-default">[{oxmultilang ident="MXDASHBOARDORDERDATA_PERIOD"}]</button>*}]
                                </div>
                                <div class="btn-group" id="orderoverviewNavigation">
                                    <button data-option="prev" class="btn btn-default"><</button>
                                    <button data-option="next" class="btn btn-default">></button>
                                </div>
                                <h4 id="orderChartPeriod">[{$orderCharts.timestamp|date_format:"%B"}]</h4>
                            </div>
                            <div class="col-sm-6 text-right">
                                <h2 id="orderChartINCOME">[{oxmultilang ident="MXBESTBUYER_BRUT"}]: <span id="incomeBrut">[{$orderCharts.incomeBrut}]</span> € - [{oxmultilang ident="MXBESTBUYER_NET"}]: <span id="incomeNet">[{$orderCharts.incomeNet}]</span> €</h2>
                            </div>
                        </div>
                    </form>

                    <div id="orderoverview" style="height: 300px;"></div>
                    <div id="orderoverviweData">
                        <input type="hidden" id="MXHorizonOrders" value="[{$orderCharts.horizont}]" />
                        <input type="hidden" id="MXHorizonOrders_maxCount" value="[{$orderCharts.maxCount}]" />
                        <input type="hidden" id="MXHorizonOrders_optionTitle" value="[{$orderCharts.optionTitle}]" />
                        <input type="hidden" id="MXHorizonOrders_optionYear" value="[{$orderCharts.year}]" />
                        <input type="hidden" id="MXHorizonOrders_option" value="[{$orderCharts.option}]" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    [{/if}]

    <div class="row">
        [{if $aBestSellingDays != 'DONTSHOW'}]
            <div class="col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">[{oxmultilang ident="MXBESTSELLINGDAYS"}]</h3>
                    </div>
                    <div class="panel-body">
                            <table class="table">
                                <tr>
                                    [{foreach from=$aBestSellingDays item=day}]
                                        <td><h3><b>[{$day.day|truncate:3:""}]</b></b></h3></td>
                                    [{/foreach}]
                                </tr>
                                <tr>
                                    [{foreach from=$aBestSellingDays item=day}]
                                        <td><b>[{$day.orderscount}]</b></td>
                                    [{/foreach}]
                                </tr>
                            </table>
                    </div>
                </div>

            </div>
        [{/if}]

        [{if $aBestSellingMonth != 'DONTSHOW'}]
        <div class="col-lg-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">[{oxmultilang ident="MXBESTSELLINGMONTH"}]</h3>
                </div>
                <div class="panel-body table-responsive">
                    <table class="table">
                        <tr>
                            [{foreach from=$aBestSellingMonth item=day}]
                            <td><h4><b>[{$day.day|truncate:3:""}]</b></b></h4></td>
                            [{/foreach}]
                        </tr>
                        <tr>
                            [{foreach from=$aBestSellingMonth item=day}]
                            <td><b>[{$day.orderscount}]</b></td>
                            [{/foreach}]
                        </tr>
                    </table>
                </div>
            </div>

        </div>
        [{/if}]

        [{if $aBestSellingHour != 'DONTSHOW'}]
        <div class="col-lg-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">[{oxmultilang ident="MXBESTSELLINGHOUR"}]</h3>
                </div>
                <div class="panel-body">
                    <table class="table">
                        <tr>
                            [{foreach from=$aBestSellingHour item=day}]
                            <td><h3><b>[{$day.hour}] [{oxmultilang ident="MXBESTSELLINGHOUR_LABEL"}]</b></b></h3></td>
                            [{/foreach}]
                        </tr>
                        <tr>
                            [{foreach from=$aBestSellingHour item=day}]
                            <td><b>[{$day.countorders}]</b></td>
                            [{/foreach}]
                        </tr>
                    </table>
                </div>
            </div>

        </div>
        [{/if}]

        [{if $orderPayments != 'DONTSHOW'}]
        <div class="col-sm-12 col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">[{oxmultilang ident="MXUSEDPAYMENT"}]</h3>
                </div>
                <div class="panel-body">
                    <div id="orderChartPayment" style="height: 300px;"></div>
                    <div id="orderChartPaymentData">
                        [{foreach from=$orderPayments item=point name="datapoints"}]
                            <input type="hidden" class="paymentsCharItem" id="MXPayments_point-[{$point.paymentcount}]" value="[{$point.oxdesc}]" />
                        [{/foreach}]
                    </div>
                    <hr>
                    Gehe zu: <a class="btn btn-default btn-xs" href="[{$oViewConf->getSelfLink()}]&cl=admin_payment">Bezahlarten</a>
                </div>
            </div>
        </div>
        [{/if}]

        [{if $topCats != 'DONTSHOW'}]
        <div class="col-sm-12 col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">[{oxmultilang ident="MXTOPSELLERCATS"}]</h3>
                </div>
                <div class="panel-body">
                    <div id="orderChartCategory" style="height: 300px;"></div>
                    <div id="orderChartCategoryData">
                        [{foreach from=$topCats item=aCat}]
                            <input class="topSellerCategoy" type="hidden" data-option="[{$aCat.iSellCounter}]" value="[{$aCat.oxtitle}]" />
                        [{/foreach}]
                    </div>
                    <hr>
                    Gehe zu: <a class="btn btn-default btn-xs" href="[{$oViewConf->getSelfLink()}]&cl=category">Kategorien</a>
                </div>
            </div>
        </div>
        [{/if}]
    </div>

    <div class="row">
        [{if $aYearDevelop != 'DONTSHOW'}]
            <div class="col-sm-4" id="yearChart">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">[{oxmultilang ident="MXYEARDEVELOPMENT"}]</h3>
                    </div>
                    <div class="panel-body">

                        <div id="yearDevelopment" style="height: 300px;"></div>
                        <div id="yearDevelopmentData">
                            [{assign var="maxYearValue" value=0}]

                            [{foreach from=$aYearDevelop item=yearData}]
                                [{if $maxYearValue < $yearData.brutsum}]
                                    [{assign var="maxYearValue" value=$yearData.brutsum}]
                                [{/if}]
                                <input type="hidden" class="yearDevelopment" data-year="[{$yearData.yeardate}]" value="[{$yearData.brutsum}]" />
                            [{/foreach}]
                            <input type="hidden" id="yearMaxVal" value="[{$maxYearValue}]" />
                        </div>
                    </div>
                </div>
            </div>
        [{/if}]

        [{if $aYearDevelopOrder != 'DONTSHOW'}]
        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">[{oxmultilang ident="MXYEARDEVELOPMENTORDER"}]</h3>
                </div>
                <div class="panel-body">

                    <div id="yearOrderDevelopment" style="height: 300px;"></div>
                    <div id="yearOrderDevelopmentData">
                        [{assign var="maxYearOrderValue" value=0}]

                        [{foreach from=$aYearDevelopOrder item=yearData}]
                            [{if $maxYearOrderValue < $yearData.counter}]
                                [{assign var="maxYearOrderValue" value=$yearData.counter}]
                            [{/if}]
                            <input type="hidden" class="yearOrderDevelopment" data-year="[{$yearData.yeardate}]" value="[{$yearData.counter}]" />
                        [{/foreach}]
                        <input type="hidden" id="yearOrderMaxVal" value="[{$maxYearOrderValue}]" />
                    </div>
                </div>
            </div>
        </div>
        [{/if}]

        [{if $aGenderOrders != 'DONTSHOW'}]
            <div class="col-sm-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">[{oxmultilang ident="MXGENDERORDERS"}]</h3>
                    </div>
                    <div class="panel-body">
                        <div id="genderOrderChartQuality" style="height: 300px;"></div>
                        <div id="genderOrderChartQualityData">
                            <input type="hidden" class="qualityGenderOrder" id="aGenderMen" value="[{$aGenderOrders.MR}]" />
                            <input type="hidden" class="qualityGenderOrder" id="aGenderWomen" value="[{$aGenderOrders.MRS}]" />
                        </div>
                    </div>
                </div>
            </div>
        [{/if}]
    </div>


    <!-- THIRD row -->
    <div class="row">
        [{if $aQualityOrders != 'DONTSHOW'}]
        <div class="col-sm-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">[{oxmultilang ident="MXORDERSQUALITY"}]</h3>
                </div>
                <div class="panel-body">
                    <div id="orderChartQuality" style="height: 370px;"></div>
                    <div id="orderChartQualityData">
                        <input type="hidden" class="qualityOrder" id="aQualityOrdersStorno" value="[{$aQualityOrders.storno}]" />
                        <input type="hidden" class="qualityOrder" id="aQualityOrdersNostorno" value="[{$aQualityOrders.nostorno}]" />
                    </div>
                </div>
            </div>
        </div>
        [{/if}]

        [{if $aOrderFolderStates != 'DONTSHOW'}]
        <div class="col-sm-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">[{oxmultilang ident="MXORDERSTATES"}]</h3>
                </div>
                <div class="panel-body">
                    <div id="orderFolderStates" style="height: 370px;">
                    </div>
                    <hr>
                    Gehe zu: <a class="btn btn-warning btn-xs" href="[{$oViewConf->getSelfLink()}]&cl=admin_order&parameter[folder]=ORDERFOLDER_NEW">Neu</a>
                    <a class="btn btn-default btn-xs" href="[{$oViewConf->getSelfLink()}]&cl=admin_order&parameter[folder]=ORDERFOLDER_FINISHED">Bearbeitete</a>
                    <a class="btn btn-danger btn-xs" href="[{$oViewConf->getSelfLink()}]&cl=admin_order&parameter[folder]=ORDERFOLDER_PROBLEMS">Probleme</a>

                    <div id="orderFolderStatesData">
                        <input type="hidden" class="orderFolderState" id="orderFolderStateNew" value="[{$aOrderFolderStates.oxnew}]" />
                        <input type="hidden" class="orderFolderState" id="orderFolderStateProblem" value="[{$aOrderFolderStates.oxproblems}]" />
                        <input type="hidden" class="orderFolderState" id="orderFolderStateFinnished" value="[{$aOrderFolderStates.oxfinished}]" />
                    </div>
                </div>
            </div>
        </div>
        [{/if}]

        [{if $aOrderVals != 'DONTSHOW'}]
        <div class="col-sm-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">[{oxmultilang ident="MXORDERVALUES"}]</h3>
                </div>
                <div class="panel-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">[{oxmultilang ident="MXTYPE"}]</th>
                            <th scope="col">[{oxmultilang ident="MXORDERVALUE"}]</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>[{oxmultilang ident="MXBIGGEST"}] [{oxmultilang ident="MXORDERVALUE"}]</td>
                            <td>[{$aOrderVals.maxval}]</td>
                        </tr>
                        <tr>
                            <td>[{oxmultilang ident="MXAVG"}] [{oxmultilang ident="MXORDERVALUE"}]</td>
                            <td>[{$aOrderVals.avgval}]</td>
                        </tr>
                        <tr>
                            <td>[{oxmultilang ident="MXSMALLEST"}] [{oxmultilang ident="MXORDERVALUE"}]</td>
                            <td>[{$aOrderVals.minval}]</td>
                        </tr>
                        <tr>
                            <td>[{oxmultilang ident="MXORDERVALUE"}] [{oxmultilang ident="MXALL"}]</td>
                            <td>[{$ordertotalsum}]</td>
                        </tr>

                        <tr>
                            <td>[{oxmultilang ident="MXORDERVALUE"}] [{oxmultilang ident="MXTODAY"}]</td>
                            <td>[{$ordersum}]</td>
                        </tr>
                        </tbody>
                    </table>

                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">[{oxmultilang ident="MXTYPE"}]</th>
                            <th scope="col">[{oxmultilang ident="MXCOUNT"}]</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>[{oxmultilang ident="MXORDERSTODAY"}]</td>
                            <td>[{$ordercnt}]</td>
                        </tr>
                        <tr>
                            <td>[{oxmultilang ident="MXORDERSTHISMONTH"}]</td>
                            <td>[{$iOrderMonthCount}]</td>
                        </tr>
                        <tr>
                            <td>[{oxmultilang ident="MXORDERSCOMPLETE"}]</td>
                            <td>[{$ordertotalcnt}]</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        [{/if}]
    </div>


    <!-- Fourth row -->
    <div class="row">
        [{if $userAccounts != 'DONTSHOW'}]
        <div class="col-sm-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">[{oxmultilang ident="MXUSERACCOUNT"}]</h3>
                </div>
                <div class="panel-body">
                    <div id="userChart" style="height: 300px;"></div>
                    <div id="userAccountData">
                        <input type="hidden" id="userAccountVal" value="[{$userAccounts.Account}]" />
                        <input type="hidden" id="userNoAccountVal" value="[{$userAccounts.noAccount}]" />
                        <input type="hidden" id="userAminVal" value="[{$userAccounts.Admin}]" />
                    </div>
                    <hr>
                    Gehe zu: <a class="btn btn-default btn-xs" href="[{$oViewConf->getSelfLink()}]&cl=admin_user">Benutzern</a>
                </div>
            </div>
        </div>
        [{/if}]
        [{if $customerBought != 'DONTSHOW'}]
        <div class="col-sm-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Kunden/Gäste vs. Bestellungen</h3>
                </div>
                <div class="panel-body">
                    <div id="userBought" style="height: 300px;"></div>
                    <div id="userBoughtData">
                        <input type="hidden" id="userCounter" value="[{$customerBought.registeredUser}]" />
                        <input type="hidden" id="userBoughtCounter" value="[{$customerBought.registeredUserOrders}]" />
                        <input type="hidden" id="guestCounter" value="[{$customerBought.guestUser}]" />
                        <input type="hidden" id="guestBoughtCounter" value="[{$customerBought.guestUserOrders}]" />
                    </div>
                </div>
            </div>
        </div>
        [{/if}]

        [{if $userNewsletterAccounts != 'DONTSHOW'}]
        <div class="col-sm-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">[{oxmultilang ident="MXNEWSLETTER"}]</h3>
                </div>
                <div class="panel-body">
                    <div id="userNewsletterChart" style="height: 300px;"></div>
                    <div id="userNewsletterData">
                        <input type="hidden" id="userNewsletteroptinVal" value="[{$userNewsletterAccounts.optin}]" />
                        <input type="hidden" id="userNewsletteroptinconfirmesVal" value="[{$userNewsletterAccounts.optinconfirmed}]" />
                        <input type="hidden" id="userNewsletteraccountsVal" value="[{$userNewsletterAccounts.accounts}]" />
                    </div>
                </div>
            </div>
        </div>
        [{/if}]
    </div>

    <!-- row -->
    <div class="row">
        [{if $aArticleOnlyDatas != 'DONTSHOW'}]
        <div class="col-sm-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">[{oxmultilang ident="MXARTICLEINFOS"}]</h3>
                </div>
                <div class="panel-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">[{oxmultilang ident="MXTYPE"}]</th>
                            <th scope="col">[{oxmultilang ident="MXCOUNT"}]</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>[{oxmultilang ident="MXARTICLEALL"}]</td>
                            <td>[{$aArticleOnlyDatas.oxarticlesall}]</td>
                        </tr>
                        <tr>
                            <td>[{oxmultilang ident="MXARTICLEPARENTS"}]</td>
                            <td>[{$aArticleOnlyDatas.oxarticlesparents}]</td>
                        </tr>
                        <tr>
                            <td>[{oxmultilang ident="MXARTICLEVARIANTS"}]</td>
                            <td>[{$aArticleOnlyDatas.oxarticlesvariants}]</td>
                        </tr>
                        <tr>
                            <td>[{oxmultilang ident="MXARTICLEACTIVE"}]</td>
                            <td>[{$aArticleOnlyDatas.oxarticlesactive}]</td>
                        </tr>
                        </tbody>
                    </table>
                    <hr>
                    Gehe zu: <a class="btn btn-default btn-xs" href="[{$oViewConf->getSelfLink()}]&cl=article">Artikel</a>
                </div>
            </div>
        </div>
        [{/if}]
        [{if $articlesTopsellerOnlyActive != 'DONTSHOW'}]
        <div class="col-sm-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">[{oxmultilang ident="MXARTICLESTOPONLYACTIVE"}]</h3>
                </div>
                <div class="panel-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">[{oxmultilang ident="MXARTICLE"}]</th>
                            <th scope="col">[{oxmultilang ident="MXSELLCOUNT"}]</th>
                        </tr>
                        </thead>
                        <tbody>
                        [{foreach from=$articlesTopsellerOnlyActive item=article name=articleSelled}]
                            <tr>
                                <th scope="row">[{$smarty.foreach.articleSelled.iteration}]</th>
                                <td>[{$article.oxtitle}]</td>
                                <td>[{$article.oxamount}]</td>
                            </tr>
                            [{/foreach}]
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        [{/if}]
        [{if $articlesTopseller != 'DONTSHOW'}]
        <div class="col-sm-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">[{oxmultilang ident="MXARTICLESTOPALL"}]</h3>
                </div>
                <div class="panel-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">[{oxmultilang ident="MXARTICLE"}]</th>
                            <th scope="col">[{oxmultilang ident="MXSELLCOUNT"}]</th>
                        </tr>
                        </thead>
                        <tbody>
                        [{foreach from=$articlesTopseller item=article name=articleSelled}]
                            <tr>
                                <th scope="row">[{$smarty.foreach.articleSelled.iteration}]</th>
                                <td>[{$article.oxtitle}]</td>
                                <td>[{$article.oxamount}]</td>
                            </tr>
                            [{/foreach}]
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        [{/if}]
    </div>

    <div class="row">


        [{if $aBestBuyers != 'DONTSHOW'}]
        <div class="col-sm-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">[{oxmultilang ident="MXBESTBUYER"}]</h3>
                </div>
                <div class="panel-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">[{oxmultilang ident="MXBESTBUYER_COUNT"}]</th>
                            <th scope="col">[{oxmultilang ident="MXBESTBUYER_CUSTOMER"}]</th>
                            <th scope="col">[{oxmultilang ident="MXBESTBUYER_NET"}]</th>
                            <th scope="col">[{oxmultilang ident="MXBESTBUYER_BRUT"}]</th>
                        </tr>
                        </thead>
                        <tbody>
                        [{foreach from=$aBestBuyers item=buyerUser name=bestbuyerlist}]
                            <tr>
                                <th scope="row">[{$smarty.foreach.bestbuyerlist.iteration}]</th>
                                <td>[{$buyerUser.counter}]</td>
                                <td>
                                    [{$buyerUser.oxcustnr}] - [{$buyerUser.oxusername}]<br>
                                    [{$buyerUser.oxfname}] [{$buyerUser.oxlname}]
                                </td>
                                <td>[{$buyerUser.netsum}]</td>
                                <td>[{$buyerUser.brutsum}]</td>
                            </tr>
                        [{/foreach}]
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        [{/if}]
        [{if $aNonSellers != 'DONTSHOW'}]
        <div class="col-sm-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">[{oxmultilang ident="MXARTICLESLADENHÜTER"}]</h3>
                </div>
                <div class="panel-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">[{oxmultilang ident="MXARTICLE"}]</th>
                            <th scope="col">[{oxmultilang ident="MXSELLCOUNT"}]</th>
                            <th scope="col">[{oxmultilang ident="MXSELLSTOCK"}]</th>
                        </tr>
                        </thead>
                        <tbody>
                        [{foreach from=$aNonSellers item=article name=articleSelled}]
                            <tr>
                                <th scope="row">[{$smarty.foreach.articleSelled.iteration}]</th>
                                <td>[{$article.oxartnum}] - [{$article.oxtitle}]</td>
                                <td>[{$article.oxsoldamount}]</td>
                                <td>[{if $article.oxstockflag != 4}][{$article.oxstock}][{else}][{oxmultilang ident="MXSELLSTOCKFLAGOTHER"}][{/if}]</td>
                            </tr>
                            [{/foreach}]
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        [{/if}]
        [{if $aLowStockArticles != 'DONTSHOW'}]
        <div class="col-sm-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">[{oxmultilang ident="MXARTICLELOWSTOCK"}]</h3>
                </div>
                <div class="panel-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">[{oxmultilang ident="MXARTICLE"}]</th>
                            <th scope="col">[{oxmultilang ident="MXSELLCOUNT"}]</th>
                            <th scope="col">[{oxmultilang ident="MXSELLSTOCK"}]</th>
                        </tr>
                        </thead>
                        <tbody>
                        [{foreach from=$aLowStockArticles item=article name=articleSelled}]
                            <tr>
                                <th scope="row">[{$smarty.foreach.articleSelled.iteration}]</th>
                                <td>[{$article.oxtitle}]</td>
                                <td>[{$article.oxamount}]</td>
                                <td>[{$article.oxstock}]</td>
                            </tr>
                            [{/foreach}]
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        [{/if}]
    </div>

    <!-- Last row -->
    <div class="row">
        <div class="col-sm-12 col-md-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-3"><img src="[{$oViewConf->getBaseDir()}]/modules/mx/admindashboard/maexware.png" hspace="20" vspace="10"></div>
                        <div class="col-md-9 vcenter">[{oxmultilang ident="MXINFO_DASHBOARD"}]</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

[{* CONTENT ENDS *}]

<script type="text/javascript">
    <!--
    function _homeExpAct(mnid,sbid){
        top.navigation.adminnav._navExtExpAct(mnid,sbid);
    }
    //-->
</script>

</body>
</html>

