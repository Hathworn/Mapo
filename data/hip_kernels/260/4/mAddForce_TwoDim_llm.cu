```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mAddForce_TwoDim(float *velocityX, float *velocityY, float *forceX, float *forceY, float dt) {
    int Idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Store velocityX and forceX in local variables for reuse
    float velX = velocityX[Idx];
    float fx = forceX[Idx];
    velocityX[Idx] = (velX >= 0.6) ? velX : velX + fx * dt;

    // Store velocityY and forceY in local variables for reuse
    float velY = velocityY[Idx];
    float fy = forceY[Idx];
    velocityY[Idx] = (velY >= 0.6) ? velY : velY + fy * dt;
}