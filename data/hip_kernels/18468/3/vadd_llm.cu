#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vadd(const float *A, const float *B, float *C, int ds) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a local variable for shared memory coalescing
    if (idx < ds) {
        float sum = A[idx] + B[idx];
        C[idx] = sum;
    }
}