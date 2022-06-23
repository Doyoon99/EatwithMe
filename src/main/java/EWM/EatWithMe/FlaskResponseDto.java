package EWM.EatWithMe;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;

@NoArgsConstructor
@Getter
@Data
public class FlaskResponseDto {

    private List<String> item;

    public FlaskResponseDto(List<String> item){
        this.item = item;

    }
}