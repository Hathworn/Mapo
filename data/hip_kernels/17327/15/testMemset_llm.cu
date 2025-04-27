#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void testMemset(float* array, float value, int N) {
    // Calculate global index using block and thread indices
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Check if index is within bounds
    if (i < N) {
        array[i] = value;
    }
}