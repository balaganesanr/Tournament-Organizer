/// <reference path="LoggedOut/_LoggedOutLayout.html" />

define(['require'], function (require) {

    //angular.module('tournamentOrganiser', ['ui.router', 'LocalStorageModule',]);
    var tournamentOrganiser = angular.module('tournamentOrganiser',
                                ['ui.router',
                                 'LocalStorageModule',
                                 'oc.lazyLoad']);

    tournamentOrganiser.factory('apiLoader', [function () {
        return {
            apiLoaderCommon: { spinner: null, target: null, spinning: false, spinningCount: 0 },
            options: {
                lines: 13 // The number of lines to draw
                , length: 28 // The length of each line
                , width: 14 // The line thickness
                , radius: 42 // The radius of the inner circle
                , scale: 0.25 // Scales overall size of the spinner
                , corners: 1 // Corner roundness (0..1)
                , color: '#000' // #rgb or #rrggbb or array of colors
                , opacity: 0.25 // Opacity of the lines
                , rotate: 0 // The rotation offset
                , direction: -1 // 1: clockwise, -1: counterclockwise
                , speed: 1.8 // Rounds per second
                , trail: 60 // Afterglow percentage
                , className: 'api-loader-overlay-spinner' // The CSS class to assign to the spinner
            },
            start: function () { },
            stop: function () { }
        }
    }]).directive('apiLoader', ['apiLoader', '$timeout', function (apiLoader, $timeout) {
        return {
            link: function (scope, $element, attrs, ngModel) {

                //apiLoader.apiLoaderCommon = { spinner: null, target: null, spinning: false, spinningCount: 0 };
                require(['spin_js'], function (Spinner) { // <= here!
                    var overlayElement = $("<div class='api-loader-overlay'>");
                    apiLoader.apiLoaderCommon.target = document.getElementById(attrs.apiLoader);
                    apiLoader.apiLoaderCommon.spinner = new Spinner(apiLoader.options);
                    var customSpinner = null;
                    apiLoader.start = start;
                    apiLoader.stop = stop;

                    function start(opt) {
                        if (!apiLoader.apiLoaderCommon.spinning && apiLoader.apiLoaderCommon.spinner) {
                            apiLoader.apiLoaderCommon.spinner.spin(apiLoader.apiLoaderCommon.target);
                            $(apiLoader.apiLoaderCommon.target).append(overlayElement);
                            apiLoader.apiLoaderCommon.spinning = true;
                            if (apiLoader.apiLoaderCommon.spinner && apiLoader.apiLoaderCommon.spinner.el)
                                apiLoader.apiLoaderCommon.spinner.el.className = apiLoader.apiLoaderCommon.spinner.el.className.replace(/(?:^|\s)hide(?!\S)/g, '');
                        }
                        apiLoader.apiLoaderCommon.spinningCount++;

                    }
                    function stop() {
                        if (apiLoader.apiLoaderCommon.spinningCount <= 1 && apiLoader.apiLoaderCommon.spinning && apiLoader.apiLoaderCommon.spinner) {
                            if (customSpinner != null)
                                customSpinner.stop();

                            if (apiLoader.apiLoaderCommon.spinner && apiLoader.apiLoaderCommon.spinner.el) {
                                apiLoader.apiLoaderCommon.spinner.el.className = " hide";
                            }
                            else
                                $(apiLoader.apiLoaderCommon.target).find('.api-loader-overlay-spinner').addClass('hide');


                            apiLoader.apiLoaderCommon.spinner.stop();
                            $(apiLoader.apiLoaderCommon.target).find('.api-loader-overlay').remove();
                            apiLoader.apiLoaderCommon.spinning = false;
                            apiLoader.apiLoaderCommon.spinningCount = 0;

                        }
                        else if (apiLoader.apiLoaderCommon.spinningCount > 1)
                            apiLoader.apiLoaderCommon.spinningCount--;
                    }
                });
            }
        };
    }]);

    tournamentOrganiser.constant('Enum', {
        clientId: "tournamentOrganiser",
        Role: {
            "User": 2,
            "Admin": 1
        },
        Gender: {
            "MALE": 1,
            "FEMALE": 2
        },
        Permission: {
            any: 'any',
            user: 'user',
            admin: 'admin'
        }
    });

    tournamentOrganiser.config(['$locationProvider', '$filterProvider', '$ocLazyLoadProvider', '$compileProvider', '$httpProvider', '$controllerProvider', '$provide', '$stateProvider', '$urlRouterProvider',
    function ($locationProvider, $filterProvider, $ocLazyLoadProvider, $compileProvider, $httpProvider, $controllerProvider, $provide, $stateProvider, $urlRouterProvider) {
        $locationProvider.hashPrefix('');
        var version = (new Date()).getTime();
        tournamentOrganiser.registerController = $controllerProvider.register;
        tournamentOrganiser.$register = $provide;
        tournamentOrganiser.$compileProvider = $compileProvider;
        tournamentOrganiser.$filterProvider = $filterProvider;

        $urlRouterProvider.otherwise(function ($injector) {
            debugger
            var $state = $injector.get('$state');
            var authService = $injector.get('authService');

            if (!authService.IsAuthenticated())
                $state.go('app.login');
            else
                $state.go('home.dashboard');
        });

        // when there is a parent-home route itslef, redirect to home dashboard   
        $urlRouterProvider.when('/home', '/home/dashboard');
        // when there is a parent-app route itself, redirect to app login
        $urlRouterProvider.when('/app', '/app/login');

        // You can also use regex for the match parameter
        //$urlRouterProvider.when(/aspx/i, '/index');

        // ui router
        $stateProvider
         // Logged out pages
        .state('app', {
            url: '/app',
            authenticate: false,
            permission: { val: ['any'] },
            views: {
                "ParentView": {
                    templateUrl: 'MainApp/app/LoggedOut/_LoggedOutLayout.html?v=' + version
                }
            },

        }).state('app.login', {
            url: '/login',
            controller: 'LoginController',
            templateUrl: 'MainApp/app/LoggedOut/login/_login.html?v=' + version,
            authenticate: false,
            permission: { val: ['any'] },
            resolve: {
                loadMyFiles: ['$ocLazyLoad', '$q', function ($ocLazyLoad, $q) {
                    debugger
                    var deferred = $q.defer();
                    require(["LoginController"], function () {
                        deferred.resolve();
                    });
                    return deferred.promise;
                }]
            }
        })
        // Logged in pages
        .state('home', {
            url: '/home',
            authenticate: true,
            views: {
                "ParentView": {
                    controller: 'LoggedInContrller',
                    templateUrl: 'App_Dapresy/App/LoggedInPages/_LoggedInLayout.html?v=' + version,
                    resolve: {
                        loadMyFiles: ['$ocLazyLoad', '$q', function ($ocLazyLoad, $q) {
                            var deferred = $q.defer();
                            $ocLazyLoad.load([
                                'App_Dapresy/assets/layout/landing-layout.css',
                                'App_Dapresy/assets/helper/helper-pad-mrg.css',
                                'App_Dapresy/scripts/angular/ng-sortable/ng-sortable.min.css'
                                                   , 'App_Dapresy/scripts/JQuery/Jquery-Ui/jquery-ui.min.css'
                                                , 'App_Dapresy/assets/helper/helper-pad-mrg-needed.css']);


                            require(["LoggedInController"], function () {
                                try {
                                    var $injectResult = $ocLazyLoad.inject(['ngDragDrop', 'ui.sortable']);
                                    $injectResult.catch(function (ex) {
                                        deferred.reject(ex);
                                    });
                                    $injectResult.then(function (ex) {
                                        deferred.resolve();
                                    });
                                }
                                catch (ex) {
                                    deferred.reject(ex);
                                }

                            });

                            return deferred.promise;
                        }]
                    }

                }
            }
        }).state('home.dashboard', {
            url: '/dashboard',
            authenticate: true,
            templateUrl: 'App_Dapresy/App/LoggedInPages/Dashboard/_Dashboard.html?v=' + version,
            controller: 'dashboardController as vm',
            resolve: {
                loadMyFiles: ['$ocLazyLoad', '$q', "$injector", function ($ocLazyLoad, $q, $injector) {
                    $ocLazyLoad.load(['App_Dapresy/assets/page-css/dashboard.css?v=' + version]);

                    var deferred = $q.defer();
                    require(["dashController"], function () {
                        //angularMoment
                        var $injectResult2 = $ocLazyLoad.inject(['angularMoment', 'infinite-scroll']);

                        $injectResult2.catch(function (ex) {
                            deferred.reject(ex);
                        });
                        $injectResult2.then(function (ex) {
                            deferred.resolve();
                        });
                        //deferred.resolve();
                    });
                    return deferred.promise;
                }]
            }

        });

        $httpProvider.interceptors.push(['$rootScope', '$q', '$location', 'localStorageService', '$injector', function ($rootScope, $q, $location, localStorageService, $injector) {
            return {
                request: function (config) {

                    config.headers = config.headers || {};
                    var authData = localStorageService.get('authorizationData');
                    if (authData) {
                        config.headers.Authorization = 'Bearer ' + authData.token;
                    }
                    //if (config.url.match(/^\/api\/.*/) || config.url.match(/^\/token.*/)) {
                    //    var apiLoader = null;
                    //    try {
                    //        var apiLoader = $injector.get('apiLoader');

                    //        if (apiLoader)
                    //            apiLoader.start();
                    //    }
                    //    catch (ex) {
                    //        if (apiLoader)
                    //            apiLoader.stop();
                    //    }
                    //}

                    return config;
                },

                response: function (result) {
                    result = result || {};
                    result.resultSuccess = true;
                    var apiLoader = null;
                    //try {
                    //    var apiLoader = $injector.get('apiLoader');

                    //    if (apiLoader)
                    //        apiLoader.stop();
                    //}
                    //catch (ex) {
                    //}
                    return result;
                },

                responseError: function (rejection) {
                    //var apiLoader = null;
                    //try {
                    //    var apiLoader = $injector.get('apiLoader');

                    //    if (apiLoader)
                    //        apiLoader.stop();
                    //}
                    //catch (ex) {
                    //}
                    rejection = rejection || {};
                    rejection.resultError = true;
                    console.log('Failed with', rejection.status, 'status');

                    //if (rejection.status == 503) {
                    //    location.reload();
                    //}

                    //if (rejection.status == 401) {
                    //    localStorageService.remove('authorizationData');
                    //    window.location.replace(window.location.origin)
                    //}

                    //if (rejection.status == 307) {
                    //    $location.url('/SessionExpired');
                    //}

                    //if (rejection.status == 403) {
                    //    $location.url('/Forbidden');
                    //}

                    //if (rejection.status == 500) {
                    //    $location.url('/InternalServerError');
                    //}
                    // $('#loading').fadeOut(400, "linear");
                    return $q.reject(rejection);
                }
            }
        }]);
    }]);


    tournamentOrganiser.run(
       ['$rootScope', 'authService', '$state', '$timeout', 'appServices',
       function ($rootScope, authService, $state, $timeout, appServices) {
           $rootScope.version = (new Date()).getTime();

           $rootScope.$on('$stateChangeStart', function (event, toState, toParams, fromState, fromParams) {
               //if (toState.name == "app.ActivateInvitedUser" && authService.IsAuthenticated())
               //    authService.logOut();

               //if (toState.authenticate && !authService.IsAuthenticated()) {
               //    event.preventDefault();
               //    if ($timeout) {

               //        var timeoutCancel;
               //        $timeout.cancel(timeoutCancel);
               //        timeoutCancel = $timeout(function () {
               //            $rootScope.IsPageLoading = null;
               //        }, 500);
               //    }
               //    authService.logOut();
               //    $state.go('app.login');
               //}

               //if (!toState.authenticate && authService.IsAuthenticated()) {

               //    event.preventDefault();
               //    if ($timeout) {

               //        var timeoutCancel;
               //        $timeout.cancel(timeoutCancel);
               //        timeoutCancel = $timeout(function () {

               //            $rootScope.IsPageLoading = null;
               //        }, 500);
               //    }
               //    $state.go('home.dashboard');
               //}

           });
           $rootScope.$on('$stateChangeSuccess', function (event, toState, toParams, fromState, fromParams) {
           });

           $rootScope.$on('$stateChangeError',
            function (event, toState, toParams, fromState, fromParams, error) {
                debugger
            });
       }]);

    //function configureTemplateFactory($provide) {
    //    var version = (new Date()).getTime();

    //    function templateFactoryDecorator($delegate) {
    //        var fromUrl = angular.bind($delegate, $delegate.fromUrl);
    //        $delegate.fromUrl = function (url, params) {
    //            if (url !== null && angular.isDefined(url) && angular.isString(url)) {
    //                url += (url.indexOf("?") === -1 ? "?" : "&");
    //                url += "bust=" + version;
    //            }
    //            return fromUrl(url, params);
    //        };
    //        return $delegate;
    //    }

    //    $provide.decorator('$templateFactory', ['$delegate', templateFactoryDecorator]);
    //}
    //tournamentOrganiser.config(['$provide', configureTemplateFactory]);

    //tournamentOrganiser.config(['$routeProvider', '$provide', function ($routeProvider, $provide) {
    //    $provide.decorator('$http', [
    //        '$delegate', function ($delegate) {
    //            var get = $delegate.get;
    //            $delegate.get = function (url, config) {

    //                return get(url, config);
    //            };
    //            return $delegate;
    //        }
    //    ]);
    //}]);
})
