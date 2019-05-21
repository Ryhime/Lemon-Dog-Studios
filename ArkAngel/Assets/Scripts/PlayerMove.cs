using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMove : MonoBehaviour
{
    Rigidbody2D rb;
    [SerializeField]
    private float moveSpeed=10;
    private void Start()
    {
        rb = GetComponent<Rigidbody2D>();
        rb.freezeRotation = true;
    }
    // Update is called once per frame
    void Update()
    {
        walk();
    }
    void walk()
    {
        if (Input.GetKey(KeyCode.D) || Input.GetKey("right"))
        {
            rb.velocity = new Vector2(moveSpeed, rb.velocity.y);
        }
        else if (Input.GetKey(KeyCode.A) || Input.GetKey("left"))
        {
            rb.velocity = new Vector2(-moveSpeed, rb.velocity.y);
        }
        else
        {
            rb.velocity = new Vector2(0, rb.velocity.y);
        }
    }
}
