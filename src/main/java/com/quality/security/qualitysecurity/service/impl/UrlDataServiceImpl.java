package com.quality.security.qualitysecurity.service.impl;

import com.quality.security.qualitysecurity.entity.Component;
import com.quality.security.qualitysecurity.service.UrlDataService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Service
public class UrlDataServiceImpl implements UrlDataService {
    @Override
    public List<Component> getAllComponent() {
        Random random = new Random();
        Component component1 = new Component("component 1", random.nextInt(100));
        Component component2 = new Component("component 2", random.nextInt(100));
        Component component3 = new Component("component 3", random.nextInt(100));
        Component component4 = new Component("component 4", random.nextInt(100));
        Component component5 = new Component("component 5", random.nextInt(100));
        Component component6 = new Component("component 6", random.nextInt(100));
        Component component7 = new Component("component 7", random.nextInt(100));
        Component component8 = new Component("component 8", random.nextInt(100));
        Component component9 = new Component("component 9", random.nextInt(100));
        Component component10 = new Component("component 10", random.nextInt(100));
        List<Component> components = new ArrayList<>();
        components.add(component1);
        components.add(component2);
        components.add(component3);
        components.add(component4);
        components.add(component5);
        components.add(component6);
        components.add(component7);
        components.add(component8);
        components.add(component9);
        components.add(component10);
        return components;
    }
}
