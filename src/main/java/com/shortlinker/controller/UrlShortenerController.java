package com.shortlinker.controller;

import com.shortlinker.service.UrlShortenerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

@CrossOrigin(origins = "https://mrunalinidudhagawali8.github.io/")
@RestController
@RequestMapping("/api")
public class UrlShortenerController {

    @Autowired
    private UrlShortenerService service;

    @PostMapping("/shorten")
    public ResponseEntity<String> shortenUrl(@RequestBody String originalUrl) {
        String shortCode = service.shortenUrl(originalUrl);
        return ResponseEntity.ok(shortCode);
    }

    @GetMapping("/{shortCode}")
    public RedirectView redirect(@PathVariable String shortCode) {
        String originalUrl = service.getOriginalUrl(shortCode);
        if (originalUrl != null) {
            return new RedirectView(originalUrl);
        } else {
            // Redirect to a 404 page (you can customize this)
            return new RedirectView("/404.html");
        }
    }
}
