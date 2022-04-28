package kr.or.ddit.utils;

import lombok.Data;

import org.springframework.http.HttpStatus;

/* Rest Api 응답 공통 vo */
/**
 * @FileName : ApiResultVo.java
 * @Project : final_project
 * @Date : 2022. 3. 13.
 * @작성자 : LJH
 * @변경이력 :
 * @프로그램 설명 : json 통신의 응답값을 셋팅하는 vo
 */
@Data
public class ApiResultVo<E> {

	// <E>의미는 파라미터로 해당타입을 받을 수 있다.

	// 응답코드
	private HttpStatus statusCode = HttpStatus.OK;

	// 성공여부 메세지
	private String message = "success";

	// 성공여부
	private boolean check = true;

	// 화면에 넘길 json데이터 generic타입
	private E response;

}
