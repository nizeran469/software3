package com.asay.wetrip.util;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class FlightTrainTask {
	public static int topicId=6;
    @Scheduled(cron = "0 0 23 * * ? ") // 每天晚上24点更新话题id
    public void taskCycle() {       
        topicId+=1;
        System.out.println(topicId);       
    }
}