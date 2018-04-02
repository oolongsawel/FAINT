package com.faint.util;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

/*
 * TEMP hash tag helper.....
 */
public class HashTagHelper {
   
   //태그를 담을 기본 capacity 
      private static final int DEFAULT_CAPACITY = 20;
         
      
      //태그를 담을 기본 capacity 
      public static List<String> getAllHashTags(String caption){
         //1.태그를 담을 set
         HashSet<String> set = new HashSet<>(DEFAULT_CAPACITY);
         
         //2.붙여진태그들 띄어주기
         String text=split1(caption);
         
         //3.공백으로 나누기
         String[] splitArray=text.split(" ");
         
         //4.특수문자
          String special="!$%^&*()-=+<>?_";
         
         for(int i=0; i<splitArray.length; i++){
            //5.두글자 이상이면서, 첫글자가 #이면서 , 두번째글자가 특수문자가 아니면 해시태그 리스트에 넣기
            if(splitArray[i].length()!=1 && (splitArray[i].indexOf("#")==0 && special.indexOf(splitArray[i].charAt(1))==-1)){
               String hash=splitArray[i].substring(splitArray[i].lastIndexOf("#")+1);
                  //6.집합에 중복없이 넣기
                  set.add(hash);
              }   //end if 
         } //end for
         
         
         //7.반환할 태그 리스트( 동적 증가 방지를 위해 초기 capacity == set.size() )
               List<String> hashTagsList = new ArrayList<>(set.size());
               Iterator<String> tagItr = set.iterator();
               while( tagItr.hasNext() ) {         
                  hashTagsList.add( tagItr.next() );
               }
               return hashTagsList;
      }
      
   
   
   
   
   
   //caption #기준으로 나누기
   private static String split1(String text){
      String[] splitArray;
      
      String caption="";
      //1.일단 공백기준으로 나눔
      splitArray = text.split(" ");  //공백을 기준으로 나누기
      String[] splitArray2=new String[splitArray.length*2]; //공백없이 복사할 배열(크기2배)
      
      //2. null값 제외하고 복사 (띄어쓰기가 의미없이 여러번 있을경우 대비)
      int size=0;
      for(int i=0; i<splitArray.length; i++){
         if(!splitArray[i].equals("")){
            splitArray2[size]=splitArray[i];
            size++;
         }
      }

      //3.뒤에 null 제거한 새로운 배열
      String[] splitArray3=new String[size];
      for(int i=0; i<size; i++){
         splitArray3[i]=splitArray2[i];         
      }
   
      //특수문자
         String special="!$%^&*()-=+<>?";

       for(int i=0; i<splitArray3.length; i++){
             //2번째글자가 특수문자가 아니면, 두글자 이상이고
             if(splitArray3[i].length()!=1 && special.indexOf(splitArray3[i].charAt(1))==-1){
                splitArray3[i]=splitArray3[i].replaceAll("#", " #"); 
                splitArray3[i]=splitArray3[i].replaceAll("@", " @"); 
             } //end if   
       }  //end for
      
       //4. 처리완료한 새로운 문자열 생성
      for(int i=0; i<splitArray3.length; i++){
         caption+=" "+splitArray3[i];            
      }

      return caption;
   }
   
   
   
   
}