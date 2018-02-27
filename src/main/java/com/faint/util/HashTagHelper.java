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
		
	public static List<String> getAllHashTags(String caption) {			
		//태그를 담을 set
		HashSet<String> set = new HashSet<>(DEFAULT_CAPACITY);
		//현재 인덱스
		int curIdx = 0;
		//시작 인덱스
		int startIdx = 0;

		while (curIdx < caption.length()) {
			if (caption.charAt(curIdx) == '#') {
				startIdx = curIdx++;
				
				while ( curIdx < caption.length() ) {
					char curChar = caption.charAt(curIdx);
					if( isEndOfTag(curChar) ) {
						break;
					} else {
						curIdx++;
					}
				}
				String tag = caption.substring(startIdx + 1, curIdx);
				// 빈 문자열이 아니면
				if ( !tag.isEmpty() ) { 
					set.add(tag);
				}
			} else {
				curIdx++;
			}
		}
		
		//반환할 태그 리스트( 동적 증가 방지를 위해 초기 capacity == set.size() )
		List<String> hashTagsList = new ArrayList<>(set.size());
		Iterator<String> tagItr = set.iterator();
		while( tagItr.hasNext() ) {			
			hashTagsList.add( tagItr.next() );
		}
		return hashTagsList;
	}
	
	private static boolean isEndOfTag(char ch) {
		switch(ch) {
		case ' ':
		case '#':
		case '\n':
			return true;
		default :
			return false;
		}
	}
	
	
	
	
}
