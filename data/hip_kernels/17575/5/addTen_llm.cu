#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addTen(float* d, int count) {
    // Calculate the global thread index
    int tid = blockIdx.x * blockDim.x * blockDim.y * blockDim.z 
            + blockIdx.y * blockDim.x * blockDim.y * gridDim.x 
            + blockIdx.z * blockDim.x * blockDim.y * gridDim.x * gridDim.y 
            + threadIdx.z * blockDim.x * blockDim.y 
            + threadIdx.y * blockDim.x 
            + threadIdx.x;

    // Ensure only valid threads perform computation
    if(tid < count) {
        d[tid] += 10.0f;  // Add ten to the value at the current index
    }
}