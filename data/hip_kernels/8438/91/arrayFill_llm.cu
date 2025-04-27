#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void arrayFill(float* data, float value, int size) {
    // Use a shared array to enhance memory access
    __shared__ float sharedValue;
    if (threadIdx.x == 0) sharedValue = value; // Initialize shared memory with value
    __syncthreads(); // Sync threads to ensure sharedValue is set

    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x;

    // Improved loop access with shared memory
    for (int i = tid; i < size; i += stride) {
        data[i] = sharedValue; // Use shared memory value
    }
}