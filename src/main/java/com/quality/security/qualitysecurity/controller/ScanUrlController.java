package com.quality.security.qualitysecurity.controller;

import com.quality.security.qualitysecurity.entity.Component;
import com.quality.security.qualitysecurity.service.UrlDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ScanUrlController {
    @Autowired
    private UrlDataService urlDataService;

    @GetMapping("/get-resource")
    @ResponseBody
    public List<Component> getDataFromUrl(@RequestParam String url) {
        System.out.println(url);
        return urlDataService.getAllComponent();
    }

    @GetMapping("/")
    public String getIndex() {
        return "index";
    }
}
