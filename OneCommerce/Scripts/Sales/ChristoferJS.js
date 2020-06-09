$(document).ready(function () {
    
    $(".amenucrearclie").css("background-color", "white");
    //$("#tablaprincdecrearclie").css("background-color", "skyblue");
    //$("#tablaprincdecrearclie td").css("border", "1px solid");
    pestañascrearclie();
    

  
});

function pestañascrearclie() {

    $(".amenucrearclie:first").css("background-color", "blue");
    $(".amenucrearclie:first").css("color", "white");
    $("section.sectablas").hide();
    $("section.sectablas:first").show();

    $(".amenucrearclie").click(function () {
        $(".amenucrearclie").css("background-color", "white");
        $(this).css("background-color", "blue");
        $(this).css("color", "white");
        $("section.sectablas").hide();

        var activartabla = $(this).attr("href");
        $(activartabla).show();
        return false;
    });
}
