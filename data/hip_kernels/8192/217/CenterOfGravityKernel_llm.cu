#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CenterOfGravityKernel(float *pointsCoordinates, float *centerOfGravity, int *activityFlag, int maxCells)
{
    int threadId = blockDim.x * blockIdx.y * gridDim.x  // calculate global thread ID
                 + blockDim.x * blockIdx.x
                 + threadIdx.x;

    // Use a single thread to compute the center of gravity
    if (threadId == 0) 
    {
        float xSum = 0.0f, ySum = 0.0f, zSum = 0.0f;
        int livingCells = 0;
        
        // Unrolling loop to optimize
        for (int c = 0; c < maxCells - 1; c += 2)
        {
            if (activityFlag[c] == 1) {
                xSum += pointsCoordinates[c * 3];
                ySum += pointsCoordinates[c * 3 + 1];
                zSum += pointsCoordinates[c * 3 + 2];
                livingCells++;
            }
            if (activityFlag[c + 1] == 1) {
                xSum += pointsCoordinates[(c + 1) * 3];
                ySum += pointsCoordinates[(c + 1) * 3 + 1];
                zSum += pointsCoordinates[(c + 1) * 3 + 2];
                livingCells++;
            }
        }

        // Handle the last element if maxCells is odd
        if (maxCells % 2 != 0) {
            int c = maxCells - 1;
            if (activityFlag[c] == 1) {
                xSum += pointsCoordinates[c * 3];
                ySum += pointsCoordinates[c * 3 + 1];
                zSum += pointsCoordinates[c * 3 + 2];
                livingCells++;
            }
        }

        if (livingCells > 0) {  // Ensure no division by zero
            centerOfGravity[0] = xSum / (float)livingCells;
            centerOfGravity[1] = ySum / (float)livingCells;
            centerOfGravity[2] = zSum / (float)livingCells;
        }
    }
}