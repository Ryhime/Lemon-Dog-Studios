using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Debugging : MonoBehaviour
{
    [SerializeField]
    private bool isTesting;
    private int moveScene = 0;
    // Update is called once per frame
    void Update()
    {
        if (isTesting) { bugTesting(); }
    }

    void bugTesting()
    {
        switchScene();
    }

    void switchScene()
    {
        if (Input.GetKeyDown(KeyCode.P)) {
            moveScene = 1;
            Debug.Log("FORWARD");
        }
        if (Input.GetKeyDown(KeyCode.Q)) {
            moveScene = -1;
            Debug.Log("BACK");
        }
        if (moveScene != 0) {
            SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex + moveScene);
            moveScene = 0;
        }
    }
}
