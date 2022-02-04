    $(document).ready(function() {
        
        $('#quiz').append('<div id="mainPage"><div id="quizlbl"><label class="quizStartlbl"> Quiz Time</label></div><div id="strtbtn"><button id="startbtn" class="startbtn">Start</button></div></div>');    
        $('#startbtn').on('click', strtbtnclick);
        var arr={0:["What is the capital of India ?","Delhi","Gandhinagar","Mumbai","Ahmedabad"], 1:["Which is the longest river of India?","Jamuna","Saraswati","Ganga","Sabarmati"],2:["Which is the highest mountain in India?","Mount-Everest","Godwin-Austen","Kangchenjunga","Nanda-Devi"],3:["Which is largest state in India?","Gujarat","Maharastra","Tamilnadu","Rajasthan"] }
        var trueopt=0; 
        var i=0;
        function strtbtnclick(){        
            $("#mainPage").remove();
            $('#quiz').append('<div id="quizdiv"><label class="quizquestion">'+(i+1)+') '+arr[i][0]+'</label></div>');
            $('#quiz').append('<div id="quizoptions"><input type="radio" class="capital" name="capital" value="'+arr[i][1]+'" id="'+arr[i][1]+'">'+arr[i][1]+'</input></br><input type="radio" class="capital" name="capital" value="'+arr[i][2]+'" id="'+arr[i][2]+'">'+arr[i][2]+'</input></br><input type="radio" class="capital" name="capital" value="'+arr[i][3]+'" id="'+arr[i][3]+'">'+arr[i][3]+'</input></br><input type="radio" class="capital" name="capital" value="'+arr[i][4]+'" id="'+arr[i][4]+'">'+arr[i][4]+'</input></br></div>');
            $('#quiz').append('<div id="quizbtndiv"><button id="quizbtn" class="quizbtn" style="pointer-events: auto! important;cursor: not-allowed! important;" disabled>Next</button></div>');
            $('#quizbtn').on('click', nextbtnclick);
            $(".capital").click(radioclick)
        }

        function radioclick(){
            $('#quizbtn').attr('style', 'pointer-events: auto! important;cursor: default! important;');
            $('#quizbtn').prop( "disabled", false );        
        }
        
        function nextbtnclick(){
            if($('#Delhi').prop('checked')||$('#Rajasthan').prop('checked')||$('#Godwin-Austen').prop('checked')||$('#Ganga').prop('checked')){
                trueopt++;
            }
            $('#quizdiv').remove();
            $('#quizoptions').remove();
            $('#quizbtn').remove();
            i++;
            if(i<Object.keys(arr).length){
                $('#quiz').append('<div id="quizdiv"><label class="quizquestion">'+(i+1)+') '+arr[i][0]+'</label></div>');
                $('#quiz').append('<div id="quizoptions"><input type="radio" class="capital" name="capital" value="'+arr[i][1]+'" id="'+arr[i][1]+'">'+arr[i][1]+'</input></br><input type="radio" class="capital" name="capital" value="'+arr[i][2]+'" id="'+arr[i][2]+'">'+arr[i][2]+'</input></br><input type="radio" class="capital" name="capital" value="'+arr[i][3]+'" id="'+arr[i][3]+'">'+arr[i][3]+'</input></br><input type="radio" class="capital" name="capital" value="'+arr[i][4]+'" id="'+arr[i][4]+'">'+arr[i][4]+'</input></br></div>');
                $('#quiz').append('<div id="quizbtndiv"><button id="quizbtn" class="quizbtn" style="pointer-events: auto! important;cursor: not-allowed! important;" disabled>Next</button></div>');
                $('#quizbtn').on('click', nextbtnclick);
                $(".capital").click(radioclick)
            }
            else{
                $('#quiz').append('<div id="mainPage"><div id="quizlbl"><label class="quizStartlbl"> Result : '+ trueopt+'/4</label></div><div id="strtbtn"><button id="startbtn" class="startbtn">Restart</button></div></div>');
                i=0;
                trueopt=0;
                $('#startbtn').on('click', strtbtnclick);
            }
        }        
    })