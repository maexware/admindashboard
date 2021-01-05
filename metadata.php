<?php

/**
 * This file is part of a maexware solutions module.
 *
 * This maexware solutions module is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This maexware solutions module is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with maexware solutions AdminDashboard modul.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @link      https://www.maexware-solutions.de
 * @copyright (C) maexware solutions GmbH 2018
 */

/**
 * Metadata version
 */

$sMetadataVersion = '2.1';

$aModule = [
    'id'          => 'mxadmindashboard',
    'title'       => [
        'en' => '[<span style="color:blue;">mae</span><span style="font-weight:bold;">X</span><span style="color:blue;">ware</span>] Admin dashboard',
        'de' => '[<span style="color:blue;">mae</span><span style="font-weight:bold;">X</span><span style="color:blue;">ware</span>] Admin Dashboard',
    ],
    'description' => [
        'en' => 'Shows shop statistics at your OXID eShop Admin startpage',
        'de' => 'Anzeige von Shopstatistiken anstatt der standard OXID eShop Admin Startseite',
    ],
    'thumbnail'   => 'maexware.png',
    'version'     => '1.6',
    'author'      => 'maexware solutions GmbH',
    'url'         => 'https://www.maexware-solutions.de',
    'email'       => 'info@maexware-solutions.de',

    'extend'      => [
        \OxidEsales\Eshop\Application\Controller\Admin\AdminStart::class            => \maexware\AdminDashboard\Extensions\Application\Controller\Admin\mxAdminDashboardStart::class,
        \OxidEsales\Eshop\Application\Controller\Admin\NavigationController::class  => \maexware\AdminDashboard\Extensions\Application\Controller\Admin\mxAdminDashboard::class,
    ],
    'controllers'       => [
        'mxadmindashboard'                  => \maexware\AdminDashboard\Extensions\Application\Controller\Admin\mxAdminDashboard::class,
        'mxAdminController'                 => \maexware\AdminDashboard\Application\Controller\Admin\mxAdminController::class,
    ],
    'templates'   => [
        'mxStart.tpl'                       => 'mx/admindashboard/Application/views/admin/tpl/mxStart.tpl',
        'mxAdminDashboard.tpl'              => 'mx/admindashboard/Application/views/admin/tpl/mxAdminDashboard.tpl',
        'mxOrderChart.tpl'                  => 'mx/admindashboard/Application/views/admin/tpl/mxOrderChart.tpl',
        'mxStartMenu.tpl'                   => 'mx/admindashboard/Application/views/admin/tpl/mxStartMenu.tpl',
    ],
    'blocks'      => [],
    'settings'    => [
        [
            'group' => 'mxAdminDashboard',
            'name'  => 'mxAdminDashboard_orders',
            'type'  => 'bool',
            'value' => '1'
        ],
        [
            'group' => 'mxAdminDashboard',
            'name'  => 'mxAdminDashboard_payments',
            'type'  => 'bool',
            'value' => '1'
        ],
        [
            'group' => 'mxAdminDashboard',
            'name'  => 'mxAdminDashboard_topsellerCategories',
            'type'  => 'bool',
            'value' => '1'
        ],
        [
            'group' => 'mxAdminDashboard',
            'name'  => 'mxAdminDashboard_ordersStorno',
            'type'  => 'bool',
            'value' => '1'
        ],
        [
            'group' => 'mxAdminDashboard',
            'name'  => 'mxAdminDashboard_ordersState',
            'type'  => 'bool',
            'value' => '1'
        ],
        [
            'group' => 'mxAdminDashboard',
            'name'  => 'mxAdminDashboard_orderValues',
            'type'  => 'bool',
            'value' => '1'
        ],
        [
            'group' => 'mxAdminDashboard',
            'name'  => 'mxAdminDashboard_customerAcountTypes',
            'type'  => 'bool',
            'value' => '1'
        ],
        [
            'group' => 'mxAdminDashboard',
            'name'  => 'mxAdminDashboard_customerBought',
            'type'  => 'bool',
            'value' => '1'
        ],
        [
            'group' => 'mxAdminDashboard',
            'name'  => 'mxAdminDashboard_customerNewsletters',
            'type'  => 'bool',
            'value' => '1'
        ],
        [
            'group' => 'mxAdminDashboard',
            'name'  => 'mxAdminDashboard_articleInfos',
            'type'  => 'bool',
            'value' => '1'
        ],
        [
            'group' => 'mxAdminDashboard',
            'name'  => 'mxAdminDashboard_articleTopActive',
            'type'  => 'bool',
            'value' => '1'
        ],
        [
            'group' => 'mxAdminDashboard',
            'name'  => 'mxAdminDashboard_articleTopAll',
            'type'  => 'bool',
            'value' => '1'
        ],
        [
            'group' => 'mxAdminDashboard',
            'name'  => 'mxAdminDashboard_bestBuyer',
            'type'  => 'bool',
            'value' => '1'
        ],
        [
            'group' => 'mxAdminDashboard',
            'name'  => 'mxAdminDashboard_nonseller',
            'type'  => 'bool',
            'value' => '1'
        ],
        [
            'group' => 'mxAdminDashboard',
            'name'  => 'mxAdminDashboard_lowStockArticle',
            'type'  => 'bool',
            'value' => '1'
        ],
        [
            'group' => 'mxAdminDashboard',
            'name'  => 'mxAdminDashboard_bestSellingDays',
            'type'  => 'bool',
            'value' => '1'
        ],
        [
            'group' => 'mxAdminDashboard',
            'name'  => 'mxAdminDashboard_bestSellingMonth',
            'type'  => 'bool',
            'value' => '1'
        ],
        [
            'group' => 'mxAdminDashboard',
            'name'  => 'mxAdminDashboard_bestSellingHour',
            'type'  => 'bool',
            'value' => '1'
        ],
        [
            'group' => 'mxAdminDashboard',
            'name'  => 'mxAdminDashboard_yearDevelop',
            'type'  => 'bool',
            'value' => '1'
        ],
        [
            'group' => 'mxAdminDashboard',
            'name'  => 'mxAdminDashboard_yearDevelopOrder',
            'type'  => 'bool',
            'value' => '1'
        ],
        [
            'group' => 'mxAdminDashboard',
            'name'  => 'mxAdminDashboard_genderOrders',
            'type'  => 'bool',
            'value' => '1'
        ],
    ],
];
