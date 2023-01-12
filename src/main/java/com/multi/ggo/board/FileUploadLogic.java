package com.multi.ggo.board;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

//serviceImpl 역활인듯?

@Service
public class FileUploadLogic {
	//파일을 업로드한 후 이 정보를 BoardFileDTO로 변환해서 리턴
	
	public List<Board_FileDTO> uploadFiles(List<MultipartFile> multipartFiles, String path) throws IllegalStateException, IOException{
		List<Board_FileDTO> filedtolist = new ArrayList<Board_FileDTO>();
		for(MultipartFile multipartFile:multipartFiles) {
			if(!multipartFile.isEmpty()) { //multipartFile 내용이 있으면, 아래꺼 실행해
				// 클라이언트가 업로드한 파일명
				String originalFilename = multipartFile.getOriginalFilename(); //getOriginalFilename() 메서드가있음. 
				  
				//서버에서 식별할수 있도록 파일명을 변경 ( 파일명 중복시 덮어쓰는문제 )
				String storeFilename = createStoreFilename(originalFilename); //아래에서 uuid 만드는 메서드 (createStoreFilename)
				System.out.println("__________orignalFilename : "+originalFilename);
				
				// 파일객체를 실제 경로에 저장
				// 경로 (...WEB-INF..upload) + 구분(File.separator) + 원래파일이름
				multipartFile.transferTo(new File(path + File.separator + storeFilename));   //transferTo().메서드가있음
				
				//파일업로드가 완료되면, MultipartFile을 >>>  Board_FileDTO에 넣어주게끔
				filedtolist.add(new Board_FileDTO(originalFilename, storeFilename));
				
				
			}
		}
		return filedtolist;
	}
	
	
	//클라이언트가 입력한 파일명을 식별할수 있도록 중복없는 코드로 변경
	//UUID 를 이용 ( 32자리의 16진수로 표기 )
	private String createStoreFilename(String orignalFilename) {
		int pos = orignalFilename.lastIndexOf(".");
		String ext = orignalFilename.substring(pos+1);
		String uuid = UUID.randomUUID().toString();
		return uuid+"."+ext;
	}
	
	
	
	
	
	
}
