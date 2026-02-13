package com.trupti.item_api.controller;

import com.trupti.item_api.model.Item;
import com.trupti.item_api.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List; //IMPORTANT

@RestController
@RequestMapping("/items")
@CrossOrigin("*")
public class ItemController {

    @Autowired
    private ItemService itemService;

    // Add new item
    @PostMapping
    public Item addItem(@RequestBody Item item) {
        if (item.getName() == null || item.getName().isEmpty()) {
            throw new RuntimeException("Name is required");
        }
        return itemService.addItem(item);
    }

    // Get item by ID
    @GetMapping("/{id}")
    public Item getItem(@PathVariable int id) {
        return itemService.getItemById(id);
    }

    //Get all items
    @GetMapping
    public List<Item> getAllItems() {
        return itemService.getAllItems();
    }
}
