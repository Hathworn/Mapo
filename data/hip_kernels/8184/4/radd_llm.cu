#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void radd(float * resp, const float * res, float alpha) {
    // Calculate global index using 2D grid and block for flexibility
    int idx = threadIdx.x + blockIdx.x * blockDim.x + (blockIdx.y * gridDim.x + blockIdx.y) * blockDim.x * blockDim.y;

    // Check if index is within bounds before accessing arrays
    if (idx < gridDim.x * blockDim.x * blockDim.y) {
        // Perform the computation
        resp[idx] = (1 - alpha) * resp[idx] + alpha * res[idx];
    }
}