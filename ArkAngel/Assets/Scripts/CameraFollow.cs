﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraFollow : MonoBehaviour
{
    Transform player;
    Transform camera;
    [SerializeField]
    private int yOffset=0;
    [SerializeField]
    private int xOffset=0;
    // Start is called before the first frame update
    void Start()
    {
        player = GameObject.FindGameObjectWithTag("Player").GetComponent<Transform>();
        camera = GetComponent<Transform>();
    }

    // Update is called once per frame
    void Update()
    {
        if (camera.position != player.position) { camera.position = new Vector3(player.position.x+xOffset, player.position.y+yOffset,-10); }
    }
}
