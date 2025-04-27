#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TEST(int n, float* x, float* y) {
    // Use block and thread indices to allow parallel processing
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure only valid indices are used
    if (i < n) {
        y[i] += x[i];
    }
}