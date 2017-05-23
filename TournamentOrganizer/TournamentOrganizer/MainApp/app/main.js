
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

        //Angular
        'ocLazyLoad':'scripts/angular/ocLazyLoad/ocLazyLoad.min',
        'angular-local-storage': 'scripts/angular/angular_Local_Storage/angular-local-storage.min',

        //Application Js
        'app': 'app/app',
        'authenticate': 'app/shared/authenticate',
        'commonService': 'app/shared/commonService',

        'LoginController': 'app/LoggedOut/login/LoginController'
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
        'ui-router': { deps: ['angular'] },
        'ocLazyLoad': { deps: ['angular'] },
        'angular-local-storage': { deps: ['angular'] },
        /*******************************************************/
        /***    Application controller, services and Filter  ***/
        /*******************************************************/
        'app': {
            deps:
                [
                    'ocLazyLoad',
                    'ui-router',
                    'semantic-ui',
                    'angular-local-storage'
                ]
        },

        'authenticate': {
            deps: ['commonService']
        },
        'commonService': {
            deps: ['app']
        }

    },
    deps: ['app']
});

require(['authenticate'], function () {
    angular.bootstrap(document, ['tournamentOrganiser']);
});