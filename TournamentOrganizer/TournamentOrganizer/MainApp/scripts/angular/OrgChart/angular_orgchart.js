/*! angular org chart - v1.0.0 - 2017-05-28
* 
* Copyright (c) 2017 Jeeva; Licensed MIT */
(function () {
    'use strict';
    angular.module('angularOrgChart', [])
         .factory('angularOrgChart',
        [function () {
            var angularOrgChart = {};

            return angularOrgChart;
        }])
        .directive('angularOrgChart', ['appServices', function (appServices) {
            return {
                restrict: 'AE',
                scope: {
                    angularOrgChartFunctions: '=angularOrgChartFunctions'
                },
                link: function (scope, $element, attrs, ngModel) {
                    debugger

                    $(document).ready(function () {
                        if (attrs.angularOrgChartStatic) {
                            $($element).orgchart({
                                'data': $(attrs.angularOrgChartStatic)
                            });
                            $(attrs.angularOrgChartStatic).hide();
                        }
                    });

                }
            };
        }]);

}());
