define(['require'], function (require) {
    var tournamentOrganiser = angular.module('tournamentOrganiser');

    tournamentOrganiser.factory('authService', ['$http', '$q',
    'localStorageService', 'commonService', 'appServices', '$state', '$injector', 'Enum',
    function ($http, $q, localStorageService, commonService, appServices, $state, $injector, Enum) {

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
       
        //var _authShared = {
        //    tokenKey: 'dp_at'
        //}
        

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
        //var _login = function (loginData) {

        //    var deferred = $q.defer();
        //    _SessionDetails.StartDate = new Date();
        //    var data = "grant_type=password&username=" + loginData.Username + "&password=" + encodeURIComponent(loginData.Password);
        //    data = data + "&client_id=" + Enum.clientId;

        //    return $http.post('/token', data, { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } }).success(function (response) {
        //        if (response) {
        //            debugger
        //            _loadAuthorizeData(response);
        //            var groups = null;
        //            if (typeof response.group == "string")
        //                groups = JSON.parse(response.group);
        //            else
        //                groups = response.group;
        //            var person = null;
        //            if (typeof response.person == "string")
        //                person = JSON.parse(response.person);
        //            else
        //                person = response.person;

        //            if (response.selectedGroup == null && groups && groups.length > 1) {
        //                commonService.myGroups = angular.copy(groups);
        //                $state.go('group.UserAccountSelection');
        //            }
        //            else {
        //                $state.transitionTo('home.dashboard');
        //            }

        //        }

        //        deferred.resolve();

        //    }).error(function (data) {
        //        var exceptionMessage = null;

        //        if (data && data.error_description)
        //            exceptionMessage = data.error_description;
        //        else
        //            exceptionMessage = data;

        //        appServices.showException(exceptionMessage, "alert-danger");
        //        deferred.reject();
        //    });

        //    return deferred.promise;
        //};
       
        //var _Authenticate = function (data, isactivation) {

        //    var authenticationToken = data.authenticationToken;

        //    if (authenticationToken && authenticationToken.access_token) {
        //        var coutryid = 0;
        //        if (data && data.person && data.person.countryId)
        //            coutryid = data.person.countryId;

        //        localStorageService.set('authorizationData',
        //                            {
        //                                isAuth: true,
        //                                token: authenticationToken.access_token,
        //                                userName: authenticationToken.userName,
        //                                loggedInRole: data.loggedinRole,
        //                                isBoardAccess: data.isBoardAccess,
        //                                countryId: coutryid,
        //                            });


        //        // Navigate to dashboard
        //        if (isactivation) {
        //            if (Enum.Group.DapresyGeneral == data.groupId && (data.loggedinRole == Enum.Role.GroupAdmin || data.loggedinRole == Enum.Role.GroupUser)) {
        //                appServices.alertNotify("You have been activated. But still is not assigned to group. Please contact admin or support team", "alert-success");
        //                _logOut();
        //                return;
        //            }
        //        }

        //        $state.transitionTo('home.dashboard');
        //        _commonObject.groupId = data.groupId;
        //        _commonObject.groupFont = data.groupFont;
        //        _commonObject.groupColor = data.groupColor;
        //        _commonObject.logoDisplayName = data.groupLogoDisplayName;
        //        _commonObject.logoUniqueName = data.groupLogoUniqueName;
        //        _commonObject.groupName = data.groupName;
        //    }
        //}

        //var _logOut = function () {
        //    var deferred = $q.defer();
        //    $http.post('/api/Common/Logout').success(function (response) {
        //        _removeAuthorizeData();
        //        $state.transitionTo('app.login');
        //        deferred.resolve();
        //    }).error(function (data) {
        //        appServices.showException(data, "alert-danger");
        //        _removeAuthorizeData();
        //        $state.transitionTo('app.login');
        //        deferred.reject();
        //    });
        //};

        //var _updateUserCountry = function (countryId) {
        //    var authData = localStorageService.get('authorizationData');
        //    if (!authData)
        //        authData = { countryId: 0 };
        //    authData.countryId = countryId;

        //    localStorageService.remove('authorizationData');
        //    localStorageService.set('authorizationData', authData);
        //}

        //var _fillAuthData = function () {

        //    var authData = localStorageService.get('authorizationData');
        //    if (authData) {
        //        _authentication.isAuth = true;
        //        _authentication.userName = authData.userName;
        //        _authentication.loggedInRole = authData.loggedInRole;
        //        _authentication.isBoardAccess = authData.isBoardAccess;
        //        _authentication.isSuperAdmin = authData.isSuperAdmin;
        //        _authentication.roles = authData.roles;
        //        _authentication.countryId = authData.countryId;
        //    } else {
        //        _authentication.isAuth = false;
        //        _authentication.userName = "";
        //        _authentication.loggedInRole = 0;
        //        _authentication.isBoardAccess = false;
        //        _authentication.isSuperAdmin = false;
        //        _authentication.roles = null;
        //        _authentication.countryId = 0;
        //    }
        //};

        //var _GetAuthData = function () {
        //    var authData = localStorageService.get('authorizationData');
        //    if (authData) {
        //        _authentication.isAuth = true;
        //        _authentication.userName = authData.userName;
        //        _authentication.loggedInRole = authData.loggedInRole;
        //        _authentication.isBoardAccess = authData.isBoardAccess;
        //        _authentication.isSuperAdmin = authData.isSuperAdmin;
        //        _authentication.roles = authData.roles;
        //        _authentication.token = authData.token;
        //    } else {
        //        _authentication.isAuth = false;
        //        _authentication.userName = "";
        //        _authentication.loggedInRole = 0;
        //        _authentication.isBoardAccess = false;
        //        _authentication.isSuperAdmin = false;
        //        _authentication.roles = null;
        //        _authentication.token = null;
        //    }

        //    return authData;
        //}

        var _isAuthenticated = function () {

            var authData = localStorageService.get('authorizationData');

            if (authData)
                return authData.isAuth;

            return false;
        };

        //var _userRole = function () {
        //    var authData = localStorageService.get('authorizationData');

        //    if (authData)
        //        return authData.loggedInRole;

        //    return -1;
        //}

        //var isInRole = function (role) {
        //    if (!_authenticated || !_authenticated.roles) return false;

        //    return _identity.roles.indexOf(role) != -1;
        //};

        //var isInAnyRole = function (roles) {
        //    if (!_authenticated || !_authenticated.roles) return false;

        //    for (var i = 0; i < roles.length; i++) {
        //        if (this.isInRole(roles[i])) return true;
        //    }

        //    return false;
        //};

        //var _fillAuthorizeData = function (response, checkgroupId) {

        //    var authenticationToken = response.authenticationToken;
        //    if (authenticationToken && authenticationToken.access_token) {

        //        localStorageService.set('authorizationData',
        //                            {
        //                                isAuth: true,
        //                                token: authenticationToken.access_token,
        //                                refreshToken: authenticationToken.refresh_token,
        //                                userName: authenticationToken.userName,
        //                                loggedInRole: response.loggedinRole,
        //                                isBoardAccess: response.isBoardAccess,
        //                                countryId: 0,
        //                            });

        //        _setGroup();
        //    }

        //    //_commonObject.groupId = response.groupId;
        //    //_commonObject.groupFont = response.groupFont;
        //    //_commonObject.groupColor = response.groupColor;
        //    //_commonObject.logoDisplayName = response.groupLogoDisplayName;
        //    //_commonObject.logoUniqueName = response.groupLogoUniqueName;
        //    //_commonObject.groupName = response.groupName;

        //    //var authenticationToken = response.authenticationToken;
        //    //
        //    //var coutryid = 0;
        //    //if (response && response.person && response.person.countryId)
        //    //    coutryid = response.person.countryId;

        //    //if (authenticationToken && authenticationToken.access_token) {

        //    //    localStorageService.set('authorizationData',
        //    //                        {
        //    //                            isAuth: true,
        //    //                            token: authenticationToken.access_token,
        //    //                            refreshToken: response.refresh_token,
        //    //                            userName: authenticationToken.userName,
        //    //                            loggedInRole: response.loggedinRole,
        //    //                            isBoardAccess: response.isBoardAccess,
        //    //                            countryId: coutryid,
        //    //                        });

        //    //    if (checkgroupId) {
        //    //        if (Enum.Group.DapresyGeneral == response.groupId && (response.loggedinRole == Enum.Role.GroupAdmin || response.loggedinRole == Enum.Role.GroupUser)) {
        //    //            appServices.alertNotify("The current action has been completed. But still is not assigned to group. Please contact admin or support team", "alert-success");
        //    //            _logOut();
        //    //            return;
        //    //        }
        //    //    }
        //    //    // Navigate to dashboard
        //    //    $state.transitionTo('home.dashboard');
        //    //}
        //}

        //var _loadAuthorizeData = function (response) {

        //    if (response) {

        //        var selectedGroup = response.selectedGroup;
        //        if (selectedGroup) {
        //            if (typeof selectedGroup == "string")
        //                selectedGroup = JSON.parse(selectedGroup);
        //            selectedGroup = _toCamel(selectedGroup);
        //            if (Enum.Group.DapresyGeneral == selectedGroup.groupId && (response.loggedinRole == Enum.Role.GroupAdmin || response.loggedinRole == Enum.Role.GroupUser)) {
        //                appServices.alertNotify("You are not assigned to any group. Please contact admin to be assigned.", "alert-danger");
        //                _logOut();
        //                return;
        //            }

        //            _commonObject.groupId = selectedGroup.id;
        //            _commonObject.groupFont = selectedGroup.font;
        //            _commonObject.groupColor = selectedGroup.color;
        //            _commonObject.logoDisplayName = selectedGroup.logoDisplayName;
        //            _commonObject.logoUniqueName = selectedGroup.logoUniqueName;
        //            _commonObject.groupName = selectedGroup.name;
        //            _commonObject.selectedGroup = angular.copy(selectedGroup);
        //        }


        //        var groups = null, person = null;
        //        if (response && response.group) {
        //            if (typeof response.group == "string")
        //                response.group = JSON.parse(response.group);
        //            groups = _toCamel(response.group);
        //        }

        //        //var groups = JSON.parse(response.group);
        //        //var person = JSON.parse(response.person);

        //        if (response && response.person) {
        //            if (typeof response.person == "string")
        //                person = JSON.parse(response.person);
        //            person = _toCamel(person);
        //        }

        //        _commonObject.countryId = person.countryId;

        //        if (groups)
        //            _group.myGroups = angular.copy(groups);
        //        var authenticationToken = response.authenticationToken;

        //        if (response && response.access_token) {

        //            localStorageService.set('authorizationData',
        //                                {
        //                                    isAuth: true,
        //                                    token: response.access_token,
        //                                    refreshToken: response.refresh_token,
        //                                    userName: response.userName,
        //                                    loggedInRole: response.loggedinRole,
        //                                    isBoardAccess: response.isBoardAccess,
        //                                    countryId: person.countryId,
        //                                });


        //            // Navigate to dashboard
        //            Idle.watch();
        //            // Set session timeout
        //            _SetSessionTimeout();
        //        }

        //        _fillAuthData();
        //    }
        //}
        //var _setGroup = function (group) {
        //    var authData = _GetAuthData();
        //    var groupId = 0;
        //    if (group) {
        //        if (group.Id)
        //            groupId = group.Id;
        //        if (!groupId)
        //            groupId = group.id;
        //    }

        //    var data = "grant_type=refresh_token&refresh_token=" + encodeURIComponent(authData.refreshToken) + "&client_id=dapressyApp&groupid=" + encodeURIComponent(groupId);
        //    $http.post('/token', data, { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } }).success(function (response) {
        //        _removeAuthorizeData();
        //        _loadAuthorizeData(response);
        //        $state.go('home.dashboard', null, { reload: true });
        //    }).error(function (err, status) {
        //        _logOut();
        //        //deferred.reject(err);
        //    });
        //}

        //var _removeAuthorizeData = function () {
        //    localStorageService.remove('authorizationData');
        //}

        //var _handleIframeUrl = function (url, window) {
        //    var _obj = _checkIframeUrlExists(url);
        //    if (_obj) {
        //        var index = _iframeUrl.indexOf(_obj);
        //        if (index >= 0) {
        //            _iframeUrl.splice(index, 1);
        //            _obj.window.close();
        //        }
        //    }
        //    if (!_iframeUrl)
        //        _iframeUrl = [];
        //    _iframeUrl.push({ url: url, window: window });
        //}

        //var _checkIframeUrlExists = function (url, window) {
        //    if (!_iframeUrl)
        //        return null;
        //    var _obj = appServices.getObject(_iframeUrl, 'url', url);
        //    if (_obj)
        //        return _obj;
        //}

        //var _getAuthToken = function () {
        //    var authData = localStorageService.get('authorizationData');
        //    if (authData) {
        //        return authData.token;
        //    }
        //    return null;
        //}

        //authServiceFactory.authShared = _authShared;
        //authServiceFactory.getAuthToken = _getAuthToken;
        //authServiceFactory.login = _login;
        //authServiceFactory.logOut = _logOut;
        //authServiceFactory.fillAuthData = _fillAuthData;
        //authServiceFactory.fillAuthorizeData = _fillAuthorizeData;
        //authServiceFactory.authentication = _authentication;
        //authServiceFactory.GetAuthData = _GetAuthData;
        ////authServiceFactory.boards = _boards;
        //authServiceFactory.commonObject = _commonObject;
        //authServiceFactory.SetSessionTimeout = _SetSessionTimeout;
        authServiceFactory.IsAuthenticated = _isAuthenticated;
        //authServiceFactory.Authenticate = _Authenticate;
        //authServiceFactory.UserRole = _userRole;
        //authServiceFactory.UpdateUserCountry = _updateUserCountry;
        //authServiceFactory.SetGroup = _setGroup;
        //authServiceFactory.Group = _group;
        //authServiceFactory.handleIframeUrl = _handleIframeUrl;
        //authServiceFactory.checkIframeUrlExists = _checkIframeUrlExists;

        return authServiceFactory;
    }]);
});