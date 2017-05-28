
// contents of main:
require.config({
    urlArgs: function (id, url) {
        return (url.indexOf('?') === -1 ? '?' : '&') + "bust=" + (new Date()).getTime();
    },
    cacheSuffix: ".cacheSuffix",
    baseUrl: 'MainApp',
    waitSeconds: 0,
    paths: {
        'jquery': 'scripts/Jquery/jquery.min',
        'angular': 'scripts/angular/angular.min',
        'ui-router': 'scripts/angular/ui-router/angular-ui-router.min',
        'semantic-ui': 'scripts/Jquery/Sementic-ui/semantic.min',
        'jquery_orgchart': 'scripts/Jquery/OrgChart/js/jquery.orgchart',
        'angular_orgchart': 'scripts/angular/OrgChart/angular_orgchart',

        //Angular
        'ocLazyLoad':'scripts/angular/ocLazyLoad/ocLazyLoad.min',
        'angular-local-storage': 'scripts/angular/angular_Local_Storage/angular-local-storage.min',
        'angular_ui_notification': 'scripts/angular/angular_ui_notification/angular-ui-notification.min',
        'angular_validation_rule': 'scripts/angular/angular-validation/angular-validation-rule',
        'angular_validation': 'scripts/angular/angular-validation/angular-validation',

        // semantic
        'semantic_transition': 'assets/Sementic-ui/components/transition.min',
        'semantic_dropdown': 'assets/Sementic-ui/components/dropdown.min',
        'semantic_visibility': 'assets/Sementic-ui/components/visibility.min',

        //Application Js
        'app': 'app/app',
        'authenticate': 'app/shared/authenticate',
        'commonService': 'app/shared/commonService',

        'LoginController': 'app/LoggedOut/login/LoginController',
        'commonDirective': 'app/shared/commonDirective',
        'uDashController': 'app/LoggedIn/users/dashboard/DashboardController',
        'uDashService': 'app/LoggedIn/users/dashboard/DashboardService',
        'loggedInController': 'app/LoggedIn/LoggedInController'
    },

    // Mention the dependencies
    shim: {
        'angular': {
            exports: 'angular'
        },
        'jquery': {
            exports: "$"
        },

        'semantic-ui': {
            deps: ['jquery']
        },

        //'':{deps:['']},
        'jquery_orgchart':{deps:['jquery']},
        'angular_orgchart':{deps:['angular','jquery_orgchart']},

        'ui-router': { deps: ['angular'] },
        'ocLazyLoad': { deps: ['angular'] },
        'angular_ui_notification': { deps: ['angular'] },
        'angular-local-storage': { deps: ['angular'] },
        'angular_validation':{deps:['angular']},
        'angular_validation_rule':{deps:['angular_validation']},

        //Semantic deps
        'semantic_transition': {
            deps: ['jquery']
        },
        'semantic_dropdown': {
            deps: ['jquery']
        },
        'semantic_visibility': {
            deps: ['jquery']
        },

        /*******************************************************/
        /***    Application controller, services and Filter  ***/
        /*******************************************************/

        'uDashService': { deps: ['loggedInController'] },
        'uDashController': { deps: ['uDashService','angular_orgchart'] },
        'app': {
            deps:
                [
                    'angular_ui_notification',
                    'ocLazyLoad',
                    'ui-router',
                    'semantic-ui',
                    'angular-local-storage'
                    , 'angular_validation_rule'
                ]
        },
        'loggedInController': {
            deps: ['semantic_transition',
                'semantic_dropdown',
                'semantic_visibility',
                'authenticate']
        },
        'authenticate': {
            deps: ['commonService']
        },
        'commonService': {
            deps: ['app']
        },
        'commonDirective':{
            deps: ['authenticate']
        }
    },
    deps: ['app']
});

require(['commonDirective'], function () {
    angular.bootstrap(document, ['tournamentOrganiser']);
});