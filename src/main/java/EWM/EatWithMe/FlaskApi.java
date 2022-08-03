package EWM.EatWithMe;

import EWM.EatWithMe.controller.PreferController;
import EWM.EatWithMe.domain.Preferdata;
import EWM.EatWithMe.mapper.PreferMapper;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
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

import java.util.ArrayList;
import java.util.List;



@Service
@RestController
public class FlaskApi {

    @Autowired
    private PreferMapper preferMapper;

    @GetMapping("/rec/{user_id}")
    public FlaskResponseDto requestToFlask(@PathVariable("user_id") int userid) throws Exception {
        RestTemplate restTemplate = new RestTemplate();
        String url = "http://localhost:5000/tospring";

        // Header set
        // JSON 데이터 형식
        var httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);

        // Body set
        // {
        //     "item_idx" : [  ],
        //     "rating_idx" : [  ]
        // }

        // flask server에 json 형식으로 전송하기 위한 데이터 생성
        MultiValueMap<String, List> body = new LinkedMultiValueMap<>();

        // db에서 특정 사용자의 rating 정보 가져오기
        List<Preferdata> input_data = preferMapper.getById(userid);

        int input_data_size = input_data.size(); //사용자가 평점을 매긴 rating 수

        List item_idx = new ArrayList();
        List rating_idx = new ArrayList();

        // db에 담긴 사용자의 item, rating 정보를 list로 받아옴.
        for(int i=0; i < input_data_size; ++i){
            //System.out.println(i);
            item_idx.add(input_data.get(i).getStore_id());
            rating_idx.add(input_data.get(i).getRating());
        }

        //System.out.println(item_idx);
        //System.out.println(rating_idx);

        // body에 추가
        body.add("item", item_idx);
        body.add("rating", rating_idx);

        // Combine Message
        HttpEntity<?> requestMessage = new HttpEntity<>(body, httpHeaders);

        // Request and getResponse
        HttpEntity<String> response = restTemplate.postForEntity(url, requestMessage, String.class);
        //HttpEntity<String> response = restTemplate.getForEntity(url, String.class);
        // Response Body 파싱
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT, true);
        FlaskResponseDto dto = objectMapper.readValue(response.getBody(), FlaskResponseDto.class);

        //System.out.println("test");

        return dto;
    }
}