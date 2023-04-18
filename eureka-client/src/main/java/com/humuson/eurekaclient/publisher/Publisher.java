package com.humuson.eurekaclient.publisher;

import com.humuson.eurekaclient.dto.TestDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.stereotype.Component;
import org.springframework.util.concurrent.ListenableFuture;
import org.springframework.util.concurrent.ListenableFutureCallback;

@Slf4j
@Component
public class Publisher {

    @Value(value = "${topic.name}")
    private String testTopicName;

    private final KafkaTemplate<String, TestDto> testKafkaTemplate;

    public Publisher(KafkaTemplate<String, TestDto> testKafkaTemplate) {
        this.testKafkaTemplate = testKafkaTemplate;
    }

    public void publish(TestDto testDTO) {
        ListenableFuture<SendResult<String, TestDto>> future = testKafkaTemplate.send(testTopicName, testDTO);

        future.addCallback(new ListenableFutureCallback<SendResult<String, TestDto>>() {
            @Override
            public void onSuccess(SendResult<String, TestDto> result) {
                TestDto testDTO = result.getProducerRecord().value();
                log.info("Sent message=[" + testDTO.toString() + "] with offset=[" + result.getRecordMetadata().offset() + "]");
            }

            @Override
            public void onFailure(Throwable ex) {
                log.info( "Unable to send message=[" + testDTO.toString() + "] due to : " + ex.getMessage());
            }
        });
    }
}
