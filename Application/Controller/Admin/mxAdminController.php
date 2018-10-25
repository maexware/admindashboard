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
 * along with maexware solutions AdminDashboard module.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @link      https://www.maexware-solutions.de
 * @copyright (C) maexware solutions GmbH 2018
 */

namespace maexware\AdminDashboard\Application\Controller\Admin;

class mxAdminController extends AdminController
{

    /**
     * Sets-up navigation parameters
     *
     * @param string $sNode active view id
     */
    protected function _setupNavigation($sNode)
    {
        // navigation according to class
        if ($sNode) {
            $myAdminNavig = $this->getNavigation();

            // active tab
            $iActTab = \OxidEsales\Eshop\Core\Registry::getConfig()->getRequestParameter('actedit');
            $iActTab = $iActTab ? $iActTab : $this->_iDefEdit;

            $sActTab = $iActTab ? "&actedit=$iActTab" : '';

            // store navigation history
            $this->_addNavigationHistory($sNode);

            // list url
            $this->_aViewData['listurl'] = $myAdminNavig->getListUrl($sNode) . $sActTab.'&tets=1';

            // edit url
            $this->_aViewData['editurl'] = $myAdminNavig->getEditUrl($sNode, $iActTab) . $sActTab;
        }
    }
}