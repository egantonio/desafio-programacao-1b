
app.controller('DadoCtrl', ['$scope', 'fileUpload','$http', function($scope, fileUpload,$http){
    $scope.uploadFile = function(){
        var file = $scope.myFile;

        var uploadUrl = "/uploadfile";
        var x = fileUpload.uploadFileToUrl(file, uploadUrl);
        location.reload();
    };
    $scope.getData = function () {

        $http.get('/dados.json').
        success(function(data) {
            $scope.dados = data;
        });
    };

    $scope.getData();

}]);

