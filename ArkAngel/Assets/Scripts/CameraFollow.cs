using UnityEngine;                                                                                                                         

public class CameraFollow : MonoBehaviour               
{
    #region Cameras
    //The camera 
    private Camera cam;
    #endregion

    #region Transforms
    [HideInInspector]
    //Players position
    public Transform target;
    #endregion

    #region Floats
    // Size of orthographic camera from start
    public float camSize;

    //How close the camera says to the player
    public float sensitivity;

    //Size of the soft zones
    public float softX;
    public float softY;
    #endregion                                                                                                                                                                                                           

    private void Start()
    {
        #region Getting the components
        //Setting the camera
        cam = GetComponent<Camera>();
        //Setting the target
        target = GameObject.FindGameObjectWithTag("Player").transform;
        #endregion
    }

    private void FixedUpdate()                                                                      
    {
        #region Setting the cameras size
        //The cameras size
        cam.orthographicSize = camSize;
        #endregion

        #region Updating the camera position
        if (target.transform.position.x > transform.position.x + softX / 2)
        {
            Vector3 playerPos = new Vector3(target.position.x, transform.position.y, -10);
            transform.position = Vector3.Lerp(new Vector3(transform.position.x - softX / 15, transform.position.y, -10), playerPos, sensitivity * Time.deltaTime);
        }

        if (target.transform.position.x < transform.position.x - softX / 2)
        {
            Vector3 playerPos = new Vector3(target.position.x, transform.position.y, -10);
            transform.position = Vector3.Lerp(new Vector3(transform.position.x + softX / 15, transform.position.y, -10), playerPos, sensitivity * Time.deltaTime);
        }

        if (target.transform.position.y > transform.position.y + softY / 2)
        {
            Vector3 playerPos = new Vector3(transform.position.x, target.position.y, -10);
            transform.position = Vector3.Lerp(new Vector3(transform.position.x, transform.position.y - softY / 15, -10), playerPos, sensitivity * Time.deltaTime);
        }

        if (target.transform.position.y < transform.position.y - softY / 2)
        {
            Vector3 playerPos = new Vector3(transform.position.x, target.position.y, -10);
            transform.position = Vector3.Lerp(new Vector3(transform.position.x, transform.position.y + softY / 15, -10), playerPos, sensitivity * Time.deltaTime);
        }
        #endregion
    }

    private void OnDrawGizmos()
    {
        #region Soft zone
        //Drawing the soft zones
        Gizmos.color = Color.red;
        Gizmos.DrawWireCube(transform.position, new Vector3(softX, softY, 1));
        #endregion
    }

}
