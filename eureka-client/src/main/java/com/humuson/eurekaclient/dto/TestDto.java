package com.humuson.eurekaclient.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class TestDto {

    private String productName;
    private int cost;
    private int orderId;
}
