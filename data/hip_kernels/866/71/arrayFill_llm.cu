#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void arrayFill(float* data, float value, int size) {
    // Calculate thread ID and stride
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Loop iterates over elements
    for (int i = tid; i < size; i += stride) {
        data[i] = value; // Assign value to the current element
    }
}