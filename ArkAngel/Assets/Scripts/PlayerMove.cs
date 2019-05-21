using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMove : MonoBehaviour
{
    Rigidbody2D rb;
    Transform trans;
    [SerializeField]
    private float moveSpeed=1;
    [SerializeField]
    private float jumpForce = 10;
    private bool canJump = false;
    private bool isRunning = false;
    private Vector2 playerScale;
    private bool isCrouching = false;

    private void Start()
    {
        rb = GetComponent<Rigidbody2D>();
        rb.freezeRotation = true;
        trans = GetComponent<Transform>();
        playerScale = trans.localScale;
    }

    void Update()
    {
        walk();
        if (Input.GetKeyDown(KeyCode.Space) && canJump) { jump(); }
        crouch();
    }

    void crouch()
    {
        if (Input.GetKey("down") || Input.GetKey(KeyCode.S) && !isRunning) {
            trans.localScale = new Vector2(playerScale.x, playerScale.y / 2);
            if (!isCrouching) { trans.position = new Vector2(trans.position.x, trans.position.y - (playerScale.y / 2)); }
            isCrouching = true;
        }
        else {
            trans.localScale = new Vector2(playerScale.x, playerScale.y);
            isCrouching = false;
        }
        
    }

    void jump()
    {
        rb.AddForce(new Vector2(0,500));
    }

    private void OnCollisionEnter2D(Collision2D collision)
    {
        if (collision.collider.tag == "Ground") { canJump = true; } 
    }
    private void OnCollisionExit2D(Collision2D collision)
    {
        if (collision.collider.tag == "Ground") { canJump = false; }
    }

    void walk()
    {
        if (Input.GetKey("right") || Input.GetKey(KeyCode.D))
        {
            isRunning = true;
            trans.position = new Vector2(trans.position.x + moveSpeed, trans.position.y);
        }
        else if (Input.GetKey("left") || Input.GetKey(KeyCode.A))
        {
            isRunning = true;
            trans.position = new Vector2(trans.position.x - moveSpeed, trans.position.y);
        }
        else { isRunning = false; }
    }
}
