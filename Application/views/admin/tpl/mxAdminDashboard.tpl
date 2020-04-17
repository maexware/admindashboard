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
                    <form name="orderChart" id="orderChart" action="[{ $oViewConf->getSelfLink() }]" method="post">
                        [{ $oViewConf->getHiddenSid() }]
                        <input type="hidden" name="cl" value="mxAdminDashboard">
                        <input type="hidden" name="fnc" value="changeOrderChartView">
                        <input type="hidden" id="orderChartOption" name="option" value="m">
                        <div class="btn-group" id="orderoverviewType">
                            <button type="submit" data-option="m" class="btn btn-default active">[{oxmultilang ident="MXDASHBOARDORDERDATA_MONTH"}]</button>
                            <button type="submit" data-option="y" class="btn btn-default">[{oxmultilang ident="MXDASHBOARDORDERDATA_YEAR"}]</button>
                            [{*<button type="submit" data-option="p" class="btn btn-default">[{oxmultilang ident="MXDASHBOARDORDERDATA_PERIOD"}]</button>*}]
                        </div>
                        <div class="btn-group" id="orderoverviewNavigation">
                            <button data-option="prev" class="btn btn-default"><</button>
                            <button data-option="next" class="btn btn-default">></button>
                        </div>
                    </form>

                    <h4 id="orderChartPeriod">[{$orderCharts.timestamp|date_format:"%B"}]</h4>

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

    <!-- Second row -->
    <div class="row">
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

    <!-- Last row -->
    <div class="row">
        <div class="col-sm-12 col-md-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <img src="[{$oViewConf->getBaseDir()}]/modules/mx/admindashboard/maexware.png" hspace="20" vspace="10">
                    [{oxmultilang ident="MXINFO_DASHBOARD"}]
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

