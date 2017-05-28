/// <reference path="LoggedIn/_LoggedInLayout.html" />
/// <reference path="LoggedOut/_LoggedOutLayout.html" />

define(['require'], function (require) {

    //angular.module('tournamentOrganiser', ['ui.router', 'LocalStorageModule',]);
    var tournamentOrganiser = angular.module('tournamentOrganiser',
                                ['ui.router',
                                 'LocalStorageModule',
                                 'oc.lazyLoad',
                                'ui-notification'
                                ,'validation', 'validation.rule',]);

    tournamentOrganiser.constant('Enum', {
        clientId: "tournamentOrganiser",
        MessageType: {
            "INFO": 'info',
            "SUCCESS": 'success',
            "ERROR": "error",
            "WARNING": "warning"
        },
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

    tournamentOrganiser.config(['$validationProvider', '$locationProvider', '$filterProvider', '$ocLazyLoadProvider', '$compileProvider', '$httpProvider', '$controllerProvider', '$provide', '$stateProvider', '$urlRouterProvider',
    function ($validationProvider,$locationProvider, $filterProvider, $ocLazyLoadProvider, $compileProvider, $httpProvider, $controllerProvider, $provide, $stateProvider, $urlRouterProvider) {
        $locationProvider.hashPrefix('');
        var version = (new Date()).getTime();
        tournamentOrganiser.registerController = $controllerProvider.register;
        tournamentOrganiser.$register = $provide;
        tournamentOrganiser.$compileProvider = $compileProvider;
        tournamentOrganiser.$filterProvider = $filterProvider;

        $urlRouterProvider.otherwise(function ($injector) {
            
            var $state = $injector.get('$state');
            var authService = $injector.get('authService');

            if (!authService.IsAuthenticated())
                $state.go('app.login');
            else
                authService.authenticateRouting();
            //$state.go('home.dashboard');
        });
        angular.extend($validationProvider, {
            validCallback: function (element) {
                $(element).parents('.field:first').removeClass('error');
            },
            invalidCallback: function (element) {
                $(element).parents('.field:first').addClass('error');
            }
        });
        $validationProvider.showSuccessMessage = false;
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
            permission: { authenticate: false, users: ['user', 'admin'] },
            views: {
                "ParentView": {
                    templateUrl: 'MainApp/app/LoggedOut/_LoggedOutLayout.html?v=' + version,
                    resolve: {
                        loadMyFiles: ['$ocLazyLoad', '$q', function ($ocLazyLoad, $q) {
                            
                        }]
                    }
                }
            },

        }).state('app.login', {
            url: '/login',
            controller: 'LoginController as vm',
            templateUrl: 'MainApp/app/LoggedOut/login/_login.html?v=' + version,
            permission: { authenticate: false, users: ['any'] },
            resolve: {
                loadMyFiles: ['$ocLazyLoad', '$q', function ($ocLazyLoad, $q) {
                    
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
            permission: { authenticate: true, users: ['any'], failedRedirect: 'app.login' },
            views: {
                "ParentView": {
                    controller: 'loggedInController as vm',
                    templateUrl: 'MainApp/app/LoggedIn/_LoggedInLayout.html?v=' + version,
                    resolve: {
                        loadMyFiles: ['$ocLazyLoad', '$q', 'authService', function ($ocLazyLoad, $q, authService) {
                            
                            var deferred = $q.defer();
                            try {
                                if (!authService.IsAuthenticated()) {
                                    authService.logOut();
                                    deferred.reject("Invalid access");
                                }
                                else {
                                    require(["loggedInController"], function () {
                                        deferred.resolve();
                                    });
                                }
                            }
                            catch (ex) {
                                deferred.reject(ex);
                            }
                            return deferred.promise;
                        }]
                    }

                }
            }
        }).state('home.uDashboard', {
            url: '/udashboard',
            authenticate: true,
            templateUrl: 'MainApp/app/LoggedIn/users/dashboard/_dashboard.html?v=' + version,
            controller: 'dashboardController as vm',
            resolve: {
                loadMyFiles: ['$ocLazyLoad', '$q', "$injector", function ($ocLazyLoad, $q, $injector) {
                    
                    var deferred = $q.defer();
                    try {
                        $ocLazyLoad.load(['MainApp/scripts/Jquery/OrgChart/css/jquery.orgchart.css']);
                        
                        require(["uDashController"], function () {
                            try {
                                var $injectResult = $ocLazyLoad.inject(['angularOrgChart']);
                                //var $injectResult = $ocLazyLoad.inject(['ngDragDrop', 'as.sortable']);
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


                            deferred.resolve();
                        });
                    }
                    catch (ex) {
                        deferred.reject(ex);
                    }
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

                    if (config.url.match(/^\/api\/.*/) || config.url.match(/^\/token.*/)) {
                        var apiLoader = $injector.get('apiLoader');
                        apiLoader.start();
                    }

                    return config;
                },

                response: function (result) {
                    result = result || {};
                    result.resultSuccess = true;
                    var apiLoader = $injector.get('apiLoader');
                    apiLoader.stop();
                    return result;
                },

                responseError: function (rejection) {

                    rejection = rejection || {};
                    rejection.resultError = true;
                    console.log('Failed with', rejection.status, 'status');
                    var apiLoader = $injector.get('apiLoader');
                    apiLoader.stop();
                    return $q.reject(rejection);
                }
            }
        }]);
    }]);


    tournamentOrganiser.run(
       ['$rootScope', 'authService', '$state', '$timeout', 'appServices', '$injector',
       function ($rootScope, authService, $state, $timeout, appServices, $injector) {
           $rootScope.version = (new Date()).getTime();
           
           var apiLoader = $injector.get('apiLoader');
           $rootScope.$on('$stateChangeStart', function (event, toState, toParams, fromState, fromParams) {
               
               apiLoader.start();
               if (toState.authenticate && !authService.IsAuthenticated()) {
                   authService.logOut();
                   $state.go('app.login');
               }

               if (!toState.authenticate && authService.IsAuthenticated()) {
                   event.preventDefault();
                   authService.authenticateRouting();
               }
           });

           $rootScope.$on('$stateChangeSuccess', function (event, toState, toParams, fromState, fromParams) {
               
               //$timeout(function () {
               //    apiLoader.stop();
               //}, 100);

           });

           $rootScope.$on('$stateChangeError',
            function (event, toState, toParams, fromState, fromParams, error) {
                //$timeout(function () {
                //    apiLoader.stop();
                //}, 100);
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
