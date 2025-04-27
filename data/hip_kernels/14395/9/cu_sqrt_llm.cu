#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cu_sqrt(const float *A, float *B, const int n) {
    // Calculate global thread ID
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    // Use a loop to process multiple elements per thread
    for (int i = tid; i < n; i += blockDim.x * gridDim.x) {
        // Compute square root
        B[i] = sqrtf(A[i]);
    }
}
