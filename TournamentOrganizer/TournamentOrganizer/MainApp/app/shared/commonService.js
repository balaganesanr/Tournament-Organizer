define(['require'], function (require) {
    var tournamentOrganiser = angular.module('tournamentOrganiser');

    tournamentOrganiser
        .service('commonService', function () {

        }).factory('appServices', ['Notification', 'Enum', '$filter',
                    function (Notification, Enum, $filter) {
                        var appServices = {};
                        appServices.oldData = null;
                        var cFilter = $filter;

                        function getInternetExplorerVersion() {
                            var rv = -1;
                            if (navigator.appName == 'Microsoft Internet Explorer') {
                                var ua = navigator.userAgent;
                                var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
                                if (re.exec(ua) != null)
                                    rv = parseFloat(RegExp.$1);
                            }
                            else if (navigator.appName == 'Netscape') {
                                var ua = navigator.userAgent;
                                var re = new RegExp("Trident/.*rv:([0-9]{1,}[\.0-9]{0,})");
                                if (re.exec(ua) != null)
                                    rv = parseFloat(RegExp.$1);
                            }
                            return rv;
                        }

                        appServices.toggleEditMode = function (obj, list) {
                            // Revert to original data if they cancelled
                            if (angular.equals(obj, appServices.oldData) && obj.$edit) {
                                list[list.indexOf(obj)] = angular.copy(appServices.oldDataCopy);
                            }
                            else {
                                if (appServices.oldData) {
                                    list[list.indexOf(appServices.oldData)] = angular.copy(appServices.oldDataCopy);
                                }

                                appServices.oldDataCopy = angular.copy(obj);
                                obj.$edit = !obj.$edit;
                                appServices.oldData = obj;
                            }
                        }

                        appServices.showException = function (data) {

                        }
                        appServices.showAlert = function (msg, type) {
                            if (type == Enum.MessageType.INFO) {
                                Notification.info(msg);
                            }
                            else if (type == Enum.MessageType.SUCCESS) {
                                Notification.success(msg);
                            }
                            else if (type == Enum.MessageType.ERROR) {
                                Notification.error(msg);
                            }
                            else if (type == Enum.MessageType.WARNING) {
                                Notification.warning(msg);
                            }
                        }

                        appServices.getObject = function (lists, propertyKey, propertyValue) {
                            if (propertyValue == null || angular.isUndefined(propertyValue))
                                propertyValue = -1;

                            var _property = {}; _property[propertyKey] = propertyValue;
                            var _obj = cFilter('filter')(lists, _property, true);

                            if (_obj && _obj[0])
                                return _obj[0];

                            return null;
                        }


                        /*
                         * To check object exists
                         */
                        appServices.checkItemExists = function (lists, propertyKey, propertyValue) {

                            var _property = {}; _property[propertyKey] = propertyValue;
                            var _obj = cFilter('filter')(lists, _property, true);

                            if (_obj && _obj[0])
                                return true;

                            return false;
                        }

                        return appServices;
                    }]);
});