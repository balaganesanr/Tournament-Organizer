/// <reference path="../../../scripts/angular/ngFormFixes.directive/ngFormFixes.directive.js" />
define(['angular'], function (angular) {

    angular
         .module('tournamentOrganiser')
        .$register
        .factory('loggedInService', ['$http', function ($http) {
        return {
           
        }
    }]);

    angular
         .module('tournamentOrganiser').registerController('loggedInController',
     ['loggedInService', '$scope', '$http', '$window', '$timeout',
         '$filter', 'Enum', '$q', '$http', '$ocLazyLoad', 'authService'
         , '$injector',
     loggedInController]);


    function loggedInController(loggedInService, $scope, $http, $window, $timeout, $filter, Enum, $q, $http, $ocLazyLoad, authService, $injector) {
        var vm = this;

        vm.logout = logout;


        /*
         * Functions
         */

        function logout() {
            authService.logOut();
        }
        return vm;
    }
});
