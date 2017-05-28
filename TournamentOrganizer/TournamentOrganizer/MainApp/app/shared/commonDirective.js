angular.module('tournamentOrganiser')
    .factory('apiLoader', ['$rootScope', function ($rootScope) {
        var apiLoader = {};
        apiLoader.apiLoaderCommon = { spinner: null, target: null, spinning: false, spinningCount: 0 },
        apiLoader.start = start;
        apiLoader.stop = stop;

        $rootScope.globalValues = $rootScope.globalValues || {};
        function setGlobalLoader(enable) {
            $rootScope.globalValues = $rootScope.globalValues || {};
            $rootScope.globalValues.isLoading = enable;
        }
        function start(opt) {
            if (!apiLoader.apiLoaderCommon.spinning) {
                apiLoader.apiLoaderCommon.spinning = true;
                setGlobalLoader(true);
            }
            apiLoader.apiLoaderCommon.spinningCount++;
        }
        function stop() {
            if (apiLoader.apiLoaderCommon.spinningCount <= 1 && apiLoader.apiLoaderCommon.spinning) {
                setGlobalLoader(false);
                apiLoader.apiLoaderCommon.spinning = false;
                apiLoader.apiLoaderCommon.spinningCount = 0;

            }
            else if (apiLoader.apiLoaderCommon.spinningCount > 1)
                apiLoader.apiLoaderCommon.spinningCount--;
        }

        return apiLoader;
    }]).directive('apiLoader', ['apiLoader', '$timeout', '$rootScope', function (apiLoader, $timeout, $rootScope) {
        return {
            link: function (scope, $element, attrs, ngModel) {
                var customSpinner = null;
                apiLoader.start = start;
                apiLoader.stop = stop;
                $rootScope.globalValues = $rootScope.globalValues || {};
                function setGlobalLoader(enable) {
                    $rootScope.globalValues = $rootScope.globalValues || {};
                    $rootScope.globalValues.isLoading = enable;
                }
                function start(opt) {
                    if (!apiLoader.apiLoaderCommon.spinning) {
                        apiLoader.apiLoaderCommon.spinning = true;
                        setGlobalLoader(true);
                    }
                    apiLoader.apiLoaderCommon.spinningCount++;
                }
                function stop() {
                    if (apiLoader.apiLoaderCommon.spinningCount <= 1 && apiLoader.apiLoaderCommon.spinning) {
                        setGlobalLoader(false);
                        apiLoader.apiLoaderCommon.spinning = false;
                        apiLoader.apiLoaderCommon.spinningCount = 0;

                    }
                    else if (apiLoader.apiLoaderCommon.spinningCount > 1)
                        apiLoader.apiLoaderCommon.spinningCount--;
                }
            }
        };
    }])
    .directive("setMainContentHeight", ['$timeout', 'apiLoader', function ($timeout, apiLoader) {
        return {
            restrict: "A",
            link: function ($scope, $element, $attributes) {
                var $this = this;
                
                function body_sizer(a) {

                    $this = this;
                    var windowHeight = (($this.window.innerHeight > 0) ? $this.window.innerHeight : $this.screen.height);
                    var headerHeight = $('.to_mainheader').height();
                    var footer = $('.to_mainfooter').height();

                    var contentHeight = (windowHeight + 28) - (headerHeight + footer);
                    $($element).css('min-height', contentHeight);
                    apiLoader.stop();
                }

                function setContentHeight() {
                    apiLoader.start();
                    $timeout(function () {
                        body_sizer();
                    }, 5);
                    //body_sizer();
                }
                $(window).on('resize', function () {
                    setContentHeight();
                });

                $(document).ready(function () {
                    setContentHeight();
                });
            }
        }
    }])