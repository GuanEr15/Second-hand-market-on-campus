package com.guaner.bean;

import com.guaner.bean.CodeMsg;

/**
 * ajax提交统一返回结果类
 * @author Administrator
 *
 */
public class Result<T> {
	
	private int code;//错误码
	
	private String msg;//返回的具体信息
	
	private T data;//定义返回的数据

	private Result(){}//构造函数私有化,不允许任意创建对象
	
	/**
	 * 定义传codemsg的私有化构造函数，不允许外部创建对象
	 * @param codeMsg 代码
	 */
	private Result(CodeMsg codeMsg){
		if(codeMsg != null){
			this.code = codeMsg.getCode();
			this.msg = codeMsg.getMsg();
		}
	}
	
	/**
	 * 定义传指定数据对象和codemsg的私有化构造函数，不允许任意创建对象
	 * @param data 数据
	 * @param codeMsg 代码
	 * @return
	 */
	private Result(T data,CodeMsg codeMsg){
		if(codeMsg != null){
			this.code = codeMsg.getCode();
			this.msg = codeMsg.getMsg();
		}
		this.data = data;
	} 
	
	/**
	 * 定义统一的成功返回函数
	 * @param data 数据
	 * @return 数据
	 */
	public static <T>Result<T> success(T data){
		return new Result<T>(data,CodeMsg.SUCCESS);
	}

	/**
	 * 统一错误返回方法，所有错误都调用此方法
	 * @param codeMsg 代码
	 * @return 数据
	 */
	public static <T>Result<T> error(CodeMsg codeMsg){
		return new Result<T>(codeMsg);
	}
	
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	
	
}
