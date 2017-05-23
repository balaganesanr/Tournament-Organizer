define(['angular'], function (angular) {
    angular.module('tournamentOrganiser')
        .$register
        .factory('dashboardService',
        ['$http', 'appServices', 'authService', 'Enum', '$sce', '$q',
            function ($http, appServices, authService, Enum, $sce, $q) {
                var dashboardService = {};
                
                return dashboardService;
            }]);
});
