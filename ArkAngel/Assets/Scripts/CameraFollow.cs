using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraFollow : MonoBehaviour
{
    Transform player;
    Transform camera;
    private const int yOffset=3;
    private const int xOffset=4;
    private int move = 1;
    private int cameraMove = 0;
    // Start is called before the first frame update
    void Start()
    {
        player = GameObject.FindGameObjectWithTag("Player").GetComponent<Transform>();
        camera = GetComponent<Transform>();
    }

    // Update is called once per frame
    void Update()
    {
        //May have to change later
        camera.position = new Vector3(player.position.x, player.position.y, -10);
    }
}
