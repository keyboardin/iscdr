<%@ page language="java" 	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<c:set var="contextpath" value="<%= request.getContextPath()%>"></c:set> 

<!DOCTYPE html>
<!-- 
Template Name:  SmartAdmin Responsive WebApp - Template build with Twitter Bootstrap 4
Version: 4.0.0
Author: Sunnyat Ahmmed
Website: http://gootbootstrap.com
Purchase: https://wrapbootstrap.com/theme/smartadmin-responsive-webapp-WB0573SK0
License: You must have a valid license purchased only from wrapbootstrap.com (link above) in order to legally use this theme for your project.
-->
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>
            ${param.system_skin}
        </title>
        <meta name="description" content="Buttons">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no, minimal-ui">
        <!-- Call App Mode on ios devices -->
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <!-- Remove Tap Highlight on Windows Phone IE -->
        <meta name="msapplication-tap-highlight" content="no">
        <!-- base css -->
        <link rel="stylesheet" media="screen, print" href="${contextpath}/static/SmartAdmin/css/vendors.bundle.css">
        <link rel="stylesheet" media="screen, print" href="${contextpath}/static/SmartAdmin/css/app.bundle.css">
        <link rel="stylesheet" media="screen, print" href="${contextpath}/static/common/css/custom.css">
    </head>
    <body class="mod-bg-1 ">
        <!-- DOC: script to save and load page settings -->
        <script>
            /**
             *	This script should be placed right after the body tag for fast execution 
             *	Note: the script is written in pure javascript and does not depend on thirdparty library
             **/
            'use strict';

            var classHolder = document.getElementsByTagName("BODY")[0],
                /** 
                 * Load from localstorage
                 **/
                themeSettings = (localStorage.getItem('themeSettings')) ? JSON.parse(localStorage.getItem('themeSettings')) :
                {},
                themeURL = themeSettings.themeURL || '',
                themeOptions = themeSettings.themeOptions || '';
            /** 
             * Load theme options
             **/
            if (themeSettings.themeOptions)
            {
                classHolder.className = themeSettings.themeOptions;
                console.log("%c✔ Theme settings loaded", "color: #148f32");
            }
            else
            {
                console.log("Heads up! Theme settings is empty or does not exist, loading default settings...");
            }
            if (themeSettings.themeURL && !document.getElementById('mytheme'))
            {
                var cssfile = document.createElement('link');
                cssfile.id = 'mytheme';
                cssfile.rel = 'stylesheet';
                cssfile.href = themeURL;
                document.getElementsByTagName('head')[0].appendChild(cssfile);
            }
            /** 
             * Save to localstorage 
             **/
            var saveSettings = function()
            {
                themeSettings.themeOptions = String(classHolder.className).split(/[^\w-]+/).filter(function(item)
                {
                    return /^(nav|header|mod|display)-/i.test(item);
                }).join(' ');
                if (document.getElementById('mytheme'))
                {
                    themeSettings.themeURL = document.getElementById('mytheme').getAttribute("href");
                };
                localStorage.setItem('themeSettings', JSON.stringify(themeSettings));
            }
            /** 
             * Reset settings
             **/
            var resetSettings = function()
            {
                localStorage.setItem("themeSettings", "");
            }

        </script>
        <!-- BEGIN Page Wrapper -->
        <div class="page-wrapper">
            <div class="page-inner">
                <!-- BEGIN Left Aside -->
                <aside class="page-sidebar">
                    <div class="page-logo">
                       
                    </div>
                    <!-- BEGIN PRIMARY NAVIGATION -->
                    <nav id="js-primary-nav" class="primary-nav" role="navigation">
                        <div class="nav-filter">
                            <div class="position-relative">
                                <input type="text" id="nav_filter_input" placeholder="Filter menu" class="form-control" tabindex="0">
                                <a href="#" onclick="return false;" class="btn-primary btn-search-close js-waves-off" data-action="toggle" data-class="list-filter-active" data-target=".page-sidebar">
                                    <i class="fal fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="info-card">
                            <div class="info-card-text">
                                <a href="#" class="d-flex align-items-center text-white">
                                    <span class="text-truncate text-truncate-sm d-inline-block">
                                        Dr. Codex Lantern
                                    </span>
                                </a>
                                <span class="d-inline-block text-truncate text-truncate-sm">Toronto, Canada</span>
                            </div>
                            <img src="${contextpath}/static/SmartAdmin/img/card-backgrounds/cover-2-lg.png" class="cover" alt="cover">
                            <a href="#" onclick="return false;" class="pull-trigger-btn" data-action="toggle" data-class="list-filter-active" data-target=".page-sidebar" data-focus="nav_filter_input">
                                <i class="fal fa-angle-down"></i>
                            </a>
                        </div>
                        <ul id="js-nav-menu" class="nav-menu">
                            <li>
                                <a href="#" title="Application Intel" data-filter-tags="application intel">
                                    <i class="fal fa-info-circle"></i>
                                    <span class="nav-link-text" data-i18n="nav.application_intel">Application Intel</span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="intel_introduction.html" title="Introduction" data-filter-tags="application intel introduction">
                                            <span class="nav-link-text" data-i18n="nav.application_intel_introduction">Introduction</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="intel_privacy.html" title="Privacy" data-filter-tags="application intel privacy">
                                            <span class="nav-link-text" data-i18n="nav.application_intel_privacy">Privacy</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Theme Settings" data-filter-tags="theme settings">
                                    <i class="fal fa-cog"></i>
                                    <span class="nav-link-text" data-i18n="nav.theme_settings">Theme Settings</span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="settings_how_it_works.html" title="How it works" data-filter-tags="theme settings how it works">
                                            <span class="nav-link-text" data-i18n="nav.theme_settings_how_it_works">How it works</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="settings_layout_options.html" title="Layout Options" data-filter-tags="theme settings layout options">
                                            <span class="nav-link-text" data-i18n="nav.theme_settings_layout_options">Layout Options</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="settings_skin_options.html" title="Skin Options" data-filter-tags="theme settings skin options">
                                            <span class="nav-link-text" data-i18n="nav.theme_settings_skin_options">Skin Options</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="settings_saving_db.html" title="Saving to Database" data-filter-tags="theme settings saving to database">
                                            <span class="nav-link-text" data-i18n="nav.theme_settings_saving_to_database">Saving to Database</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Package Info" data-filter-tags="package info">
                                    <i class="fal fa-tag"></i>
                                    <span class="nav-link-text" data-i18n="nav.package_info">Package Info</span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="info_app_licensing.html" title="Product Licensing" data-filter-tags="package info product licensing">
                                            <span class="nav-link-text" data-i18n="nav.package_info_product_licensing">Product Licensing</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="info_app_flavors.html" title="Different Flavors" data-filter-tags="package info different flavors">
                                            <span class="nav-link-text" data-i18n="nav.package_info_different_flavors">Different Flavors</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-title">Tools & Components</li>
                            <li class="active open">
                                <a href="#" title="UI Components" data-filter-tags="ui components">
                                    <i class="fal fa-window"></i>
                                    <span class="nav-link-text" data-i18n="nav.ui_components">UI Components</span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="ui_alerts.html" title="Alerts" data-filter-tags="ui components alerts">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_alerts">Alerts</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_accordion.html" title="Accordions" data-filter-tags="ui components accordions">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_accordions">Accordions</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_badges.html" title="Badges" data-filter-tags="ui components badges">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_badges">Badges</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_breadcrumbs.html" title="Breadcrumbs" data-filter-tags="ui components breadcrumbs">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_breadcrumbs">Breadcrumbs</span>
                                        </a>
                                    </li>
                                    <li class="active">
                                        <a href="ui_buttons.html" title="Buttons" data-filter-tags="ui components buttons">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_buttons">Buttons</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_button_group.html" title="Button Group" data-filter-tags="ui components button group">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_button_group">Button Group</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_cards.html" title="Cards" data-filter-tags="ui components cards">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_cards">Cards</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_carousel.html" title="Carousel" data-filter-tags="ui components carousel">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_carousel">Carousel</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_collapse.html" title="Collapse" data-filter-tags="ui components collapse">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_collapse">Collapse</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_dropdowns.html" title="Dropdowns" data-filter-tags="ui components dropdowns">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_dropdowns">Dropdowns</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_list_filter.html" title="List Filter" data-filter-tags="ui components list filter">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_list_filter">List Filter</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_modal.html" title="Modal" data-filter-tags="ui components modal">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_modal">Modal</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_navbars.html" title="Navbars" data-filter-tags="ui components navbars">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_navbars">Navbars</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_panels.html" title="Panels" data-filter-tags="ui components panels">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_panels">Panels</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_pagination.html" title="Pagination" data-filter-tags="ui components pagination">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_pagination">Pagination</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_popovers.html" title="Popovers" data-filter-tags="ui components popovers">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_popovers">Popovers</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_progress_bars.html" title="Progress Bars" data-filter-tags="ui components progress bars">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_progress_bars">Progress Bars</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_scrollspy.html" title="ScrollSpy" data-filter-tags="ui components scrollspy">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_scrollspy">ScrollSpy</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_side_panel.html" title="Side Panel" data-filter-tags="ui components side panel">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_side_panel">Side Panel</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_spinners.html" title="Spinners" data-filter-tags="ui components spinners">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_spinners">Spinners</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_tabs_pills.html" title="Tabs & Pills" data-filter-tags="ui components tabs & pills">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_tabs_&_pills">Tabs & Pills</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_toasts.html" title="Toasts" data-filter-tags="ui components toasts">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_toasts">Toasts</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="ui_tooltips.html" title="Tooltips" data-filter-tags="ui components tooltips">
                                            <span class="nav-link-text" data-i18n="nav.ui_components_tooltips">Tooltips</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Utilities" data-filter-tags="utilities">
                                    <i class="fal fa-bolt"></i>
                                    <span class="nav-link-text" data-i18n="nav.utilities">Utilities</span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="utilities_borders.html" title="Borders" data-filter-tags="utilities borders">
                                            <span class="nav-link-text" data-i18n="nav.utilities_borders">Borders</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_clearfix.html" title="Clearfix" data-filter-tags="utilities clearfix">
                                            <span class="nav-link-text" data-i18n="nav.utilities_clearfix">Clearfix</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_color_pallet.html" title="Color Pallet" data-filter-tags="utilities color pallet">
                                            <span class="nav-link-text" data-i18n="nav.utilities_color_pallet">Color Pallet</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_display_property.html" title="Display Property" data-filter-tags="utilities display property">
                                            <span class="nav-link-text" data-i18n="nav.utilities_display_property">Display Property</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_fonts.html" title="Fonts" data-filter-tags="utilities fonts">
                                            <span class="nav-link-text" data-i18n="nav.utilities_fonts">Fonts</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_flexbox.html" title="Flexbox" data-filter-tags="utilities flexbox">
                                            <span class="nav-link-text" data-i18n="nav.utilities_flexbox">Flexbox</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_helpers.html" title="Helpers" data-filter-tags="utilities helpers">
                                            <span class="nav-link-text" data-i18n="nav.utilities_helpers">Helpers</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_position.html" title="Position" data-filter-tags="utilities position">
                                            <span class="nav-link-text" data-i18n="nav.utilities_position">Position</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_responsive_grid.html" title="Responsive Grid" data-filter-tags="utilities responsive grid">
                                            <span class="nav-link-text" data-i18n="nav.utilities_responsive_grid">Responsive Grid</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_sizing.html" title="Sizing" data-filter-tags="utilities sizing">
                                            <span class="nav-link-text" data-i18n="nav.utilities_sizing">Sizing</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_spacing.html" title="Spacing" data-filter-tags="utilities spacing">
                                            <span class="nav-link-text" data-i18n="nav.utilities_spacing">Spacing</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="utilities_typography.html" title="Typography" data-filter-tags="utilities typography fonts headings bold lead colors sizes link text states list styles truncate alignment">
                                            <span class="nav-link-text" data-i18n="nav.utilities_typography">Typography</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="Menu child" data-filter-tags="utilities menu child">
                                            <span class="nav-link-text" data-i18n="nav.utilities_menu_child">Menu child</span>
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="javascript:void(0);" title="Sublevel Item" data-filter-tags="utilities menu child sublevel item">
                                                    <span class="nav-link-text" data-i18n="nav.utilities_menu_child_sublevel_item">Sublevel Item</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void(0);" title="Another Item" data-filter-tags="utilities menu child another item">
                                                    <span class="nav-link-text" data-i18n="nav.utilities_menu_child_another_item">Another Item</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="disabled">
                                        <a href="javascript:void(0);" title="Disabled item" data-filter-tags="utilities disabled item">
                                            <span class="nav-link-text" data-i18n="nav.utilities_disabled_item">Disabled item</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Font Icons" data-filter-tags="font icons">
                                    <i class="fal fa-map-marker-alt"></i>
                                    <span class="nav-link-text" data-i18n="nav.font_icons">Font Icons</span>
                                    <span class="dl-ref bg-primary-500 hidden-nav-function-minify hidden-nav-function-top">2,500+</span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="javascript:void(0);" title="FontAwesome" data-filter-tags="font icons fontawesome">
                                            <span class="nav-link-text" data-i18n="nav.font_icons_fontawesome">FontAwesome Pro</span>
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="icons_fontawesome_light.html" title="Light" data-filter-tags="font icons fontawesome light">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_fontawesome_light">Light</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="icons_fontawesome_regular.html" title="Regular" data-filter-tags="font icons fontawesome regular">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_fontawesome_regular">Regular</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="icons_fontawesome_solid.html" title="Solid" data-filter-tags="font icons fontawesome solid">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_fontawesome_solid">Solid</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="icons_fontawesome_brand.html" title="Brand" data-filter-tags="font icons fontawesome brand">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_fontawesome_brand">Brand</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="NextGen Icons" data-filter-tags="font icons nextgen icons">
                                            <span class="nav-link-text" data-i18n="nav.font_icons_nextgen_icons">NextGen Icons</span>
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="icons_nextgen_general.html" title="General" data-filter-tags="font icons nextgen icons general">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_nextgen_icons_general">General</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="icons_nextgen_base.html" title="Base" data-filter-tags="font icons nextgen icons base">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_nextgen_icons_base">Base</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="Stack Icons" data-filter-tags="font icons stack icons">
                                            <span class="nav-link-text" data-i18n="nav.font_icons_stack_icons">Stack Icons</span>
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="icons_stack_showcase.html" title="Showcase" data-filter-tags="font icons stack icons showcase">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_stack_icons_showcase">Showcase</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="icons_stack_generate.html?layers=3" title="Generate Stack" data-filter-tags="font icons stack icons generate stack">
                                                    <span class="nav-link-text" data-i18n="nav.font_icons_stack_icons_generate_stack">Generate Stack</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Tables" data-filter-tags="tables">
                                    <i class="fal fa-th-list"></i>
                                    <span class="nav-link-text" data-i18n="nav.tables">Tables</span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="tables_basic.html" title="Basic Tables" data-filter-tags="tables basic tables">
                                            <span class="nav-link-text" data-i18n="nav.tables_basic_tables">Basic Tables</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="tables_generate_style.html" title="Generate Table Style" data-filter-tags="tables generate table style">
                                            <span class="nav-link-text" data-i18n="nav.tables_generate_table_style">Generate Table Style</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" title="Form Stuff" data-filter-tags="form stuff">
                                    <i class="fal fa-edit"></i>
                                    <span class="nav-link-text" data-i18n="nav.form_stuff">Form Stuff</span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="form_basic_inputs.html" title="Basic Inputs" data-filter-tags="form stuff basic inputs">
                                            <span class="nav-link-text" data-i18n="nav.form_stuff_basic_inputs">Basic Inputs</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="form_checkbox_radio.html" title="Checkbox & Radio" data-filter-tags="form stuff checkbox & radio">
                                            <span class="nav-link-text" data-i18n="nav.form_stuff_checkbox_&_radio">Checkbox & Radio</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="form_input_groups.html" title="Input Groups" data-filter-tags="form stuff input groups">
                                            <span class="nav-link-text" data-i18n="nav.form_stuff_input_groups">Input Groups</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="form_validation.html" title="Validation" data-filter-tags="form stuff validation">
                                            <span class="nav-link-text" data-i18n="nav.form_stuff_validation">Validation</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-title">Plugins & Addons</li>
                            <li>
                                <a href="#" title="Plugins" data-filter-tags="plugins">
                                    <i class="fal fa-shield-alt"></i>
                                    <span class="nav-link-text" data-i18n="nav.plugins">Core Plugins</span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="plugin_faq.html" title="Plugins FAQ" data-filter-tags="plugins plugins faq">
                                            <span class="nav-link-text" data-i18n="nav.plugins_plugins_faq">Plugins FAQ</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugin_waves.html" title="Waves" data-filter-tags="plugins waves">
                                            <span class="nav-link-text" data-i18n="nav.plugins_waves">Waves</span>
                                            <span class="dl-ref label bg-primary-400 ml-2">9 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugin_pacejs.html" title="PaceJS" data-filter-tags="plugins pacejs">
                                            <span class="nav-link-text" data-i18n="nav.plugins_pacejs">PaceJS</span>
                                            <span class="dl-ref label bg-primary-500 ml-2">13 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugin_smartpanels.html" title="SmartPanels" data-filter-tags="plugins smartpanels">
                                            <span class="nav-link-text" data-i18n="nav.plugins_smartpanels">SmartPanels</span>
                                            <span class="dl-ref label bg-primary-600 ml-2">9 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugin_bootbox.html" title="BootBox" data-filter-tags="plugins bootbox alert sound">
                                            <span class="nav-link-text" data-i18n="nav.plugins_bootbox">BootBox</span>
                                            <span class="dl-ref label bg-primary-600 ml-2">15 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugin_slimscroll.html" title="Slimscroll" data-filter-tags="plugins slimscroll">
                                            <span class="nav-link-text" data-i18n="nav.plugins_slimscroll">Slimscroll</span>
                                            <span class="dl-ref label bg-primary-700 ml-2">5 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugin_throttle.html" title="Throttle" data-filter-tags="plugins throttle">
                                            <span class="nav-link-text" data-i18n="nav.plugins_throttle">Throttle</span>
                                            <span class="dl-ref label bg-primary-700 ml-2">1 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugin_navigation.html" title="Navigation" data-filter-tags="plugins navigation">
                                            <span class="nav-link-text" data-i18n="nav.plugins_navigation">Navigation</span>
                                            <span class="dl-ref label bg-primary-700 ml-2">2 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugin_i18next.html" title="i18next" data-filter-tags="plugins i18next">
                                            <span class="nav-link-text" data-i18n="nav.plugins_i18next">i18next</span>
                                            <span class="dl-ref label bg-primary-700 ml-2">10 KB</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="plugin_appcore.html" title="App.Core" data-filter-tags="plugins app.core">
                                            <span class="nav-link-text" data-i18n="nav.plugins_app.core">App.Core</span>
                                            <span class="dl-ref label bg-success-700 ml-2">14 KB</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-title">Layouts & Apps</li>
                            <li>
                                <a href="#" title="Pages" data-filter-tags="pages">
                                    <i class="fal fa-plus-circle"></i>
                                    <span class="nav-link-text" data-i18n="nav.pages">Page Views</span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="page_chat.html" title="Chat" data-filter-tags="pages chat">
                                            <span class="nav-link-text" data-i18n="nav.pages_chat">Chat</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="page_contacts.html" title="Contacts" data-filter-tags="pages contacts">
                                            <span class="nav-link-text" data-i18n="nav.pages_contacts">Contacts</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="Forum" data-filter-tags="pages forum">
                                            <span class="nav-link-text" data-i18n="nav.pages_forum">Forum</span>
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="page_forum_list.html" title="List" data-filter-tags="pages forum list">
                                                    <span class="nav-link-text" data-i18n="nav.pages_forum_list">List</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_forum_threads.html" title="Threads" data-filter-tags="pages forum threads">
                                                    <span class="nav-link-text" data-i18n="nav.pages_forum_threads">Threads</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_forum_discussion.html" title="Discussion" data-filter-tags="pages forum discussion">
                                                    <span class="nav-link-text" data-i18n="nav.pages_forum_discussion">Discussion</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="Inbox" data-filter-tags="pages inbox">
                                            <span class="nav-link-text" data-i18n="nav.pages_inbox">Inbox</span>
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="page_inbox_general.html" title="General" data-filter-tags="pages inbox general">
                                                    <span class="nav-link-text" data-i18n="nav.pages_inbox_general">General</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_inbox_read.html" title="Read" data-filter-tags="pages inbox read">
                                                    <span class="nav-link-text" data-i18n="nav.pages_inbox_read">Read</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_inbox_write.html" title="Write" data-filter-tags="pages inbox write">
                                                    <span class="nav-link-text" data-i18n="nav.pages_inbox_write">Write</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="page_invoice.html" title="Invoice (printable)" data-filter-tags="pages invoice (printable)">
                                            <span class="nav-link-text" data-i18n="nav.pages_invoice_(printable)">Invoice (printable)</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="Authentication" data-filter-tags="pages authentication">
                                            <span class="nav-link-text" data-i18n="nav.pages_authentication">Authentication</span>
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="page_forget.html" title="Forget Password" data-filter-tags="pages authentication forget password">
                                                    <span class="nav-link-text" data-i18n="nav.pages_authentication_forget_password">Forget Password</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_locked.html" title="Locked Screen" data-filter-tags="pages authentication locked screen">
                                                    <span class="nav-link-text" data-i18n="nav.pages_authentication_locked_screen">Locked Screen</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_login.html" title="Login" data-filter-tags="pages authentication login">
                                                    <span class="nav-link-text" data-i18n="nav.pages_authentication_login">Login</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_login-alt.html" title="Login Alt" data-filter-tags="pages authentication login alt">
                                                    <span class="nav-link-text" data-i18n="nav.pages_authentication_login_alt">Login Alt</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_register.html" title="Register" data-filter-tags="pages authentication register">
                                                    <span class="nav-link-text" data-i18n="nav.pages_authentication_register">Register</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_confirmation.html" title="Confirmation" data-filter-tags="pages authentication confirmation">
                                                    <span class="nav-link-text" data-i18n="nav.pages_authentication_confirmation">Confirmation</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="Error Pages" data-filter-tags="pages error pages">
                                            <span class="nav-link-text" data-i18n="nav.pages_error_pages">Error Pages</span>
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="page_error.html" title="General Error" data-filter-tags="pages error pages general error">
                                                    <span class="nav-link-text" data-i18n="nav.pages_error_pages_general_error">General Error</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_error_404.html" title="Server Error" data-filter-tags="pages error pages server error">
                                                    <span class="nav-link-text" data-i18n="nav.pages_error_pages_server_error">Server Error</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="page_error_announced.html" title="Announced Error" data-filter-tags="pages error pages announced error">
                                                    <span class="nav-link-text" data-i18n="nav.pages_error_pages_announced_error">Announced Error</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="page_profile.html" title="Profile" data-filter-tags="pages profile">
                                            <span class="nav-link-text" data-i18n="nav.pages_profile">Profile</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="page_search.html" title="Search Results" data-filter-tags="pages search results">
                                            <span class="nav-link-text" data-i18n="nav.pages_search_results">Search Results</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <div class="filter-message js-filter-message bg-success-600"></div>
                    </nav>
                    <!-- END PRIMARY NAVIGATION -->
                    <!-- NAV FOOTER -->
                    <div class="nav-footer shadow-top">
                        <a href="#" onclick="return false;" data-action="toggle" data-class="nav-function-minify" class="hidden-md-down">
                            <i class="ni ni-chevron-right"></i>
                            <i class="ni ni-chevron-right"></i>
                        </a>
                        <ul class="list-table m-auto nav-footer-buttons">
                            <li>
                                <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="Chat logs">
                                    <i class="fal fa-comments"></i>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="Support Chat">
                                    <i class="fal fa-life-ring"></i>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="Make a call">
                                    <i class="fal fa-phone"></i>
                                </a>
                            </li>
                        </ul>
                    </div> <!-- END NAV FOOTER -->
                </aside>
                <!-- END Left Aside -->
                <div class="page-content-wrapper">
                    <!-- BEGIN Page Header -->
                    <header class="page-header" role="banner">
                        <!-- we need this logo when user switches to nav-function-top -->
                        <div class="page-logo">
                            <a href="#" class="page-logo-link press-scale-down d-flex align-items-center" data-toggle="modal" data-target="#modal-shortcut">
                                <img src="${contextpath}/static/SmartAdmin/img/logo.png" alt="${param.system_skin}" aria-roledescription="logo">
                                <span class="page-logo-text mr-1">${param.system_skin}</span>
                                <i class="fal fa-angle-down d-inline-block ml-1 fs-lg color-primary-300"></i>
                            </a>
                        </div>
                        <!-- DOC: nav menu layout change shortcut -->
                        <div class="hidden-md-down dropdown-icon-menu position-relative">
                            <a href="#" class="header-btn btn js-waves-off" data-action="toggle" data-class="nav-function-hidden" title="Hide Navigation">
                                <i class="ni ni-menu"></i>
                            </a>
                            <ul>
                                <li>
                                    <a href="#" class="btn js-waves-off" data-action="toggle" data-class="nav-function-minify" title="Minify Navigation">
                                        <i class="ni ni-minify-nav"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="btn js-waves-off" data-action="toggle" data-class="nav-function-fixed" title="Lock Navigation">
                                        <i class="ni ni-lock-nav"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <!-- DOC: mobile button appears during mobile width -->
                        <div class="hidden-lg-up">
                            <a href="#" class="header-btn btn press-scale-down" data-action="toggle" data-class="mobile-nav-on">
                                <i class="ni ni-menu"></i>
                            </a>
                        </div>
                        <div class="search">
                            <form class="app-forms hidden-xs-down" role="search" action="search-results.html" autocomplete="off">
                                <input type="text" id="search-field" placeholder="Search for anything" class="form-control" tabindex="1">
                                <a href="#" onclick="return false;" class="btn-danger btn-search-close js-waves-off d-none" data-action="toggle" data-class="mobile-search-on">
                                    <i class="fal fa-times"></i>
                                </a>
                            </form>
                        </div>
                        <div class="ml-auto d-flex">
                            <!-- activate app search icon (mobile) -->
                            <div class="hidden-sm-up">
                                <a href="#" class="header-icon" data-action="toggle" data-class="mobile-search-on" data-focus="search-field" title="Search">
                                    <i class="fal fa-search"></i>
                                </a>
                            </div>
                            <!-- app settings -->
                            <div class="hidden-md-down">
                                <a href="#" class="header-icon" data-toggle="modal" data-target=".js-modal-settings">
                                    <i class="fal fa-cog"></i>
                                </a>
                            </div>
                            <!-- app shortcuts -->
                            <div>
                                <a href="#" class="header-icon" data-toggle="dropdown" title="My Apps">
                                    <i class="fal fa-cube"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-animated w-auto h-auto">
                                    <div class="dropdown-header bg-trans-gradient d-flex justify-content-center align-items-center rounded-top">
                                        <h4 class="m-0 text-center color-white">
                                            Quick Shortcut
                                            <small class="mb-0 opacity-80">User Applications & Addons</small>
                                        </h4>
                                    </div>
                                    <div class="custom-scroll h-100">
                                        <ul class="app-list">
                                            <li>
                                                <a href="#" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-2 icon-stack-3x color-primary-600"></i>
                                                        <i class="base-3 icon-stack-2x color-primary-700"></i>
                                                        <i class="ni ni-settings icon-stack-1x text-white fs-lg"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Services
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-2 icon-stack-3x color-primary-400"></i>
                                                        <i class="base-10 text-white icon-stack-1x"></i>
                                                        <i class="ni md-profile color-primary-800 icon-stack-2x"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Account
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-9 icon-stack-3x color-success-400"></i>
                                                        <i class="base-2 icon-stack-2x color-success-500"></i>
                                                        <i class="ni ni-shield icon-stack-1x text-white"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Security
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-18 icon-stack-3x color-info-700"></i>
                                                        <span class="position-absolute pos-top pos-left pos-right color-white fs-md mt-2 fw-400">28</span>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Calendar
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-7 icon-stack-3x color-info-500"></i>
                                                        <i class="base-7 icon-stack-2x color-info-700"></i>
                                                        <i class="ni ni-graph icon-stack-1x text-white"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Stats
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-4 icon-stack-3x color-danger-500"></i>
                                                        <i class="base-4 icon-stack-1x color-danger-400"></i>
                                                        <i class="ni ni-envelope icon-stack-1x text-white"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Messages
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-4 icon-stack-3x color-fusion-400"></i>
                                                        <i class="base-5 icon-stack-2x color-fusion-200"></i>
                                                        <i class="base-5 icon-stack-1x color-fusion-100"></i>
                                                        <i class="fal fa-keyboard icon-stack-1x color-info-50"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Notes
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-16 icon-stack-3x color-fusion-500"></i>
                                                        <i class="base-10 icon-stack-1x color-primary-50 opacity-30"></i>
                                                        <i class="base-10 icon-stack-1x fs-xl color-primary-50 opacity-20"></i>
                                                        <i class="fal fa-dot-circle icon-stack-1x text-white opacity-85"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Photos
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-19 icon-stack-3x color-primary-400"></i>
                                                        <i class="base-7 icon-stack-2x color-primary-300"></i>
                                                        <i class="base-7 icon-stack-1x fs-xxl color-primary-200"></i>
                                                        <i class="base-7 icon-stack-1x color-primary-500"></i>
                                                        <i class="fal fa-globe icon-stack-1x text-white opacity-85"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Maps
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-5 icon-stack-3x color-success-700 opacity-80"></i>
                                                        <i class="base-12 icon-stack-2x color-success-700 opacity-30"></i>
                                                        <i class="fal fa-comment-alt icon-stack-1x text-white"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Chat
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-5 icon-stack-3x color-warning-600"></i>
                                                        <i class="base-7 icon-stack-2x color-warning-800 opacity-50"></i>
                                                        <i class="fal fa-phone icon-stack-1x text-white"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Phone
                                                    </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="app-list-item hover-white">
                                                    <span class="icon-stack">
                                                        <i class="base-6 icon-stack-3x color-danger-600"></i>
                                                        <i class="fal fa-chart-line icon-stack-1x text-white"></i>
                                                    </span>
                                                    <span class="app-list-name">
                                                        Projects
                                                    </span>
                                                </a>
                                            </li>
                                            <li class="w-100">
                                                <a href="#" class="btn btn-default mt-4 mb-2 pr-5 pl-5"> Add more apps </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- app message -->
                            <a href="#" class="header-icon" data-toggle="modal" data-target=".js-modal-messenger">
                                <i class="fal fa-globe"></i>
                                <span class="badge badge-icon">!</span>
                            </a>
                            <!-- app notification -->
                            <div>
                                <a href="#" class="header-icon" data-toggle="dropdown" title="You got 11 notifications">
                                    <i class="fal fa-bell"></i>
                                    <span class="badge badge-icon">11</span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-animated dropdown-xl">
                                    <div class="dropdown-header bg-trans-gradient d-flex justify-content-center align-items-center rounded-top mb-2">
                                        <h4 class="m-0 text-center color-white">
                                            11 New
                                            <small class="mb-0 opacity-80">User Notifications</small>
                                        </h4>
                                    </div>
                                    <ul class="nav nav-tabs nav-tabs-clean" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link px-4 fs-md js-waves-on fw-500" data-toggle="tab" href="#tab-messages" data-i18n="drpdwn.messages">Messages</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link px-4 fs-md js-waves-on fw-500" data-toggle="tab" href="#tab-feeds" data-i18n="drpdwn.feeds">Feeds</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link px-4 fs-md js-waves-on fw-500" data-toggle="tab" href="#tab-events" data-i18n="drpdwn.events">Events</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content tab-notification">
                                        <div class="tab-pane active p-3 text-center">
                                            <h5 class="mt-4 pt-4 fw-500">
                                                <span class="d-block fa-3x pb-4 text-muted">
                                                    <i class="ni ni-arrow-up text-gradient opacity-70"></i>
                                                </span> Select a tab above to activate
                                                <small class="mt-3 fs-b fw-400 text-muted">
                                                    This blank page message helps protect your privacy, or you can show the first message here automatically through
                                                    <a href="#">settings page</a>
                                                </small>
                                            </h5>
                                        </div>
                                    </div>
                                    <div class="py-2 px-3 bg-faded d-block rounded-bottom text-right border-faded border-bottom-0 border-right-0 border-left-0">
                                        <a href="#" class="fs-xs fw-500 ml-auto">view all notifications</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- END Page Header -->
                    <!-- BEGIN Page Content -->
                    <!-- the #js-page-content id is needed for some plugins to initialize -->
                    <main id="js-page-content" role="main" class="page-content">
                        <ol class="breadcrumb page-breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0);">SmartAdmin</a></li>
                            <li class="breadcrumb-item">UI Components</li>
                            <li class="breadcrumb-item active">Buttons</li>
                            <li class="position-absolute pos-top pos-right d-none d-sm-block"><span class="js-get-date"></span></li>
                        </ol>
                        <div class="subheader">
                            <h1 class="subheader-title">
                                <i class='subheader-icon fal fa-window'></i> Buttons
                                <small>
                                    Use custom button styles for actions in forms, dialogs, and more. Includes support for a handful of contextual variations, sizes, states, and more.
                                </small>
                            </h1>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-xl-6">
                                <!--Button colors-->
                                <div id="panel-1" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Button <span class="fw-300"><i>Colors</i></span>
                                        </h2>
                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content">
                                            <div class="panel-tag">
                                                SmartAdmin WebApp includes nine predefined button styles, each serving its own semantic purpose.
                                            </div>
                                            <h5 class="frame-heading">
                                                Default
                                            </h5>
                                            <div class="frame-wrap">
                                                <div class="demo">
                                                    <button type="button" class="btn btn-primary">Primary</button>
                                                    <button type="button" class="btn btn-secondary">Secondary</button>
                                                    <button type="button" class="btn btn-success">Success</button>
                                                    <button type="button" class="btn btn-info">Info</button>
                                                    <button type="button" class="btn btn-warning">Warning</button>
                                                    <button type="button" class="btn btn-danger">Danger</button>
                                                    <button type="button" class="btn btn-dark">Dark</button>
                                                    <button type="button" class="btn btn-light">Light</button>
                                                </div>
                                            </div>
                                            <h5 class="frame-heading">
                                                Rounded
                                            </h5>
                                            <div class="frame-wrap">
                                                <div class="demo">
                                                    <button type="button" class="btn btn-primary btn-pills">Primary</button>
                                                    <button type="button" class="btn btn-secondary btn-pills">Secondary</button>
                                                    <button type="button" class="btn btn-success btn-pills">Success</button>
                                                    <button type="button" class="btn btn-info btn-pills">Info</button>
                                                    <button type="button" class="btn btn-warning btn-pills">Warning</button>
                                                    <button type="button" class="btn btn-danger btn-pills">Danger</button>
                                                    <button type="button" class="btn btn-dark btn-pills">Dark</button>
                                                    <button type="button" class="btn btn-light btn-pills">Light</button>
                                                </div>
                                            </div>
                                            <h5 class="frame-heading">
                                                Unique style
                                            </h5>
                                            <div class="frame-wrap">
                                                <div class="demo">
                                                    <button type="button" class="btn btn-default">Default</button>
                                                    <button type="button" class="btn btn-default btn-pills">Default</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Block-->
                                <div id="panel-2" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Block <span class="fw-300"><i>Buttons</i></span>
                                        </h2>
                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content">
                                            <div class="panel-tag">
                                                Create block level buttons—those that span the full width of a parent—by adding <code>.btn-block</code>
                                            </div>
                                            <div class="row">
                                                <div class="col-xl-12">
                                                    <div class="frame-wrap text-center mb-0">
                                                        <div class="row">
                                                            <div class="col-xl-6">
                                                                <div class="demo-v-spacing">
                                                                    <button type="button" class="btn btn-primary btn-lg btn-block">Block
                                                                        <span>large</span>
                                                                    </button>
                                                                    <button type="button" class="btn btn-primary btn-block">Block
                                                                        <span>default</span>
                                                                    </button>
                                                                    <button type="button" class="btn btn-primary btn-sm btn-block">Block
                                                                        <span>small</span>
                                                                    </button>
                                                                    <button type="button" class="btn btn-primary btn-xs btn-block">Block
                                                                        <span>extra small</span>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-6">
                                                                <div class="demo-v-spacing mt-3 mt-xl-0">
                                                                    <button type="button" class="btn btn-success btn-pills btn-lg btn-block">Block
                                                                        <span>large</span>
                                                                    </button>
                                                                    <button type="button" class="btn btn-success btn-pills btn-block">Block
                                                                        <span>default</span>
                                                                    </button>
                                                                    <button type="button" class="btn btn-success btn-pills btn-sm btn-block">Block
                                                                        <span>small</span>
                                                                    </button>
                                                                    <button type="button" class="btn btn-success btn-pills btn-xs btn-block">Block
                                                                        <span>extra small</span>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Sizes-->
                                <div id="panel-3" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Option <span class="fw-300"><i>Sizes</i></span>
                                        </h2>
                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content">
                                            <div class="panel-tag">
                                                Alter button sizes by using the classes <code>.btn-lg</code>, <code>.btn-sm</code>, <code>.btn-xs</code>
                                            </div>
                                            <h5 class="frame-heading">
                                                Largest size
                                            </h5>
                                            <div class="frame-wrap">
                                                <div class="demo">
                                                    <button type="button" class="btn btn-lg btn-primary">Primary</button>
                                                    <button type="button" class="btn btn-lg btn-secondary">Secondary</button>
                                                    <button type="button" class="btn btn-lg btn-default">Default</button>
                                                    <button type="button" class="btn btn-lg btn-success">Success</button>
                                                    <button type="button" class="btn btn-lg btn-warning">Warning</button>
                                                    <button type="button" class="btn btn-lg btn-info">Info</button>
                                                    <button type="button" class="btn btn-lg btn-danger">Danger</button>
                                                    <button type="button" class="btn btn-lg btn-dark">Dark</button>
                                                </div>
                                            </div>
                                            <h5 class="frame-heading">
                                                Default size
                                            </h5>
                                            <div class="frame-wrap">
                                                <div class="demo">
                                                    <button type="button" class="btn btn-primary">Primary</button>
                                                    <button type="button" class="btn btn-secondary">Secondary</button>
                                                    <button type="button" class="btn btn-default">Default</button>
                                                    <button type="button" class="btn btn-success">Success</button>
                                                    <button type="button" class="btn btn-warning">Warning</button>
                                                    <button type="button" class="btn btn-info">Info</button>
                                                    <button type="button" class="btn btn-danger">Danger</button>
                                                    <button type="button" class="btn btn-dark">Dark</button>
                                                </div>
                                            </div>
                                            <h5 class="frame-heading">
                                                Small size
                                            </h5>
                                            <div class="frame-wrap">
                                                <div class="demo">
                                                    <button type="button" class="btn btn-sm btn-primary">Primary</button>
                                                    <button type="button" class="btn btn-sm btn-secondary">Secondary</button>
                                                    <button type="button" class="btn btn-sm btn-default">Default</button>
                                                    <button type="button" class="btn btn-sm btn-success">Success</button>
                                                    <button type="button" class="btn btn-sm btn-warning">Warning</button>
                                                    <button type="button" class="btn btn-sm btn-info">Info</button>
                                                    <button type="button" class="btn btn-sm btn-danger">Danger</button>
                                                    <button type="button" class="btn btn-sm btn-dark">Dark</button>
                                                </div>
                                            </div>
                                            <h5 class="frame-heading">
                                                Smallest size
                                            </h5>
                                            <div class="frame-wrap">
                                                <div class="demo">
                                                    <button type="button" class="btn btn-xs btn-primary">Primary</button>
                                                    <button type="button" class="btn btn-xs btn-secondary">Secondary</button>
                                                    <button type="button" class="btn btn-xs btn-default">Default</button>
                                                    <button type="button" class="btn btn-xs btn-success">Success</button>
                                                    <button type="button" class="btn btn-xs btn-warning">Warning</button>
                                                    <button type="button" class="btn btn-xs btn-info">Info</button>
                                                    <button type="button" class="btn btn-xs btn-danger">Danger</button>
                                                    <button type="button" class="btn btn-xs btn-dark">Dark</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--With icons-->
                                <div id="panel-4" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Button <span class="fw-300"><i>with Icons</i></span>
                                        </h2>
                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content">
                                            <div class="panel-tag">
                                                We use the icon tags to insert icons into buttons
                                            </div>
                                            <div class="demo">
                                                <button type="button" class="btn btn-lg btn-primary">
                                                    <span class="fal fa-print mr-1"></span>
                                                    Print
                                                </button>
                                                <button type="button" class="btn btn-lg btn-secondary">
                                                    <span class="fal fa-volume-mute mr-1"></span>
                                                    Mute
                                                </button>
                                                <button type="button" class="btn btn-lg btn-default">
                                                    <span class="fal fa-check mr-1"></span>
                                                    Submit
                                                </button>
                                                <button type="button" class="btn btn-lg btn-success">
                                                    <span class="fal fa-download mr-1"></span>
                                                    Download
                                                </button>
                                                <button type="button" class="btn btn-lg btn-warning">
                                                    <span class="fal fa-exclamation-triangle mr-1"></span>
                                                    Scan Device
                                                </button>
                                                <button type="button" class="btn btn-lg btn-info">
                                                    <span class="fal fa-bug mr-1"></span>
                                                    Report Bug
                                                </button>
                                                <button type="button" class="btn btn-lg btn-danger">
                                                    <span class="fal fa-times mr-1"></span>
                                                    Delete
                                                </button>
                                                <button type="button" class="btn btn-lg btn-dark">
                                                    <span class="fal  fa-eject mr-1"></span>
                                                    Eject
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Icon buttons-->
                                <div id="panel-5" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Icons <span class="fw-300"><i>example</i></span>
                                        </h2>
                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content">
                                            <div class="panel-tag">
                                                Convert button to an icon button by adding the class <code>.btn-icon</code>
                                            </div>
                                            <h5 class="frame-heading">
                                                Various sizes
                                            </h5>
                                            <div class="frame-wrap">
                                                <div class="demo">
                                                    <a href="javascript:void(0);" class="btn btn-primary btn-lg btn-icon">
                                                        <i class="fal fa-print"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-secondary btn-lg btn-icon">
                                                        <i class="fal fa-volume-mute fs-md"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-default btn-lg btn-icon">
                                                        <i class="fal fa-check"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-success btn-lg btn-icon">
                                                        <i class="fal fa-download"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-warning btn-lg btn-icon">
                                                        <i class="fal fa-exclamation-triangle"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-info btn-lg btn-icon">
                                                        <i class="fal fa-bug"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-danger btn-lg btn-icon">
                                                        <i class="fal fa-times"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-dark btn-lg btn-icon">
                                                        <i class="fal fa-eject"></i>
                                                    </a>
                                                </div>
                                                <div class="demo">
                                                    <a href="javascript:void(0);" class="btn btn-primary btn-icon">
                                                        <i class="fal fa-print"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-secondary btn-icon">
                                                        <i class="fal fa-volume-mute fs-md"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-default btn-icon">
                                                        <i class="fal fa-check"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-success btn-icon">
                                                        <i class="fal fa-download"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-warning btn-icon">
                                                        <i class="fal fa-exclamation-triangle"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-info btn-icon">
                                                        <i class="fal fa-bug"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-danger btn-icon">
                                                        <i class="fal fa-times"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-dark btn-icon">
                                                        <i class="fal fa-eject"></i>
                                                    </a>
                                                </div>
                                                <div class="demo">
                                                    <a href="javascript:void(0);" class="btn btn-primary btn-sm btn-icon">
                                                        <i class="fal fa-print"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-secondary btn-sm btn-icon">
                                                        <i class="fal fa-volume-mute"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-default btn-sm btn-icon">
                                                        <i class="fal fa-check"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-success btn-sm btn-icon">
                                                        <i class="fal fa-download"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-warning btn-sm btn-icon">
                                                        <i class="fal fa-exclamation-triangle"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-info btn-sm btn-icon">
                                                        <i class="fal fa-bug"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-danger btn-sm btn-icon">
                                                        <i class="fal fa-times"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-dark btn-sm btn-icon">
                                                        <i class="fal fa-eject"></i>
                                                    </a>
                                                </div>
                                                <div class="demo">
                                                    <a href="javascript:void(0);" class="btn btn-primary btn-xs btn-icon">
                                                        <i class="fal fa-print"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-secondary btn-xs btn-icon">
                                                        <i class="fal fa-volume-mute"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-default btn-xs btn-icon">
                                                        <i class="fal fa-check"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-success btn-xs btn-icon">
                                                        <i class="fal fa-download"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-warning btn-xs btn-icon">
                                                        <i class="fal fa-exclamation-triangle"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-info btn-xs btn-icon">
                                                        <i class="fal fa-bug"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-danger btn-xs btn-icon">
                                                        <i class="fal fa-times"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-dark btn-xs btn-icon">
                                                        <i class="fal fa-eject"></i>
                                                    </a>
                                                </div>
                                            </div>
                                            <h5 class="frame-heading">
                                                Rounded
                                            </h5>
                                            <div class="frame-wrap">
                                                <div class="demo">
                                                    <a href="javascript:void(0);" class="btn btn-primary btn-lg btn-icon rounded-circle">
                                                        <i class="fal fa-print"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-secondary btn-lg btn-icon rounded-circle">
                                                        <i class="fal fa-volume-mute fs-md"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-default btn-lg btn-icon rounded-circle">
                                                        <i class="fal fa-check"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-success btn-lg btn-icon rounded-circle">
                                                        <i class="fal fa-download"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-warning btn-lg btn-icon rounded-circle">
                                                        <i class="fal fa-exclamation-triangle"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-info btn-lg btn-icon rounded-circle">
                                                        <i class="fal fa-bug"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-danger btn-lg btn-icon rounded-circle">
                                                        <i class="fal fa-times"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-dark btn-lg btn-icon rounded-circle">
                                                        <i class="fal fa-eject"></i>
                                                    </a>
                                                </div>
                                                <div class="demo">
                                                    <a href="javascript:void(0);" class="btn btn-primary btn-icon rounded-circle">
                                                        <i class="fal fa-print"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-secondary btn-icon rounded-circle">
                                                        <i class="fal fa-volume-mute fs-md"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-default btn-icon rounded-circle">
                                                        <i class="fal fa-check"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-success btn-icon rounded-circle">
                                                        <i class="fal fa-download"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-warning btn-icon rounded-circle">
                                                        <i class="fal fa-exclamation-triangle"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-info btn-icon rounded-circle">
                                                        <i class="fal fa-bug"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-danger btn-icon rounded-circle">
                                                        <i class="fal fa-times"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-dark btn-icon rounded-circle">
                                                        <i class="fal fa-eject"></i>
                                                    </a>
                                                </div>
                                                <div class="demo">
                                                    <a href="javascript:void(0);" class="btn btn-primary btn-sm btn-icon rounded-circle">
                                                        <i class="fal fa-print"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-secondary btn-sm btn-icon rounded-circle">
                                                        <i class="fal fa-volume-mute"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-default btn-sm btn-icon rounded-circle">
                                                        <i class="fal fa-check"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-success btn-sm btn-icon rounded-circle">
                                                        <i class="fal fa-download"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-warning btn-sm btn-icon rounded-circle">
                                                        <i class="fal fa-exclamation-triangle"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-info btn-sm btn-icon rounded-circle">
                                                        <i class="fal fa-bug"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-danger btn-sm btn-icon rounded-circle">
                                                        <i class="fal fa-times"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-dark btn-sm btn-icon rounded-circle">
                                                        <i class="fal fa-eject"></i>
                                                    </a>
                                                </div>
                                                <div class="demo">
                                                    <a href="javascript:void(0);" class="btn btn-primary btn-xs btn-icon rounded-circle">
                                                        <i class="fal fa-print"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-secondary btn-xs btn-icon rounded-circle">
                                                        <i class="fal fa-volume-mute"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-default btn-xs btn-icon rounded-circle">
                                                        <i class="fal fa-check"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-success btn-xs btn-icon rounded-circle">
                                                        <i class="fal fa-download"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-warning btn-xs btn-icon rounded-circle">
                                                        <i class="fal fa-exclamation-triangle"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-info btn-xs btn-icon rounded-circle">
                                                        <i class="fal fa-bug"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-danger btn-xs btn-icon rounded-circle">
                                                        <i class="fal fa-times"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-dark btn-xs btn-icon rounded-circle">
                                                        <i class="fal fa-eject"></i>
                                                    </a>
                                                </div>
                                            </div>
                                            <h5 class="frame-heading">
                                                Hover dot effect
                                            </h5>
                                            <div class="frame-wrap">
                                                <p class="demo">
                                                    <a href="javascript:void(0);" class="btn btn-primary btn-lg btn-icon rounded-circle hover-effect-dot">
                                                        <i class="fal fa-print"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-secondary btn-lg btn-icon rounded-circle hover-effect-dot">
                                                        <i class="fal fa-volume-mute fs-md"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-success btn-lg btn-icon hover-effect-dot">
                                                        <i class="fal fa-download"></i>
                                                    </a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-xl-6">
                                <!--Button colors (outline)-->
                                <div id="panel-6" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Button <span class="fw-300"><i>Outlines</i></span>
                                        </h2>
                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content">
                                            <div class="panel-tag">
                                                Replace the default modifier classes with<code>.btn-outline-*</code>
                                            </div>
                                            <h5 class="frame-heading">
                                                Outline
                                            </h5>
                                            <div class="frame-wrap">
                                                <div class="demo">
                                                    <button type="button" class="btn btn-outline-primary">Primary</button>
                                                    <button type="button" class="btn btn-outline-secondary">Secondary</button>
                                                    <button type="button" class="btn btn-outline-success">Success</button>
                                                    <button type="button" class="btn btn-outline-info">Info</button>
                                                    <button type="button" class="btn btn-outline-warning">Warning</button>
                                                    <button type="button" class="btn btn-outline-danger">Danger</button>
                                                    <button type="button" class="btn btn-outline-dark">Dark</button>
                                                    <button type="button" class="btn btn-outline-light">Light</button>
                                                </div>
                                            </div>
                                            <h5 class="frame-heading">
                                                Rounded outline
                                            </h5>
                                            <div class="frame-wrap">
                                                <div class="demo">
                                                    <button type="button" class="btn btn-outline-primary btn-pills">Primary</button>
                                                    <button type="button" class="btn btn-outline-secondary btn-pills">Secondary</button>
                                                    <button type="button" class="btn btn-outline-success btn-pills">Success</button>
                                                    <button type="button" class="btn btn-outline-info btn-pills">Info</button>
                                                    <button type="button" class="btn btn-outline-warning btn-pills">Warning</button>
                                                    <button type="button" class="btn btn-outline-danger btn-pills">Danger</button>
                                                    <button type="button" class="btn btn-outline-dark btn-pills">Dark</button>
                                                    <button type="button" class="btn btn-outline-light btn-pills">Light</button>
                                                </div>
                                            </div>
                                            <h5 class="frame-heading">
                                                Unique style
                                            </h5>
                                            <div class="frame-wrap mb-0">
                                                <div class="demo">
                                                    <button type="button" class="btn btn-outline-default">Default</button>
                                                    <button type="button" class="btn btn-outline-default btn-pills">Default</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Block (outline)-->
                                <div id="panel-7" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Block <span class="fw-300"><i>Outlines</i></span>
                                        </h2>
                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content">
                                            <div class="panel-tag">
                                                Block buttons inherits outline button properties <code>.btn-outline-*</code>
                                            </div>
                                            <div class="row">
                                                <div class="col-xl-12">
                                                    <div class="frame-wrap text-center mb-0">
                                                        <div class="row">
                                                            <div class="col-xl-6">
                                                                <div class="demo-v-spacing">
                                                                    <button type="button" class="btn btn-outline-primary btn-lg btn-block">Block
                                                                        <span>large</span>
                                                                    </button>
                                                                    <button type="button" class="btn btn-outline-primary btn-block">Block
                                                                        <span>default</span>
                                                                    </button>
                                                                    <button type="button" class="btn btn-outline-primary btn-sm btn-block">Block
                                                                        <span>small</span>
                                                                    </button>
                                                                    <button type="button" class="btn btn-outline-primary btn-xs btn-block">Block
                                                                        <span>extra small</span>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-6">
                                                                <div class="demo-v-spacing mt-3 mt-xl-0">
                                                                    <button type="button" class="btn btn-outline-success btn-pills btn-lg btn-block">Block
                                                                        <span>large</span>
                                                                    </button>
                                                                    <button type="button" class="btn btn-outline-success btn-pills btn-block">Block
                                                                        <span>default</span>
                                                                    </button>
                                                                    <button type="button" class="btn btn-outline-success btn-pills btn-sm btn-block">Block
                                                                        <span>small</span>
                                                                    </button>
                                                                    <button type="button" class="btn btn-outline-success btn-pills btn-xs btn-block">Block
                                                                        <span>extra small</span>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Sizes (outline)-->
                                <div id="panel-8" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Option <span class="fw-300"><i>Sizes</i></span>
                                        </h2>
                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content">
                                            <div class="panel-tag">
                                                Alter button sizes by using the classes <code>.btn-lg</code>, <code>.btn-sm</code>, <code>.btn-xs</code>
                                            </div>
                                            <h5 class="frame-heading">
                                                Largest size
                                            </h5>
                                            <div class="frame-wrap">
                                                <p class="demo">
                                                    <button type="button" class="btn btn-lg btn-outline-primary">Primary</button>
                                                    <button type="button" class="btn btn-lg btn-outline-secondary">Secondary</button>
                                                    <button type="button" class="btn btn-lg btn-outline-default">Default</button>
                                                    <button type="button" class="btn btn-lg btn-outline-success">Success</button>
                                                    <button type="button" class="btn btn-lg btn-outline-warning">Warning</button>
                                                    <button type="button" class="btn btn-lg btn-outline-info">Info</button>
                                                    <button type="button" class="btn btn-lg btn-outline-danger">Danger</button>
                                                    <button type="button" class="btn btn-lg btn-outline-dark">Dark</button>
                                                </p>
                                            </div>
                                            <h5 class="frame-heading">
                                                Default size
                                            </h5>
                                            <div class="frame-wrap">
                                                <p class="demo">
                                                    <button type="button" class="btn btn-outline-primary">Primary</button>
                                                    <button type="button" class="btn btn-outline-secondary">Secondary</button>
                                                    <button type="button" class="btn btn-outline-default">Default</button>
                                                    <button type="button" class="btn btn-outline-success">Success</button>
                                                    <button type="button" class="btn btn-outline-warning">Warning</button>
                                                    <button type="button" class="btn btn-outline-info">Info</button>
                                                    <button type="button" class="btn btn-outline-danger">Danger</button>
                                                    <button type="button" class="btn btn-outline-dark">Dark</button>
                                                </p>
                                            </div>
                                            <h5 class="frame-heading">
                                                Small size
                                            </h5>
                                            <div class="frame-wrap">
                                                <p class="demo">
                                                    <button type="button" class="btn btn-sm btn-outline-primary">Primary</button>
                                                    <button type="button" class="btn btn-sm btn-outline-secondary">Secondary</button>
                                                    <button type="button" class="btn btn-sm btn-outline-default">Default</button>
                                                    <button type="button" class="btn btn-sm btn-outline-success">Success</button>
                                                    <button type="button" class="btn btn-sm btn-outline-warning">Warning</button>
                                                    <button type="button" class="btn btn-sm btn-outline-info">Info</button>
                                                    <button type="button" class="btn btn-sm btn-outline-danger">Danger</button>
                                                    <button type="button" class="btn btn-sm btn-outline-dark">Dark</button>
                                                </p>
                                            </div>
                                            <h5 class="frame-heading">
                                                Smallest size
                                            </h5>
                                            <div class="frame-wrap">
                                                <p class="demo">
                                                    <button type="button" class="btn btn-xs btn-outline-primary">Primary</button>
                                                    <button type="button" class="btn btn-xs btn-outline-secondary">Secondary</button>
                                                    <button type="button" class="btn btn-xs btn-outline-default">Default</button>
                                                    <button type="button" class="btn btn-xs btn-outline-success">Success</button>
                                                    <button type="button" class="btn btn-xs btn-outline-warning">Warning</button>
                                                    <button type="button" class="btn btn-xs btn-outline-info">Info</button>
                                                    <button type="button" class="btn btn-xs btn-outline-danger">Danger</button>
                                                    <button type="button" class="btn btn-xs btn-outline-dark">Dark</button>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--With icons (outline)-->
                                <div id="panel-9" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Button <span class="fw-300"><i>with Icons</i></span>
                                        </h2>
                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content">
                                            <div class="panel-tag">
                                                We use the icon tags to insert icons into buttons
                                            </div>
                                            <div class="demo">
                                                <button type="button" class="btn btn-lg btn-outline-primary">
                                                    <span class="fal fa-print mr-1"></span>
                                                    Print
                                                </button>
                                                <button type="button" class="btn btn-lg btn-outline-secondary">
                                                    <span class="fal fa-volume-mute mr-1"></span>
                                                    Mute
                                                </button>
                                                <button type="button" class="btn btn-lg btn-outline-default">
                                                    <span class="fal fa-check mr-1"></span>
                                                    Submit
                                                </button>
                                                <button type="button" class="btn btn-lg btn-outline-success">
                                                    <span class="fal fa-download mr-1"></span>
                                                    Download
                                                </button>
                                                <button type="button" class="btn btn-lg btn-outline-warning">
                                                    <span class="fal fa-exclamation-triangle mr-1"></span>
                                                    Scan Device
                                                </button>
                                                <button type="button" class="btn btn-lg btn-outline-info">
                                                    <span class="fal fa-bug mr-1"></span>
                                                    Report Bug
                                                </button>
                                                <button type="button" class="btn btn-lg btn-outline-danger">
                                                    <span class="fal fa-times mr-1"></span>
                                                    Delete
                                                </button>
                                                <button type="button" class="btn btn-lg btn-outline-dark">
                                                    <span class="fal  fa-eject mr-1"></span>
                                                    Eject
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Icon buttons (outline)-->
                                <div id="panel-10" class="panel">
                                    <div class="panel-hdr">
                                        <h2>
                                            Icon <span class="fw-300"><i>Outlined</i></span>
                                        </h2>
                                        <div class="panel-toolbar">
                                            <button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
                                            <button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
                                            <button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
                                        </div>
                                    </div>
                                    <div class="panel-container show">
                                        <div class="panel-content">
                                            <div class="panel-tag">
                                                Convert button to an icon button by adding the class <code>.btn-icon</code>
                                            </div>
                                            <h5 class="frame-heading">
                                                Various sizes
                                            </h5>
                                            <div class="frame-wrap">
                                                <p class="demo">
                                                    <a href="javascript:void(0);" class="btn btn-outline-primary btn-lg btn-icon">
                                                        <i class="fal fa-print"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-secondary btn-lg btn-icon">
                                                        <i class="fal fa-volume-mute fs-md"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-default btn-lg btn-icon">
                                                        <i class="fal fa-check"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-success btn-lg btn-icon">
                                                        <i class="fal fa-download"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-warning btn-lg btn-icon">
                                                        <i class="fal fa-exclamation-triangle"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-info btn-lg btn-icon">
                                                        <i class="fal fa-bug"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-danger btn-lg btn-icon">
                                                        <i class="fal fa-times"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-dark btn-lg btn-icon">
                                                        <i class="fal fa-eject"></i>
                                                    </a>
                                                </p>
                                                <p class="demo">
                                                    <a href="javascript:void(0);" class="btn btn-outline-primary btn-icon">
                                                        <i class="fal fa-print"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-secondary btn-icon">
                                                        <i class="fal fa-volume-mute fs-md"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-default btn-icon">
                                                        <i class="fal fa-check"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-success btn-icon">
                                                        <i class="fal fa-download"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-warning btn-icon">
                                                        <i class="fal fa-exclamation-triangle"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-info btn-icon">
                                                        <i class="fal fa-bug"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-danger btn-icon">
                                                        <i class="fal fa-times"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-dark btn-icon">
                                                        <i class="fal fa-eject"></i>
                                                    </a>
                                                </p>
                                                <p class="demo">
                                                    <a href="javascript:void(0);" class="btn btn-outline-primary btn-sm btn-icon">
                                                        <i class="fal fa-print"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-secondary btn-sm btn-icon">
                                                        <i class="fal fa-volume-mute"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-default btn-sm btn-icon">
                                                        <i class="fal fa-check"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-success btn-sm btn-icon">
                                                        <i class="fal fa-download"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-warning btn-sm btn-icon">
                                                        <i class="fal fa-exclamation-triangle"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-info btn-sm btn-icon">
                                                        <i class="fal fa-bug"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-danger btn-sm btn-icon">
                                                        <i class="fal fa-times"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-dark btn-sm btn-icon">
                                                        <i class="fal fa-eject"></i>
                                                    </a>
                                                </p>
                                                <p class="demo">
                                                    <a href="javascript:void(0);" class="btn btn-outline-primary btn-xs btn-icon">
                                                        <i class="fal fa-print"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-secondary btn-xs btn-icon">
                                                        <i class="fal fa-volume-mute"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-default btn-xs btn-icon">
                                                        <i class="fal fa-check"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-success btn-xs btn-icon">
                                                        <i class="fal fa-download"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-warning btn-xs btn-icon">
                                                        <i class="fal fa-exclamation-triangle"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-info btn-xs btn-icon">
                                                        <i class="fal fa-bug"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-danger btn-xs btn-icon">
                                                        <i class="fal fa-times"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-dark btn-xs btn-icon">
                                                        <i class="fal fa-eject"></i>
                                                    </a>
                                                </p>
                                            </div>
                                            <h5 class="frame-heading">
                                                Rounded outline
                                            </h5>
                                            <div class="frame-wrap">
                                                <p class="demo">
                                                    <a href="javascript:void(0);" class="btn btn-outline-primary btn-lg btn-icon rounded-circle">
                                                        <i class="fal fa-print"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-secondary btn-lg btn-icon rounded-circle">
                                                        <i class="fal fa-volume-mute fs-md"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-default btn-lg btn-icon rounded-circle">
                                                        <i class="fal fa-check"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-success btn-lg btn-icon rounded-circle">
                                                        <i class="fal fa-download"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-warning btn-lg btn-icon rounded-circle">
                                                        <i class="fal fa-exclamation-triangle"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-info btn-lg btn-icon rounded-circle">
                                                        <i class="fal fa-bug"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-danger btn-lg btn-icon rounded-circle">
                                                        <i class="fal fa-times"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-dark btn-lg btn-icon rounded-circle">
                                                        <i class="fal fa-eject"></i>
                                                    </a>
                                                </p>
                                                <p class="demo">
                                                    <a href="javascript:void(0);" class="btn btn-outline-primary btn-icon rounded-circle">
                                                        <i class="fal fa-print"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-secondary btn-icon rounded-circle">
                                                        <i class="fal fa-volume-mute fs-md"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-default btn-icon rounded-circle">
                                                        <i class="fal fa-check"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-success btn-icon rounded-circle">
                                                        <i class="fal fa-download"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-warning btn-icon rounded-circle">
                                                        <i class="fal fa-exclamation-triangle"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-info btn-icon rounded-circle">
                                                        <i class="fal fa-bug"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-danger btn-icon rounded-circle">
                                                        <i class="fal fa-times"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-dark btn-icon rounded-circle">
                                                        <i class="fal fa-eject"></i>
                                                    </a>
                                                </p>
                                                <p class="demo">
                                                    <a href="javascript:void(0);" class="btn btn-outline-primary btn-sm btn-icon rounded-circle">
                                                        <i class="fal fa-print"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-secondary btn-sm btn-icon rounded-circle">
                                                        <i class="fal fa-volume-mute"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-default btn-sm btn-icon rounded-circle">
                                                        <i class="fal fa-check"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-success btn-sm btn-icon rounded-circle">
                                                        <i class="fal fa-download"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-warning btn-sm btn-icon rounded-circle">
                                                        <i class="fal fa-exclamation-triangle"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-info btn-sm btn-icon rounded-circle">
                                                        <i class="fal fa-bug"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-danger btn-sm btn-icon rounded-circle">
                                                        <i class="fal fa-times"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-dark btn-sm btn-icon rounded-circle">
                                                        <i class="fal fa-eject"></i>
                                                    </a>
                                                </p>
                                                <p class="demo">
                                                    <a href="javascript:void(0);" class="btn btn-outline-primary btn-xs btn-icon rounded-circle">
                                                        <i class="fal fa-print"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-secondary btn-xs btn-icon rounded-circle">
                                                        <i class="fal fa-volume-mute"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-default btn-xs btn-icon rounded-circle">
                                                        <i class="fal fa-check"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-success btn-xs btn-icon rounded-circle">
                                                        <i class="fal fa-download"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-warning btn-xs btn-icon rounded-circle">
                                                        <i class="fal fa-exclamation-triangle"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-info btn-xs btn-icon rounded-circle">
                                                        <i class="fal fa-bug"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-danger btn-xs btn-icon rounded-circle">
                                                        <i class="fal fa-times"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-dark btn-xs btn-icon rounded-circle">
                                                        <i class="fal fa-eject"></i>
                                                    </a>
                                                </p>
                                            </div>
                                            <h5 class="frame-heading">
                                                Hover dot effect
                                            </h5>
                                            <div class="frame-wrap">
                                                <p class="demo">
                                                    <a href="javascript:void(0);" class="btn btn-outline-primary btn-lg btn-icon rounded-circle hover-effect-dot">
                                                        <i class="fal fa-print"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-secondary btn-lg btn-icon rounded-circle hover-effect-dot">
                                                        <i class="fal fa-volume-mute fs-md"></i>
                                                    </a>
                                                    <a href="javascript:void(0);" class="btn btn-outline-success btn-lg btn-icon hover-effect-dot">
                                                        <i class="fal fa-download"></i>
                                                    </a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>
                    <!-- this overlay is activated only when mobile menu is triggered -->
                    <div class="page-content-overlay" data-action="toggle" data-class="mobile-nav-on"></div> <!-- END Page Content -->
                    <!-- BEGIN Page Footer -->
                    <footer class="page-footer" role="contentinfo">
                        <div class="d-flex align-items-center flex-1 text-muted">
                            <span class="hidden-md-down fw-700">2019 © SmartAdmin by&nbsp;<a href='https://www.gotbootstrap.com' class='text-primary fw-500' title='gotbootstrap.com' target='_blank'>gotbootstrap.com</a></span>
                        </div>
                        <div>
                            <ul class="list-table m-0">
                                <li><a href="#" class="text-secondary fw-700">About</a></li>
                                <li class="pl-3"><a href="#" class="text-secondary fw-700">License</a></li>
                                <li class="pl-3"><a href="#" class="text-secondary fw-700">Documentation</a></li>
                                <li class="pl-3 fs-xl"><a href="#" class="text-secondary"><i class="fal fa-question-circle" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                    </footer>
                    <!-- END Page Footer -->
                    <!-- BEGIN Shortcuts -->
                    <!-- modal shortcut -->
                    <div class="modal fade modal-backdrop-transparent" id="modal-shortcut" tabindex="-1" role="dialog" aria-labelledby="modal-shortcut" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-top modal-transparent" role="document">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <ul class="app-list w-auto h-auto p-0 text-left">
                                        <li>
                                            <a href="intel_introduction.html" class="app-list-item text-white border-0 m-0">
                                                <div class="icon-stack">
                                                    <i class="base base-7 icon-stack-3x opacity-100 color-primary-500 "></i>
                                                    <i class="base base-7 icon-stack-2x opacity-100 color-primary-300 "></i>
                                                    <i class="fal fa-home icon-stack-1x opacity-100 color-white"></i>
                                                </div>
                                                <span class="app-list-name">
                                                    Home
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="page_inbox.html" class="app-list-item text-white border-0 m-0">
                                                <div class="icon-stack">
                                                    <i class="base base-7 icon-stack-3x opacity-100 color-success-500 "></i>
                                                    <i class="base base-7 icon-stack-2x opacity-100 color-success-300 "></i>
                                                    <i class="ni ni-envelope icon-stack-1x text-white"></i>
                                                </div>
                                                <span class="app-list-name">
                                                    Inbox
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="intel_introduction.html" class="app-list-item text-white border-0 m-0">
                                                <div class="icon-stack">
                                                    <i class="base base-7 icon-stack-2x opacity-100 color-primary-300 "></i>
                                                    <i class="fal fa-plus icon-stack-1x opacity-100 color-white"></i>
                                                </div>
                                                <span class="app-list-name">
                                                    Add More
                                                </span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div> <!-- END Shortcuts -->
                </div>
            </div>
        </div>
        <!-- END Page Wrapper -->
        <!-- BEGIN Quick Menu -->
        <nav class="shortcut-menu hidden-sm-down">
            <input type="checkbox" class="menu-open" name="menu-open" id="menu_open" />
            <label for="menu_open" class="menu-open-button ">
                <span class="app-shortcut-icon d-block"></span>
            </label>
            <a href="#" class="menu-item btn" data-toggle="tooltip" data-placement="left" title="Scroll Top">
                <i class="fal fa-arrow-up"></i>
            </a>
            <a href="page_login-alt.html" class="menu-item btn" data-toggle="tooltip" data-placement="left" title="Logout">
                <i class="fal fa-sign-out"></i>
            </a>
            <a href="#" class="menu-item btn" data-action="app-fullscreen" data-toggle="tooltip" data-placement="left" title="Full Screen">
                <i class="fal fa-expand"></i>
            </a>
            <a href="#" class="menu-item btn" data-action="app-print" data-toggle="tooltip" data-placement="left" title="Print page">
                <i class="fal fa-print"></i>
            </a>
        </nav>
        <!-- END Quick Menu -->
        <!-- BEGIN Messenger -->
        <div class="modal fade js-modal-messenger modal-backdrop-transparent" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-right">
                <div class="modal-content h-100">
                    <div class="dropdown-header bg-trans-gradient d-flex align-items-center w-100">
                        <div class="d-flex flex-row align-items-center mt-1 mb-1 color-white">
                            <span class="mr-2">
                                <span class="rounded-circle profile-image d-block" style="background-image:url('${contextpath}/static/SmartAdmin/img/demo/avatars/avatar-d.png'); background-size: cover;"></span>
                            </span>
                            <div class="info-card-text">
                                <a href="javascript:void(0);" class="fs-lg text-truncate text-truncate-lg text-white" data-toggle="dropdown" aria-expanded="false">
                                    Tracey Chang
                                    <i class="fal fa-angle-down d-inline-block ml-1 text-white fs-md"></i>
                                </a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Send Email</a>
                                    <a class="dropdown-item" href="#">Create Appointment</a>
                                    <a class="dropdown-item" href="#">Block User</a>
                                </div>
                                <span class="text-truncate text-truncate-md opacity-80">IT Director</span>
                            </div>
                        </div>
                        <button type="button" class="close text-white position-absolute pos-top pos-right p-2 m-1 mr-2" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true"><i class="fal fa-times"></i></span>
                        </button>
                    </div>
                    <div class="modal-body p-0 h-100 d-flex">
                        <!-- BEGIN msgr-list -->
                        <div class="msgr-list d-flex flex-column bg-faded border-faded border-top-0 border-right-0 border-bottom-0 position-absolute pos-top pos-bottom">
                            <div>
                                <div class="height-4 width-3 h3 m-0 d-flex justify-content-center flex-column color-primary-500 pl-3 mt-2">
                                    <i class="fal fa-search"></i>
                                </div>
                                <input type="text" class="form-control bg-white" id="msgr_listfilter_input" placeholder="Filter contacts" aria-label="FriendSearch" data-listfilter="#js-msgr-listfilter">
                            </div>
                            <div class="flex-1 h-100 custom-scroll">
                                <div class="w-100">
                                    <ul id="js-msgr-listfilter" class="list-unstyled m-0">
                                        <li>
                                            <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white" data-filter-tags="tracey chang online">
                                                <div class="d-table-cell align-middle status status-success status-sm ">
                                                    <span class="profile-image-md rounded-circle d-block" style="background-image:url('${contextpath}/static/SmartAdmin/img/demo/avatars/avatar-d.png'); background-size: cover;"></span>
                                                </div>
                                                <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                                    <div class="text-truncate text-truncate-md">
                                                        Tracey Chang
                                                        <small class="d-block font-italic text-success fs-xs">
                                                            Online
                                                        </small>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white" data-filter-tags="oliver kopyuv online">
                                                <div class="d-table-cell align-middle status status-success status-sm ">
                                                    <span class="profile-image-md rounded-circle d-block" style="background-image:url('${contextpath}/static/SmartAdmin/img/demo/avatars/avatar-b.png'); background-size: cover;"></span>
                                                </div>
                                                <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                                    <div class="text-truncate text-truncate-md">
                                                        Oliver Kopyuv
                                                        <small class="d-block font-italic text-success fs-xs">
                                                            Online
                                                        </small>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white" data-filter-tags="dr john cook phd away">
                                                <div class="d-table-cell align-middle status status-warning status-sm ">
                                                    <span class="profile-image-md rounded-circle d-block" style="background-image:url('${contextpath}/static/SmartAdmin/img/demo/avatars/avatar-e.png'); background-size: cover;"></span>
                                                </div>
                                                <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                                    <div class="text-truncate text-truncate-md">
                                                        Dr. John Cook PhD
                                                        <small class="d-block font-italic fs-xs">
                                                            Away
                                                        </small>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white" data-filter-tags="ali amdaney online">
                                                <div class="d-table-cell align-middle status status-success status-sm ">
                                                    <span class="profile-image-md rounded-circle d-block" style="background-image:url('${contextpath}/static/SmartAdmin/img/demo/avatars/avatar-g.png'); background-size: cover;"></span>
                                                </div>
                                                <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                                    <div class="text-truncate text-truncate-md">
                                                        Ali Amdaney
                                                        <small class="d-block font-italic fs-xs text-success">
                                                            Online
                                                        </small>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white" data-filter-tags="sarah mcbrook online">
                                                <div class="d-table-cell align-middle status status-success status-sm">
                                                    <span class="profile-image-md rounded-circle d-block" style="background-image:url('${contextpath}/static/SmartAdmin/img/demo/avatars/avatar-h.png'); background-size: cover;"></span>
                                                </div>
                                                <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                                    <div class="text-truncate text-truncate-md">
                                                        Sarah McBrook
                                                        <small class="d-block font-italic fs-xs text-success">
                                                            Online
                                                        </small>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white" data-filter-tags="ali amdaney offline">
                                                <div class="d-table-cell align-middle status status-sm">
                                                    <span class="profile-image-md rounded-circle d-block" style="background-image:url('${contextpath}/static/SmartAdmin/img/demo/avatars/avatar-a.png'); background-size: cover;"></span>
                                                </div>
                                                <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                                    <div class="text-truncate text-truncate-md">
                                                        oliver.kopyuv@gotbootstrap.com
                                                        <small class="d-block font-italic fs-xs">
                                                            Offline
                                                        </small>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white" data-filter-tags="ali amdaney busy">
                                                <div class="d-table-cell align-middle status status-danger status-sm">
                                                    <span class="profile-image-md rounded-circle d-block" style="background-image:url('${contextpath}/static/SmartAdmin/img/demo/avatars/avatar-j.png'); background-size: cover;"></span>
                                                </div>
                                                <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                                    <div class="text-truncate text-truncate-md">
                                                        oliver.kopyuv@gotbootstrap.com
                                                        <small class="d-block font-italic fs-xs text-danger">
                                                            Busy
                                                        </small>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white" data-filter-tags="ali amdaney offline">
                                                <div class="d-table-cell align-middle status status-sm">
                                                    <span class="profile-image-md rounded-circle d-block" style="background-image:url('${contextpath}/static/SmartAdmin/img/demo/avatars/avatar-c.png'); background-size: cover;"></span>
                                                </div>
                                                <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                                    <div class="text-truncate text-truncate-md">
                                                        oliver.kopyuv@gotbootstrap.com
                                                        <small class="d-block font-italic fs-xs">
                                                            Offline
                                                        </small>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" class="d-table w-100 px-2 py-2 text-dark hover-white" data-filter-tags="ali amdaney inactive">
                                                <div class="d-table-cell align-middle">
                                                    <span class="profile-image-md rounded-circle d-block" style="background-image:url('${contextpath}/static/SmartAdmin/img/demo/avatars/avatar-m.png'); background-size: cover;"></span>
                                                </div>
                                                <div class="d-table-cell w-100 align-middle pl-2 pr-2">
                                                    <div class="text-truncate text-truncate-md">
                                                        +714651347790
                                                        <small class="d-block font-italic fs-xs opacity-50">
                                                            Missed Call
                                                        </small>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                    <div class="filter-message js-filter-message"></div>
                                </div>
                            </div>
                            <div>
                                <a class="fs-xl d-flex align-items-center p-3">
                                    <i class="fal fa-cogs"></i>
                                </a>
                            </div>
                        </div>
                        <!-- END msgr-list -->
                        <!-- BEGIN msgr -->
                        <div class="msgr d-flex h-100 flex-column bg-white">
                            <!-- BEGIN custom-scroll -->
                            <div class="custom-scroll flex-1 h-100">
                                <div id="chat_container" class="w-100 p-4">
                                    <!-- start .chat-segment -->
                                    <div class="chat-segment">
                                        <div class="time-stamp text-center mb-2 fw-400">
                                            Jun 19
                                        </div>
                                    </div>
                                    <!--  end .chat-segment -->
                                    <!-- start .chat-segment -->
                                    <div class="chat-segment chat-segment-sent">
                                        <div class="chat-message">
                                            <p>
                                                Hey Ching, did you get my files?
                                            </p>
                                        </div>
                                        <div class="text-right fw-300 text-muted mt-1 fs-xs">
                                            3:00 pm
                                        </div>
                                    </div>
                                    <!--  end .chat-segment -->
                                    <!-- start .chat-segment -->
                                    <div class="chat-segment chat-segment-get">
                                        <div class="chat-message">
                                            <p>
                                                Hi
                                            </p>
                                            <p>
                                                Sorry going through a busy time in office. Yes I analyzed the solution.
                                            </p>
                                            <p>
                                                It will require some resource, which I could not manage.
                                            </p>
                                        </div>
                                        <div class="fw-300 text-muted mt-1 fs-xs">
                                            3:24 pm
                                        </div>
                                    </div>
                                    <!--  end .chat-segment -->
                                    <!-- start .chat-segment -->
                                    <div class="chat-segment chat-segment-sent chat-start">
                                        <div class="chat-message">
                                            <p>
                                                Okay
                                            </p>
                                        </div>
                                    </div>
                                    <!--  end .chat-segment -->
                                    <!-- start .chat-segment -->
                                    <div class="chat-segment chat-segment-sent chat-end">
                                        <div class="chat-message">
                                            <p>
                                                Sending you some dough today, you can allocate the resources to this project.
                                            </p>
                                        </div>
                                        <div class="text-right fw-300 text-muted mt-1 fs-xs">
                                            3:26 pm
                                        </div>
                                    </div>
                                    <!--  end .chat-segment -->
                                    <!-- start .chat-segment -->
                                    <div class="chat-segment chat-segment-get chat-start">
                                        <div class="chat-message">
                                            <p>
                                                Perfect. Thanks a lot!
                                            </p>
                                        </div>
                                    </div>
                                    <!--  end .chat-segment -->
                                    <!-- start .chat-segment -->
                                    <div class="chat-segment chat-segment-get">
                                        <div class="chat-message">
                                            <p>
                                                I will have them ready by tonight.
                                            </p>
                                        </div>
                                    </div>
                                    <!--  end .chat-segment -->
                                    <!-- start .chat-segment -->
                                    <div class="chat-segment chat-segment-get chat-end">
                                        <div class="chat-message">
                                            <p>
                                                Cheers
                                            </p>
                                        </div>
                                    </div>
                                    <!--  end .chat-segment -->
                                    <!-- start .chat-segment for timestamp -->
                                    <div class="chat-segment">
                                        <div class="time-stamp text-center mb-2 fw-400">
                                            Jun 20
                                        </div>
                                    </div>
                                    <!--  end .chat-segment for timestamp -->
                                </div>
                            </div>
                            <!-- END custom-scroll  -->
                            <!-- BEGIN msgr__chatinput -->
                            <div class="d-flex flex-column">
                                <div class="border-faded border-right-0 border-bottom-0 border-left-0 flex-1 mr-3 ml-3 position-relative shadow-top">
                                    <div class="pt-3 pb-1 pr-0 pl-0 rounded-0" tabindex="-1">
                                        <div id="msgr_input" contenteditable="true" data-placeholder="Type your message here..." class="height-10 form-content-editable"></div>
                                    </div>
                                </div>
                                <div class="height-8 px-3 d-flex flex-row align-items-center flex-wrap flex-shrink-0">
                                    <a href="javascript:void(0);" class="btn btn-icon fs-xl width-1 mr-1" data-toggle="tooltip" data-original-title="More options" data-placement="top">
                                        <i class="fal fa-ellipsis-v-alt color-fusion-300"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-icon fs-xl mr-1" data-toggle="tooltip" data-original-title="Attach files" data-placement="top">
                                        <i class="fal fa-paperclip color-fusion-300"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-icon fs-xl mr-1" data-toggle="tooltip" data-original-title="Insert photo" data-placement="top">
                                        <i class="fal fa-camera color-fusion-300"></i>
                                    </a>
                                    <div class="ml-auto">
                                        <a href="javascript:void(0);" class="btn btn-info">Send</a>
                                    </div>
                                </div>
                            </div>
                            <!-- END msgr__chatinput -->
                        </div>
                        <!-- END msgr -->
                    </div>
                </div>
            </div>
        </div> <!-- END Messenger -->
        <!-- BEGIN Page Settings -->
        <div class="modal fade js-modal-settings modal-backdrop-transparent" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-right modal-md">
                <div class="modal-content">
                    <div class="dropdown-header bg-trans-gradient d-flex justify-content-center align-items-center w-100">
                        <h4 class="m-0 text-center color-white">
                            Layout Settings
                            <small class="mb-0 opacity-80">User Interface Settings</small>
                        </h4>
                        <button type="button" class="close text-white position-absolute pos-top pos-right p-2 m-1 mr-2" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true"><i class="fal fa-times"></i></span>
                        </button>
                    </div>
                    <div class="modal-body p-0">
                        <div class="settings-panel">
                            <div class="mt-4 d-table w-100 px-5">
                                <div class="d-table-cell align-middle">
                                    <h5 class="p-0">
                                        App Layout
                                    </h5>
                                </div>
                            </div>
                            <div class="list" id="fh">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="header-function-fixed"></a>
                                <span class="onoffswitch-title">Fixed Header</span>
                                <span class="onoffswitch-title-desc">header is in a fixed at all times</span>
                            </div>
                            <div class="list" id="nff">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="nav-function-fixed"></a>
                                <span class="onoffswitch-title">Fixed Navigation</span>
                                <span class="onoffswitch-title-desc">left panel is fixed</span>
                            </div>
                            <div class="list" id="nfm">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="nav-function-minify"></a>
                                <span class="onoffswitch-title">Minify Navigation</span>
                                <span class="onoffswitch-title-desc">Skew nav to maximize space</span>
                            </div>
                            <div class="list" id="nfh">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="nav-function-hidden"></a>
                                <span class="onoffswitch-title">Hide Navigation</span>
                                <span class="onoffswitch-title-desc">roll mouse on edge to reveal</span>
                            </div>
                            <div class="list" id="nft">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="nav-function-top"></a>
                                <span class="onoffswitch-title">Top Navigation</span>
                                <span class="onoffswitch-title-desc">Relocate left pane to top</span>
                            </div>
                            <div class="list" id="mmb">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-main-boxed"></a>
                                <span class="onoffswitch-title">Boxed Layout</span>
                                <span class="onoffswitch-title-desc">Encapsulates to a container</span>
                            </div>
                            <div class="expanded">
                                <ul class="">
                                    <li>
                                        <div class="bg-fusion-50" data-action="toggle" data-class="mod-bg-1"></div>
                                    </li>
                                    <li>
                                        <div class="bg-warning-200" data-action="toggle" data-class="mod-bg-2"></div>
                                    </li>
                                    <li>
                                        <div class="bg-primary-200" data-action="toggle" data-class="mod-bg-3"></div>
                                    </li>
                                    <li>
                                        <div class="bg-success-300" data-action="toggle" data-class="mod-bg-4"></div>
                                    </li>
                                </ul>
                                <div class="list" id="mbgf">
                                    <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-fixed-bg"></a>
                                    <span class="onoffswitch-title">Fixed Background</span>
                                </div>
                            </div>
                            <div class="mt-4 d-table w-100 px-5">
                                <div class="d-table-cell align-middle">
                                    <h5 class="p-0">
                                        Mobile Menu
                                    </h5>
                                </div>
                            </div>
                            <div class="list" id="nmp">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="nav-mobile-push"></a>
                                <span class="onoffswitch-title">Push Content</span>
                                <span class="onoffswitch-title-desc">Content pushed on menu reveal</span>
                            </div>
                            <div class="list" id="nmno">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="nav-mobile-no-overlay"></a>
                                <span class="onoffswitch-title">No Overlay</span>
                                <span class="onoffswitch-title-desc">Removes mesh on menu reveal</span>
                            </div>
                            <div class="list" id="sldo">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="nav-mobile-slide-out"></a>
                                <span class="onoffswitch-title">Off-Canvas <sup>(beta)</sup></span>
                                <span class="onoffswitch-title-desc">Content overlaps menu</span>
                            </div>
                            <div class="mt-4 d-table w-100 px-5">
                                <div class="d-table-cell align-middle">
                                    <h5 class="p-0">
                                        Accessibility
                                    </h5>
                                </div>
                            </div>
                            <div class="list" id="mbf">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-bigger-font"></a>
                                <span class="onoffswitch-title">Bigger Content Font</span>
                                <span class="onoffswitch-title-desc">content fonts are bigger for readability</span>
                            </div>
                            <div class="list" id="mhc">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-high-contrast"></a>
                                <span class="onoffswitch-title">High Contrast Text (WCAG 2 AA)</span>
                                <span class="onoffswitch-title-desc">4.5:1 text contrast ratio</span>
                            </div>
                            <div class="list" id="mcb">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-color-blind"></a>
                                <span class="onoffswitch-title">Daltonism <sup>(beta)</sup> </span>
                                <span class="onoffswitch-title-desc">color vision deficiency</span>
                            </div>
                            <div class="list" id="mpc">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-pace-custom"></a>
                                <span class="onoffswitch-title">Preloader Inside</span>
                                <span class="onoffswitch-title-desc">preloader will be inside content</span>
                            </div>
                            <div class="mt-4 d-table w-100 px-5">
                                <div class="d-table-cell align-middle">
                                    <h5 class="p-0">
                                        Global Modifications
                                    </h5>
                                </div>
                            </div>
                            <div class="list" id="mcbg">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-clean-page-bg"></a>
                                <span class="onoffswitch-title">Clean Page Background</span>
                                <span class="onoffswitch-title-desc">adds more whitespace</span>
                            </div>
                            <div class="list" id="mhni">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-hide-nav-icons"></a>
                                <span class="onoffswitch-title">Hide Navigation Icons</span>
                                <span class="onoffswitch-title-desc">invisible navigation icons</span>
                            </div>
                            <div class="list" id="dan">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-disable-animation"></a>
                                <span class="onoffswitch-title">Disable CSS Animation</span>
                                <span class="onoffswitch-title-desc">Disables CSS based animations</span>
                            </div>
                            <div class="list" id="mhic">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-hide-info-card"></a>
                                <span class="onoffswitch-title">Hide Info Card</span>
                                <span class="onoffswitch-title-desc">Hides info card from left panel</span>
                            </div>
                            <div class="list" id="mlph">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-lean-subheader"></a>
                                <span class="onoffswitch-title">Lean Subheader</span>
                                <span class="onoffswitch-title-desc">distinguished page header</span>
                            </div>
                            <div class="list" id="mnl">
                                <a href="#" onclick="return false;" class="btn btn-switch" data-action="toggle" data-class="mod-nav-link"></a>
                                <span class="onoffswitch-title">Hierarchical Navigation</span>
                                <span class="onoffswitch-title-desc">Clear breakdown of nav links</span>
                            </div>
                            <div class="list mt-3">
                                <span class="onoffswitch-title">Global Font Size <small>(RESETS ON REFRESH)</small> </span>
                                <div class="btn-group btn-group-sm btn-group-toggle my-2" data-toggle="buttons">
                                    <label class="btn btn-default btn-sm" data-action="toggle-swap" data-class="root-text-sm" data-target="html">
                                        <input type="radio" name="changeFrontSize"> SM
                                    </label>
                                    <label class="btn btn-default btn-sm" data-action="toggle-swap" data-class="root-text" data-target="html">
                                        <input type="radio" name="changeFrontSize" checked=""> MD
                                    </label>
                                    <label class="btn btn-default btn-sm" data-action="toggle-swap" data-class="root-text-lg" data-target="html">
                                        <input type="radio" name="changeFrontSize"> LG
                                    </label>
                                    <label class="btn btn-default btn-sm" data-action="toggle-swap" data-class="root-text-xl" data-target="html">
                                        <input type="radio" name="changeFrontSize"> XL
                                    </label>
                                </div>
                                <span class="onoffswitch-title-desc d-block mb-g">Change <strong>root</strong> font size to effect rem values</span>
                            </div>
                            <hr class="m-0">
                            <div class="p-3 d-flex align-items-center justify-content-center bg-faded">
                                <a href="#" class="btn btn-outline-danger fw-500 mr-2" data-action="app-reset">Reset Settings</a>
                                <a href="#" class="btn btn-danger fw-500" data-action="factory-reset">Factory Reset</a>
                            </div>
                        </div>
                        <span id="saving"></span>
                    </div>
                </div>
            </div>
        </div> <!-- END Page Settings -->
        <!-- base vendor bundle: 
			 DOC: if you remove pace.js from core please note on Internet Explorer some CSS animations may execute before a page is fully loaded, resulting 'jump' animations 
						+ pace.js (recommended)
						+ jquery.js (core)
						+ jquery-ui-cust.js (core)
						+ popper.js (core)
						+ bootstrap.js (core)
						+ slimscroll.js (extension)
						+ app.navigation.js (core)
						+ ba-throttle-debounce.js (core)
						+ waves.js (extension)
						+ smartpanels.js (extension)
						+ src/../jquery-snippets.js (core) -->
        <script src="${contextpath}/static/SmartAdmin/js/vendors.bundle.js"></script>
		<script src="${contextpath}/static/SmartAdmin/js/app.bundle.js"></script>
    </body>
</html>
