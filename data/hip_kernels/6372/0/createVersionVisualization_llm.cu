#include "hip/hip_runtime.h"
#include "includes.h"
/**
* @file
* @brief     CIS 565 Version Checker
* @details   A simple CUDA hello-world-style program for Patrick Cozzi's
*            CIS 565: GPU Programming, at the University of Pennsylvania.
* @authors   Starter code: Yining Karl Li, Liam Boone, Harmony Li, Kai Ninomiya
* @copyright University of Pennsylvania
*/

__global__ void createVersionVisualization(uchar4* PBOpos, int width, int height, int major, int minor) {
    int x = (blockIdx.x * blockDim.x) + threadIdx.x;
    int y = (blockIdx.y * blockDim.y) + threadIdx.y;

    // Check if the thread is within bounds
    if (x < width && y < height) {
        int index = x + (y * width);

        // Set initial pixel color to black
        PBOpos[index] = {0, 0, 0, 0};

        // Select version based on y position
        int ver = y < height / 2 ? major : minor;

        // Set pixel color based on version
        switch (ver) {
            case 0:
                PBOpos[index].x = 255;
                break;
            case 1:
                PBOpos[index].y = 255;
                break;
            case 2:
                PBOpos[index].z = 255;
                break;
            case 3:
                PBOpos[index].x = 255;
                PBOpos[index].y = 255;
                break;
            case 5:
                PBOpos[index].z = 255;
                PBOpos[index].y = 255;
                break;
        }
    }
}