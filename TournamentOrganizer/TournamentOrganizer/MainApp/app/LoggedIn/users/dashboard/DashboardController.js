/// <reference path="../../../scripts/angular/ngFormFixes.directive/ngFormFixes.directive.js" />
define(['angular'], function (angular) {

    angular.module('tournamentOrganiser')
        .$register
        .factory('dashboardService', ['$http', function ($http) {
        return {
           
        }
    }]);

    var tournamentOrganiser = angular
         .module('tournamentOrganiser');



    tournamentOrganiser.registerController('dashboardController',
     ['dashboardService', '$scope', '$http', '$window', '$timeout',
         '$filter', 'Enum', '$q', '$http', '$ocLazyLoad', 'authService'
         , '$injector',
     dashboardController]);



    function dashboardController(dashboardService, $scope, $http, $window, $timeout, $filter, Enum, $q, $http, $ocLazyLoad, authService, $injector) {
        var vm = this;

        return vm;
    }
});
