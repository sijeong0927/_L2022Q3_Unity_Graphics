using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Light_KeyController : MonoBehaviour
{
    public GameObject Light;
    bool isOn;

    void Start()
    {
        isOn = false;
        Light.SetActive(isOn);
    }

    // Update is called once per frame
    void Update()
    {
        if(Input.GetKeyDown(KeyCode.L))
        {
            print("L Down");
            isOn = !isOn;
            Light.SetActive(isOn);
            // Light.SetActive(true);
        }
    }

    private void OnMouseDown()
    {
        print(gameObject.name);
        isOn = !isOn;
        Light.SetActive(isOn);
    }
}
