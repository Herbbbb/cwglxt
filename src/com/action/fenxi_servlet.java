package com.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DB;
import com.util.DateUtils;

public class fenxi_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
		DB mydb=new DB();
		String nowYear = DateUtils.formatDate2Str(new Date(), "yyyy");
		try{
			
			//增加的资产
			String sql = "select count(1)shuliang,ifnull(sum(jiazhi),0)jiazhi from t_zichan where type=0 and shijian like '"+nowYear+"%'";
			mydb.doPstm(sql, null);
			ResultSet rs=mydb.getRs();
			rs.next();
			double zjzcjz = rs.getDouble("jiazhi");
			Map zczj = new HashMap();
			zczj.put("sl", rs.getString("shuliang"));
			zczj.put("jz", zjzcjz);
			rs.close();
			
			//减少的资产
			sql = "select count(1)shuliang,ifnull(sum(jiazhi),0)jiazhi from t_zichan where type=1 and shijian like '"+nowYear+"%'";
			mydb.doPstm(sql, null);
			rs=mydb.getRs();
			rs.next();
			double jszcjz = rs.getDouble("jiazhi");
			Map zcjs = new HashMap();
			zcjs.put("sl", rs.getString("shuliang"));
			zcjs.put("jz", jszcjz);
			rs.close();
			
			//总资产
			Map zongzichan = new HashMap();	//总资产
			double zzc = zjzcjz-jszcjz;
			zongzichan.put("zichan", zzc);
			
			//利润
			sql = "select 1, ifnull(sum(touru),0)touru,ifnull(sum(shouyi),0)shouyi,ifnull(sum(lirun),0)lirun " +
				  "from t_jingying where riqi like '"+nowYear+"%'";
			mydb.doPstm(sql, null);
			rs=mydb.getRs();
			rs.next();
			Map jingying = new HashMap();
			jingying.put("touru", rs.getDouble("touru"));
			jingying.put("shouyi", rs.getDouble("shouyi"));
			double zly = rs.getDouble("lirun");
			jingying.put("lirun", zly);
			rs.close();
			
			Map nz = new HashMap();
			nz.put("nz",zzc+zly);
			
			req.setAttribute("zczj", zczj); //{sl=5, jz=33530.0}
			req.setAttribute("zcjs", zcjs);	//{sl=2, jz=9200.0}
			req.setAttribute("zongzichan", zongzichan);	//{zichan=24330.0}
			req.setAttribute("jingying", jingying);	//{lirun=200.0, touru=8000.0, shouyi=8200.0}
			req.setAttribute("nz", nz);	//{nz=24530.0}
			
			//获取上述的所有财务信息之后，存储到本地文件
			
			//获取增长资产的数量
			String slAdd =  zczj.get("sl").toString();
			//获取增加资产的价值
			String zcAdd =  zczj.get("jz").toString();
			//获取减少资产的数量
			String slMul =  zcjs.get("sl").toString();
			//获取减少资产的价值
			String zcMul =  zcjs.get("jz").toString();
			//获取总资产
			String zichan = zongzichan.get("zichan").toString();
			//获取利润
			String lirun = jingying.get("lirun").toString();
			//获取投入
			String touru = jingying.get("touru").toString();
			//获取收益
			String shouyi = jingying.get("shouyi").toString();
			//获取年终资产
			String nzzc = nz.get("nz").toString();
			
			
			System.out.println(slAdd+"------------"+zcAdd+"------------"+slMul+"------------"+zcMul+"------------"+zichan+"------------"+lirun+"------------"+touru+"------------"+shouyi+"------------"+nzzc+"------------");
			//TextToFile();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		req.getRequestDispatcher("admin/fenxi/fenxi.jsp").forward(req, res);
	}

	public void dispatch(String targetURI,HttpServletRequest request,HttpServletResponse response) 
	{
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(targetURI);
		try 
		{
		    dispatch.forward(request, response);
		    return;
		} 
		catch (ServletException e) 
		{
             e.printStackTrace();
		} 
		catch (IOException e) 
		{
			
		    e.printStackTrace();
		}
	}
	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);
	}
	
	public void destroy() 
	{
		
	}
	
	//定义一个将数据存储带本地文件的方法
	public static void TextToFile() { 
			FileOutputStream fop = null;
		  File file;
		  String content = "This is the text content";
		   
		  try {
		   
		   file = new File("‪C:/Users/only--one/Desktop/message.txt");
		   fop = new FileOutputStream(file);
		   
		   // if file doesnt exists, then create it
		   if (!file.exists()) {
		    file.createNewFile();
		   }
		   
		   // get the content in bytes
		   byte[] contentInBytes = content.getBytes();
		   
		   fop.write(contentInBytes);
		   fop.flush();
		   fop.close();
		   
		   System.out.println("Done");
		   
		  } catch (IOException e) {
		   e.printStackTrace();
		  } finally {
		//java怎么把数据存到本地文件
		    
		try {
		    if (fop != null) {
		     fop.close();
		    }
		   } catch (IOException e) {
		    e.printStackTrace();
		   }
		  }
		 }
	
}
