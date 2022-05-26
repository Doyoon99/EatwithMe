package EWM.EatWithMe;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

@RestController
//@RequestMapping(value = "/test", method = RequestMethod.GET)

public class pythonController {


    @RequestMapping("test")
    public String Test(Model model) {

        // https://hongku.tistory.com/116

        String url = "http://127.0.0.1:5000/tospring";
        String sb = "";
        try {
            HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
            // openConnection() : 실제 네트워크 연결을 설정하지 않고, URLConnection 클래스의 인스턴스를 반환함.

            // https://blueyikim.tistory.com/2199
            // 실제 내용을 읽기 위해 연결에서 InputStream 인스턴스를 얻는다.
            // 문자 데이터를 읽기 위해 InputStream을 InputStreamReader로 래핑한다.
            // 데이터를 문자열로 읽기 위해 InputStream을 BufferedReader로 래핑한다.
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

            String line = null;

            while ((line = br.readLine()) != null) {
                sb = sb + line + "\n";
            }
            System.out.println("========br======" + sb.toString());
            if (sb.toString().contains("ok")) {
                System.out.println("test");
            }
            br.close();

            System.out.println("" + sb.toString());

        } catch (MalformedURLException e) {
            e.printStackTrace();

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        // mav.addObject("변수이름", "변수에 넣을 데이터값") # 뷰에 보낼 데이터값
        // mav.setViewName("뷰이름")
        model.addAttribute("test", sb.toString()); // "test1"는 jsp파일에서 받을때 이름,
        //sb.toString은 value값(여기에선 test)
        model.addAttribute("fail", false);
        //mav.setViewName("test");

        return "test";
    }
}
