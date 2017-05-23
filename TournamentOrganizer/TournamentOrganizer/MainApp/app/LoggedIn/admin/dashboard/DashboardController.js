/// <reference path="../../../scripts/angular/ngFormFixes.directive/ngFormFixes.directive.js" />
define(['angular'], function (angular) {

    var tournamentOrganiser = angular
         .module('tournamentOrganiser')



    tournamentOrganiser.registerController('dashboardController',
     ['dashboardService', '$scope', '$http', '$window', '$timeout',
         '$filter', 'Enum', '$q', '$http', '$ocLazyLoad', 'authService'
         , '$injector',
     DashboardController]);



    function DashboardController(dashboardService, $scope, $http, $window, $timeout, $filter, Enum, $q, $http, $ocLazyLoad, authService, $injector) {
        var vm = this;

        return vm;
    }
});
