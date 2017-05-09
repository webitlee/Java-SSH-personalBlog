package com.blacklee.admin.entity;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class Test {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		File file = new File("d:/y.txt");
		FileInputStream fis = new FileInputStream(file);
		BufferedReader br = new BufferedReader(new InputStreamReader(fis));
		List<String> list = new ArrayList<>();
		String str = null;
		while( (str = br.readLine() )!= null){
			list.add(br.readLine());
		}
		System.out.println(list);
	}

}
