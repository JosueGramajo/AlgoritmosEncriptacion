jQuery(document).ready(function ($) {
    let numbers = Array(-9, -8, -7, -6, -5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 6, 7, 8, 9);

    var encryptedMessage = "";

    $("#encryption-type-select").change(function () {
        if (this.value === "1"){
            //cajas
            $("#box-key").show();
            $("#matrix-key").hide();
            $("#text-to-encrypt-div").show();
        }else{
            //matrices
            $("#box-key").hide();
            $("#matrix-key").show();
            $("#text-to-encrypt-div").show();
        }
    });

    $("#random-key-button").click(function () {
        for (i = 0; i < 10; i++){
            $("#m"+i).val(randomNumber());
        }
    });

    function randomNumber() {
        return numbers[Math.floor(Math.random() * numbers.length)];
    }

    $('#box-key-input').bind('keyup blur',function(){
        var node = $(this);
        node.val(node.val().replace(/[^a-zA-Z]/g,'') ); }
    );

    $('#m1').bind('keyup blur',function(){
        var node = $(this);
        node.val(node.val().replace(/[^0-9-]/g,'') ); }
    );

    $('#m2').bind('keyup blur',function(){
        var node = $(this);
        node.val(node.val().replace(/[^0-9-]/g,'') ); }
    );

    $('#m3').bind('keyup blur',function(){
        var node = $(this);
        node.val(node.val().replace(/[^0-9-]/g,'') ); }
    );

    $('#m4').bind('keyup blur',function(){
        var node = $(this);
        node.val(node.val().replace(/[^0-9-]/g,'') ); }
    );

    $('#m5').bind('keyup blur',function(){
        var node = $(this);
        node.val(node.val().replace(/[^0-9-]/g,'') ); }
    );

    $('#m6').bind('keyup blur',function(){
        var node = $(this);
        node.val(node.val().replace(/[^0-9-]/g,'') ); }
    );

    $('#m7').bind('keyup blur',function(){
        var node = $(this);
        node.val(node.val().replace(/[^0-9-]/g,'') ); }
    );

    $('#m8').bind('keyup blur',function(){
        var node = $(this);
        node.val(node.val().replace(/[^0-9-]/g,'') ); }
    );

    $('#m9').bind('keyup blur',function(){
        var node = $(this);
        node.val(node.val().replace(/[^0-9-]/g,'') ); }
    );


    $("#encrypt-button").click(function () {
        let typeSelect = $("#encryption-type-select").val();
        let dataToEncrypt = $("#data-to-encrypt-input").val();
        let key = $("#box-key-input").val();

        let m1 = $("#m1").val().trim();
        let m2 = $("#m2").val().trim();
        let m3 = $("#m3").val().trim();
        let m4 = $("#m4").val().trim();
        let m5 = $("#m5").val().trim();
        let m6 = $("#m6").val().trim();
        let m7 = $("#m7").val().trim();
        let m8 = $("#m8").val().trim();
        let m9 = $("#m9").val().trim();

        if (typeSelect !== "1" && typeSelect !== "2"){
            alert("Debe seleccionar un tipo de encriptacion");
            return;
        }

        if (dataToEncrypt === ""){
            alert("Debe ingresar texto a encriptar");
            return;
        }

        if (typeSelect === "1" && key === ""){
            alert("Debe ingresar una llave de encriptacion");
            return;
        }

        if (typeSelect === "2" && (m1 ===  "" || m2 ===  "" || m3 ===  "" || m4 ===  "" || m5 ===  "" || m6 ===  "" || m7 ===  "" || m8 ===  "" || m9 ===  "")){
            alert("Falta algun valor de la matriz de llave");
            return;
        }

        $("#button").hide();
        $("#loader").show();

        $.ajax({
            method: "POST",
            url: "/encrypt-data",
            data: {
                "type" : typeSelect,
                "message" : dataToEncrypt,
                "box-key" : key,
                "m1" : m1,
                "m2" : m2,
                "m3" : m3,
                "m4" : m4,
                "m5" : m5,
                "m6" : m6,
                "m7" : m7,
                "m8" : m8,
                "m9" : m9
            },
            success: function ( data ) {
                $("#loader").hide();
                $("#button").show();

                alert("Encriptacion exitosa, desplazarse hacia abajo para ver el resultado");

                let obj = JSON.parse(data);

                if ($("#encryption-type-select").val() === "1"){
                    $("#result-table > tbody").html("");
                    $("#result-table > thead").html("");

                    var wordHeader = '<tr>';
                    var numberHeader = '<tr>';
                    $.each( obj.list, function( index, value ){
                        wordHeader = wordHeader + '<th scope="col">' + value.letter +'</th>';
                        numberHeader = numberHeader + '<th scope="col">'+ value.number +'</th>';
                    });

                    $('#result-table >thead').append(wordHeader);
                    $('#result-table >thead').append(numberHeader);

                    var body = '';
                    $.each( obj.originalText, function( index, value ){
                        body = '<tr>';
                        for (var i = 0; i < value.length; i++) {
                            body = body + '<td>'+value.charAt(i)+'</td>';
                        }
                        body = body + '</tr>';

                        $('#result-table > tbody:last-child').append(body);
                    });

                    $("#encrypted-result-label").html(obj.encrypted);

                    encryptedMessage = obj.encrypted;

                    $("#result-div").show();
                    $("#matrix-result-div").hide();
                }else if($("#encryption-type-select").val() === "2"){
                    $("#matrix-result-table > tbody").html("");
                    $("#key-table > tbody").html("");
                    $("#text-table > tbody").html("");

                    var keyMatrixBody = '';
                    $.each( obj.keyMatrix, function( index, value ){
                        keyMatrixBody = '<tr>';
                        for (var i = 0; i < value.length; i++) {
                            keyMatrixBody = keyMatrixBody + '<td>'+value[i]+'</td>';
                        }
                        keyMatrixBody = keyMatrixBody + '</tr>';

                        $('#key-table > tbody:last-child').append(keyMatrixBody);
                    });

                    var textMatrixBody = '';
                    $.each( obj.textMatrix, function( index, value ){
                        textMatrixBody = '<tr>';
                        for (var i = 0; i < value.length; i++) {
                            textMatrixBody = textMatrixBody + '<td>'+value[i]+'</td>';
                        }
                        textMatrixBody = textMatrixBody + '</tr>';

                        $('#text-table > tbody:last-child').append(textMatrixBody);
                    });

                    encryptedMessage = "";

                    var resultMatrixBody = '';
                    $.each( obj.encryptedResultMatrix, function( index, value ){
                        resultMatrixBody = '<tr>';
                        for (var i = 0; i < value.length; i++) {
                            resultMatrixBody = resultMatrixBody + '<td>'+value[i]+'</td>';

                            encryptedMessage = encryptedMessage + value[i] + " , ";
                        }
                        resultMatrixBody = resultMatrixBody + '</tr>';

                        encryptedMessage = encryptedMessage + "|";

                        $('#matrix-result-table > tbody:last-child').append(resultMatrixBody);
                    });

                    $("#result-div").hide();
                    $("#matrix-result-div").show();
                }
            },
            error: function (xhr) {
                $("#loader").hide();
                $("#button").show();
            }
        });
    });

    $("#downloadFileButton").click(function () {
        window.open('/download-text-file?result=' + encryptedMessage, '_blank');
    });

    $("#matrixDownloadFileButton").click(function () {
        window.open('/download-text-file?result=' + encryptedMessage, '_blank');
    });
});