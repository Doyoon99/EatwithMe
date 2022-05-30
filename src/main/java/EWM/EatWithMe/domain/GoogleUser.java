package EWM.EatWithMe.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor

public class GoogleUser {
    private Long id;
    private String name;
    private String email;
    private String picture;
}
