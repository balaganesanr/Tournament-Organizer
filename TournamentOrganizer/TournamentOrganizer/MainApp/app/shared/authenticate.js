define(['require'], function (require) {
    var tournamentOrganiser = angular.module('tournamentOrganiser');

    tournamentOrganiser.factory('authService', ['$rootScope', '$http', '$q',
    'localStorageService', 'commonService', 'appServices', '$state', '$injector', 'Enum',
    function ($rootScope, $http, $q, localStorageService, commonService, appServices, $state, $injector, Enum) {

        var authServiceFactory = {};

        var _authentication = {
            isAuth: false,
            userName: "",
            isSuperAdmin: false,
            boards: {},
            roles: {},
            loggedInRole: 0,
            countryId: 0
        };
        var _authShared = {
            tokenKey: 'to_at', //key definition - Tournamnet organiser authentication token,
            api: 'tournamentOrganiserApi'
        }
        var _commonObject = {
            groupId: 0,
            groupName: null,
            groupColor: null,
            groupFont: null,
            boards: [],
            countries: []
        };
        var _toCamel = function (o) {
            var build, key, destKey, value;

            if (o instanceof Array) {
                build = [];
                for (key in o) {
                    value = o[key];

                    if (typeof value === "object") {
                        value = _toCamel(value);
                    }
                    build.push(value);
                }
            } else {
                build = {};
                for (key in o) {
                    if (o.hasOwnProperty(key)) {
                        destKey = (key.charAt(0).toLowerCase() + key.slice(1) || key).toString();
                        value = o[key];
                        if (value !== null && typeof value === "object") {
                            value = _toCamel(value);
                        }

                        build[destKey] = value;
                    }
                }
            }
            return build;
        }

        var _login = function (loginData) {

            var deferred = $q.defer();
            var data = "grant_type=password&UserName=" + loginData.username + "&Password=" + encodeURIComponent(loginData.password);
            data = data + "&client_id=" + Enum.clientId;
            return $http.post('/token', data, { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } })
                .then(function (response) {
                    if (response && response.data) {
                        _loadAuthorizeData(response.data);
                        deferred.resolve(response);
                        _authenticateRouting();
                    }
                    else
                        appServices.showAlert("Some issue has occurred. Please contact support team.", Enum.MessageType.ERROR);

                }, function (result) {
                    if (result && result.data && result.data.error_description)
                        appServices.showAlert(result.data.error_description, Enum.MessageType.ERROR);
                    else
                        appServices.showAlert("Some issue has occurred. Please contact support team.", Enum.MessageType.ERROR);

                    deferred.reject(data);
                });

            return deferred.promise;
        };

        var _logOut = function () {
            var deferred = $q.defer();
            $http.get(_authShared.api + '/Common/Logout')
                .then(function (response) {
                    _removeAuthorizeData();
                    $state.transitionTo('app.login');
                    deferred.resolve();
                }, function (response) {
                    appServices.showAlert("Some issue has occurred. Please contact support team.", Enum.MessageType.ERROR);
                    //_removeAuthorizeData();
                    //$state.transitionTo('app.login');
                    deferred.reject();
                });

            //    .success(function (response) {

            //}).error(function (data) {
            //    appServices.showException(data, "alert-danger");
            //    _removeAuthorizeData();
            //    $state.transitionTo('app.login');
            //    deferred.reject();
            //});
        }

        var _authenticateRouting = function () {
            if (_authentication.loggedInRole == Enum.Role.User) {
                $state.go('home.uDashboard');
            }
            else if (_authentication.loggedInRole == Enum.Role.User) {

            }
            else {
                appServices.showAlert("Some issue has occurred. Please contact support team.", Enum.MessageType.ERROR);
                _logOut();
            }

        }

        var _removeAuthorizeData = function () {
            localStorageService.remove('authorizationData');
        }

        var _fillAuthorizeData = function (response) {
            var authenticationToken = response.authenticationToken;
            if (authenticationToken && authenticationToken.access_token) {
                localStorageService.set('authorizationData',
                                    {
                                        isAuth: true,
                                        token: authenticationToken.access_token,
                                        refreshToken: authenticationToken.refresh_token,
                                        userName: authenticationToken.userName,
                                        loggedInRole: response.loggedinRole
                                    });

            }
        }

        var _isAuthenticated = function () {
            var authData = localStorageService.get('authorizationData');
            if (authData)
                return authData.isAuth;
            return false;
        };

        var _fillAuthData = function () {
            var authData = localStorageService.get('authorizationData');
            if (authData) {
                _authentication.isAuth = true;
                _authentication.userName = authData.userName;
                _authentication.loggedInRole = authData.loggedInRole;
                _authentication.token = authData.token;
                _authentication.refreshToken = authData.refreshToken;
            } else {
                _authentication.isAuth = false;
                _authentication.userName = "";
                _authentication.loggedInRole = 0;
                _authentication.refreshToken = null;
                _authentication.token = null;
            }
        };

        var _GetAuthData = function () {
            var authData = localStorageService.get('authorizationData');
            if (authData) {
                _authentication.isAuth = true;
                _authentication.userName = authData.userName;
                _authentication.loggedInRole = authData.loggedInRole;
                _authentication.token = authData.token;
                _authentication.refreshToken = authData.refreshToken;
            } else {
                _authentication.isAuth = false;
                _authentication.userName = "";
                _authentication.loggedInRole = 0;
                _authentication.refreshToken = null;
                _authentication.token = null;
            }

            return authData;
        }

        var _getAuthToken = function () {
            var authData = localStorageService.get('authorizationData');
            if (authData) {
                return authData.token;
            }
            return null;
        }

        var _loadAuthorizeData = function (response) {
            if (response) {
                if (response && response.access_token) {
                    localStorageService.set('authorizationData',
                                        {
                                            isAuth: true,
                                            token: response.access_token,
                                            refreshToken: response.refresh_token,
                                            userName: response.Username,
                                            loggedInRole: response.RoleId
                                        });

                }

                _fillAuthData();
            }
        }

        var _setGlobalLoader = function (enable) {
            $rootScope.globalValues = $rootScope.globalValues || {};
            $rootScope.globalValues.isLoading = enable;
        }

        authServiceFactory.setGlobalLoader = _setGlobalLoader;
        authServiceFactory.authShared = _authShared;
        authServiceFactory.commonObject = _commonObject;
        authServiceFactory.getAuthToken = _getAuthToken;
        authServiceFactory.fillAuthData = _fillAuthData;
        authServiceFactory.fillAuthorizeData = _fillAuthorizeData;
        authServiceFactory.authentication = _authentication;
        authServiceFactory.GetAuthData = _GetAuthData;
        authServiceFactory.authenticateRouting = _authenticateRouting;
        authServiceFactory.login = _login;
        authServiceFactory.logOut = _logOut;
        authServiceFactory.IsAuthenticated = _isAuthenticated;
        return authServiceFactory;
    }]);
});