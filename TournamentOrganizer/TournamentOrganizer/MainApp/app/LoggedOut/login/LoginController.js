/// <reference path="../../../scripts/angular/ngFormFixes.directive/ngFormFixes.directive.js" />
define(['angular'], function (angular) {

    var tournamentOrganiser = angular
         .module('tournamentOrganiser')



    tournamentOrganiser.registerController('LoginController',
     ['$scope', '$http', '$window', '$timeout',
         '$filter', 'Enum', '$q', '$http', '$ocLazyLoad', 'authService'
         , '$injector',
     LoginController]);



    function LoginController($scope, $http, $window, $timeout, $filter, Enum, $q, $http, $ocLazyLoad, authService, $injector) {
        var vm = this;

        return vm;
    }
});
