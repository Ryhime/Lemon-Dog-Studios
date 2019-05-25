using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraFollow : MonoBehaviour
{
    Transform player;
    Transform camera;
    int move = 1;
    int cameraMove = 0;
    float x;
    float y;
    float xCheck;
    float yCheck;

    float abs(float num)
    {
        if (num < 0){ num *= -1; }
        return num;
    }
    // Start is called before the first frame update
    void Start()
    {
        player = GameObject.FindGameObjectWithTag("Player").GetComponent<Transform>();
        camera = GetComponent<Transform>();
        x = player.position.x;
        y = player.position.y;
    }

    // Update is called once per frame
    void Update()
    {
        camera.position = new Vector3(player.position.x, player.position.y, -10);
    }
}
