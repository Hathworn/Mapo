#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

__global__ void vectorTransformKernel(float* A, float* B, float* Result) {
    // Calculate global index efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a more efficient boundary check
    if (i < 1000000) {
        // Avoid redundant memory access by using register for Result[i]
        float temp = A[i] * B[i];
        Result[i] += temp;
    }
}