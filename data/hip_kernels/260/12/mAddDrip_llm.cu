#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mAddDrip(float *dense, int centerX, int centerY, float radius) {
    int Idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate the thread's global position directly
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate squared distance to avoid using sqrt
    float distSquared = (x - centerX) * (x - centerX) + (y - centerY) * (y - centerY);

    // Compare squared distance with squared radius
    if (distSquared < radius * radius) {
        dense[Idx] += 200.0f;
    }
}