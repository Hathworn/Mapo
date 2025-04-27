#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mInitForce(float *f_dimX, float *f_dimY) {
    // Calculate unique thread index
    int Idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Pre-calculate constants for center point
    const float centerX = 320.0f;
    const float centerY = 240.0f;

    // Calculate thread's x and y coordinates
    float x = (float)threadIdx.x;
    float y = (float)blockIdx.x;

    // Compute length only once
    float dx = x - centerX;
    float dy = y - centerY;
    float length = sqrt(dx * dx + dy * dy);

    // Set force values based on the distance from center
    if(length < SWIRL_RADIUS) {
        f_dimX[Idx] = dy / length;
        f_dimY[Idx] = dx / length;
    } else {
        f_dimX[Idx] = f_dimY[Idx] = 0.f;
    }
}