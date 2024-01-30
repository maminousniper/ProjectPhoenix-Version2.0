SetupLesterInfo = function(data) {
    var MyData = data;

    console.log(JSON.stringify(data))

    $("#lester-moneywash").html('Money wash');
    $("#lester-header-progress-moneywash").html("Current Progress : " + Math.floor(MyData.metadata.crime.smallmoneywash.progress) + " %");
    $("#lester-header-tier-moneywash").html("Level : " + Math.floor(MyData.metadata.crime.smallmoneywash.grade));
    $(".lester-header-progress-fill-moneywash").css("width", Math.floor(MyData.metadata.crime.smallmoneywash.progress) + "%");

    $("#lester-storerobbery").html('Store Robbery');
    $("#lester-header-progress-storerobbery").html("Current Progress : " + Math.floor(MyData.metadata.crime.storerobbery.progress) + " %");
    $("#lester-header-tier-storerobbery").html("Level : " + Math.floor(MyData.metadata.crime.storerobbery.grade));
    $(".lester-header-progress-fill-storerobbery").css("width", Math.floor(MyData.metadata.crime.storerobbery.progress) + "%");

    $("#lester-moneystorm").html('Money Storm');
    $("#lester-header-progress-moneystorm").html("Current Progress : " + Math.floor(MyData.metadata.crime.lester.moneystorm.progress) + " %");
    $("#lester-header-tier-moneystorm").html("Level : " + Math.floor(MyData.metadata.crime.lester.moneystorm.grade));
    $(".lester-header-progress-fill-moneystorm").css("width", Math.floor(MyData.metadata.crime.lester.moneystorm.progress) + "%"); 
}