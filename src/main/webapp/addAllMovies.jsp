<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.7.0.js"></script>
</head>
<body>

<script>
   
   $.ajax({
      url : "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2", // ��ȭ���� API
      data : {

         ServiceKey : "8N7WULS3PZ7ER312R70R", // ����Ű
         listCount : 10, // ��ȭ ��û ����
         releaseDts : "20201201", // ������ ����
         genre : "�θǽ�"
      },
      dataType : 'json',
      success(responseData){
         const infoOfMovies = [];
         const {Data} = responseData;
         const {Result} = Data[0];
         console.log("Result", Result);
         
         Result.forEach((movie) => { 
        	// api���� �Ѿ�� ��ȭ ��ü�迭 �ݺ����ӿ��� �� ��������
            const vod = movie.vods.vod[0].vodUrl; // ��������
            const story = movie.plots.plot[0].plotText; // �ٰŸ�
            const director = movie.directors.director[0].directorNm; // ����
            const DOCID = movie.DOCID;
            const title = movie.title; // ����
            const titleEng = movie.titleEng; // ��������
            const genre = movie.genre; // �帣
            const repRlsDate = movie.repRlsDate; // ������
            const runtime = movie.runtime; // ��Ÿ��
            const posters = movie.posters; // ������url
                        
            if( // ��ȭ�� ������ ��������� �������� �ʾƼ� ���������� ���� ���� ���� 
               vod !== "" && story !== "" && director !== "" && title !== "" && titleEng !== "" && genre !== "" 
               && repRlsDate !== "" && runtime !== "" && posters !== ""
               && !story.includes('�����') && !genre.includes('����') // �������� �������� �����...
            ) {
               
               let actors = ''; // ���� 5�� ���
               for(let i = 0; i < movie.actors.actor.length; i++) {
                  if(i == movie.actors.actor.length-1)
                     actors += movie.actors.actor[i].actorNm;
                  else
                     actors += movie.actors.actor[i].actorNm + ",";
                  
                  if(i == 5) break;
               }
               
               
               // ��ȭ��ü���� ������ ���� '#'�������� �ٿ��� infoOfMovies�迭�� String�������� �߰�
               // 				[{"��ȭ�ڵ�#����#��ȭ����#�帣#�ٰŸ�#������#�󿵽ð�#������#����#���#Ƽ��"}]
               infoOfMovies.push(DOCID + "#" +  title + "#" + titleEng + "#" + genre + "#" + story + "#" + repRlsDate + 
                                    "#" + runtime + "#" + posters + "#" + director + "#" + actors + "#" + vod);
            }
         });
         console.log("infoOfMovies", infoOfMovies); // String[]�� ��翵ȭ ��� �α� Ȯ��
         
         $.ajax({ // ��ȭ�����迭 �������� ������
            url : "<%= request.getContextPath() %>/setMovie/addAllMovies",
            data : {"infoOfMovies" : infoOfMovies},
            traditional: true, // �迭�� �ѱ� �� �ִ� �Ӽ�
            dataType : "json",
            method : "post",
            success(responseData){
               console.log("���۽� ����~!", responseData);      
            }
         });
      }
   });
   
</script>
</body>
</html>