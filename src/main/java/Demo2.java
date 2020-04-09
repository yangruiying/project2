import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import sun.misc.BASE64Decoder;

import javax.net.ssl.SSLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;
@WebServlet(name = "Demo2")
public class Demo2 extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");//放在第一行
        doGet(request,response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置网页响应类型
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type", "text/html;charset=UTF-8");
        //实现具体操作
        PrintWriter out = response.getWriter();

        String a=request.getParameter("file");
        StringBuilder s = new StringBuilder(a);
        for (int i=0;i<s.length();i++)
        {
            if(s.charAt(i)=='\\'){
                s.insert(i,'\\');
                i++;
            }
        }
        a=s.toString();
        String stringBlob = (String) request.getParameter("img2");
        Blob blob=null;
        try {
            blob =  new SerialBlob(stringBlob.getBytes("GBK"));

        } catch (SQLException e) {
            e.printStackTrace();
        }

        String base = request.getParameter("img2");



        String str = faceTest(base);

        JSONObject json = JSON.parseObject(str);
//        request.setAttribute( "ValueA ",a);
//        request.getRequestDispatcher( "网址/jsp页面 ").forward(request,response);
        String address = json.getJSONArray("cards").getJSONObject(0).getString("address");
        String birthday = json.getJSONArray("cards").getJSONObject(0).getString("birthday");
        String gender = json.getJSONArray("cards").getJSONObject(0).getString("gender");
        String id_card_number = json.getJSONArray("cards").getJSONObject(0).getString("id_card_number");
        String name = json.getJSONArray("cards").getJSONObject(0).getString("name");
        String race = json.getJSONArray("cards").getJSONObject(0).getString("race");
        request.setAttribute("address",address);
        request.setAttribute("birthday",birthday);
        request.setAttribute("gender",gender);
        request.setAttribute("id_card_number",id_card_number);
        request.setAttribute("name",name);
        request.setAttribute("race",race);
        request.getRequestDispatcher("/showIdCard.jsp").forward(request,response);

        System.out.println(request.getParameter("img2"));
//        System.out.println(str);
//        System.out.println(json.getJSONArray("cards").getJSONObject(0).getString("address"));


    }
    public String faceTest(String base){
        String base64=base.split(",")[1];
        GenerateImage(base64,"photo.jpg");
        File file = new File("photo.jpg");
        BASE64Decoder decode = new BASE64Decoder();
        //byte[] buff=null;
        byte[] buff = getBytesFromFile(file);

        //String b1=Base64.encodeBase64String(buff1);
        //System.out.println(b1);
        String url = "https://api-cn.faceplusplus.com/cardpp/v1/ocridcard";
        HashMap<String, String> map = new HashMap<>();
        HashMap<String, byte[]> byteMap = new HashMap<>();
        map.put("api_key", "MZUq7uXaL0AxnZKfBAg-3coRj2qKdeoU");
        map.put("api_secret", "FZtbjUgi64hsGOlWyxTtgQJcg4OgnohA");
        map.put("return_landmark", "1");
        map.put("return_attributes", "gender,age,smiling,headpose,facequality,blur,eyestatus,emotion,ethnicity,beauty,mouthstatus,eyegaze,skinstatus");
        byteMap.put("image_file", buff);
        String str=null;
        try{

            byte[] bacd = post(url, map, byteMap);
            str = new String(bacd);

        }catch (Exception e) {
            e.printStackTrace();
        }
        return str;
    }
    private final static int CONNECT_TIME_OUT = 30000;
    private final static int READ_OUT_TIME = 50000;
    private static String boundaryString = getBoundary();
    protected static byte[] post(String url, HashMap<String, String> map, HashMap<String, byte[]> fileMap) throws Exception {
        HttpURLConnection conne;
        URL url1 = new URL(url);
        conne = (HttpURLConnection) url1.openConnection();
        conne.setDoOutput(true);
        conne.setUseCaches(false);
        conne.setRequestMethod("POST");
        conne.setConnectTimeout(CONNECT_TIME_OUT);
        conne.setReadTimeout(READ_OUT_TIME);
        conne.setRequestProperty("accept", "*/*");
        conne.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundaryString);
        conne.setRequestProperty("connection", "Keep-Alive");
        conne.setRequestProperty("user-agent", "Mozilla/4.0 (compatible;MSIE 6.0;Windows NT 5.1;SV1)");
        DataOutputStream obos = new DataOutputStream(conne.getOutputStream());
        Iterator iter = map.entrySet().iterator();
        while(iter.hasNext()){
            Map.Entry<String, String> entry = (Map.Entry) iter.next();
            String key = entry.getKey();
            String value = entry.getValue();
            obos.writeBytes("--" + boundaryString + "\r\n");
            obos.writeBytes("Content-Disposition: form-data; name=\"" + key
                    + "\"\r\n");
            obos.writeBytes("\r\n");
            obos.writeBytes(value + "\r\n");
        }
        if(fileMap != null && fileMap.size() > 0){
            Iterator fileIter = fileMap.entrySet().iterator();
            while(fileIter.hasNext()){
                Map.Entry<String, byte[]> fileEntry = (Map.Entry<String, byte[]>) fileIter.next();
                obos.writeBytes("--" + boundaryString + "\r\n");
                obos.writeBytes("Content-Disposition: form-data; name=\"" + fileEntry.getKey()
                        + "\"; filename=\"" + encode(" ") + "\"\r\n");
                obos.writeBytes("\r\n");
                obos.write(fileEntry.getValue());
                obos.writeBytes("\r\n");
            }
        }
        obos.writeBytes("--" + boundaryString + "--" + "\r\n");
        obos.writeBytes("\r\n");
        obos.flush();
        obos.close();
        InputStream ins = null;
        int code = conne.getResponseCode();
        try{
            if(code == 200){
                ins = conne.getInputStream();
            }else{
                ins = conne.getErrorStream();
            }
        }catch (SSLException e){
            e.printStackTrace();
            return new byte[0];
        }
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        byte[] buff = new byte[4096];
        int len;
        while((len = ins.read(buff)) != -1){
            baos.write(buff, 0, len);
        }
        byte[] bytes = baos.toByteArray();
        ins.close();
        return bytes;
    }
    private static String getBoundary() {
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for(int i = 0; i < 32; ++i) {
            sb.append("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-".charAt(random.nextInt("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_".length())));
        }
        return sb.toString();
    }
    private static String encode(String value) throws Exception{
        return URLEncoder.encode(value, "UTF-8");
    }

    public static byte[] getBytesFromFile(File f) {
        if (f == null) {
            return null;
        }
        try {
            FileInputStream stream = new FileInputStream(f);
            ByteArrayOutputStream out = new ByteArrayOutputStream(1000);
            byte[] b = new byte[1000];
            int n;
            while ((n = stream.read(b)) != -1) {
                out.write(b, 0, n);
            }
            stream.close();
            out.close();
            return out.toByteArray();
        } catch (IOException e) {
        }
        return null;
    }

    public static boolean GenerateImage(String base64str, String savePath) {
        //对字节数组字符串进行Base64解码并生成图片
        if (base64str == null) {
            return false;
        }
        BASE64Decoder decoder = new BASE64Decoder();
        try {
            //Base64解码
            byte[] b = decoder.decodeBuffer(base64str);
            for (int i = 0; i < b.length; ++i) {
                //调整异常数据
                if (b[i] < 0) {
                    b[i] += 256;
                }
            }
            //生成jpeg图片
            OutputStream out = new FileOutputStream(savePath);
            out.write(b);
            out.flush();
            out.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }






}
