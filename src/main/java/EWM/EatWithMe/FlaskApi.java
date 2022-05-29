package EWM.EatWithMe;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;


@Service
@RestController
public class FlaskApi {

    //private final FileService fileService;

    @RequestMapping("/python")
    public FlaskResponseDto requestToFlask(String userid) throws Exception {
        RestTemplate restTemplate = new RestTemplate();
        String url = "http://localhost:5000/tospring";

        // Header set
        // JSON 데이터 형식
        var httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);

        // Body set
        // {
        //     "username" : userid
        // }
        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
        body.add("username", userid);

        // Combine Message
        HttpEntity<?> requestMessage = new HttpEntity<>(body, httpHeaders);

        // Request and getResponse
        //HttpEntity<String> response = restTemplate.postForEntity(url, requestMessage, String.class);
        HttpEntity<String> response = restTemplate.getForEntity(url, String.class);
        // Response Body 파싱
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT, true);
        FlaskResponseDto dto = objectMapper.readValue(response.getBody(), FlaskResponseDto.class);

        System.out.println("test");

        return dto;
    }
}
