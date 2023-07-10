package mainproject.cafeIn.domain.post.dto.response;

import mainproject.cafeIn.domain.tag.entity.PostTag;

import java.util.List;

public class PostResponse {
    private Long postId;
    private String image;
    private String title;
    private String author;

    public PostResponse(Long postId, String image, String title, String author) {
        this.postId = postId;
        this.image = image;
        this.title = title;
        this.author = author;
    }
}
