#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelSuma_Vectores(float* array_A, float* array_B, int _size) {
    // Calculate global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure index is within bounds for arrays
    if (idx < _size) {
        // Perform vector addition
        array_A[idx] += array_B[idx];
    }
}