using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMove : MonoBehaviour
{
    Vector2 playerScale;
    Rigidbody2D rb;
    Transform trans;
    //Movement
    bool isRunning = false;
    [SerializeField]
    float moveSpeed = 10;
    int move = 1;
    //Jump
    [SerializeField]
    float jumpForce = 500;
    bool canJump = false;
    //Crouching
    private bool isCrouching = false;
    //Sliding
    bool isSliding = false;
    int slideCool = 0;
    [SerializeField]
    int slideCoolMx;
    [SerializeField]
    int slidingDistanceMx = 15;
    int slidingDistance;
    [SerializeField]
    float slideSpeed;
    int slideDirection = 1;

    private void Start()
    {
        slideCool = slideCoolMx;
        rb = GetComponent<Rigidbody2D>();
        rb.freezeRotation = true;
        trans = GetComponent<Transform>();
        playerScale = trans.localScale;
    }

    void Update()
    {
        slide();
        if (!isSliding)
        {
            crouch();
            walk();
        }
        if (Input.GetKeyDown(KeyCode.Space) && canJump) { jump(); }
    }

    void slide()
    {
        if (isRunning && (Input.GetKeyDown("down") || Input.GetKeyDown(KeyCode.S)) && slideCool>=slideCoolMx)
        {
            trans.position = new Vector2(trans.position.x, trans.position.y - (playerScale.y / 2));
            slideDirection = move;
            isSliding = true;
            slideCool = 0;
        }
        else if (!isSliding)
        {
            slideCool++;
        }

        if (isSliding)
        {
            slidingDistance++;
            rb.velocity = new Vector2(slideDirection*slideSpeed,rb.velocity.y);
            trans.localScale = new Vector3(playerScale.x * 2, playerScale.y / 2, 0);
            if (slidingDistance >= slidingDistanceMx)
            {
                isSliding = false;
                slidingDistance = 0;
            }
        }
        else
        {
            trans.localScale = playerScale;
        }
    }
    void crouch()
    {
        if ((Input.GetKey("down") || Input.GetKey(KeyCode.S)) && (!isRunning || isCrouching)) {
            Debug.Log("CROUCH");
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
        rb.AddForce(new Vector2(0,jumpForce));
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
            move = 1;
            isRunning = true;
            rb.velocity = new Vector2(moveSpeed,rb.velocity.y);
        }
        else if (Input.GetKey("left") || Input.GetKey(KeyCode.A))
        {
            move = -1;
            isRunning = true;
            rb.velocity = new Vector2(-moveSpeed, rb.velocity.y);
        }
        else {
            move = 0;
            rb.velocity = new Vector2(0, rb.velocity.y);
            isRunning = false;
        }
    }
}
