#include "hip/hip_runtime.h"
#include "includes.h"

// Use more threads per block for better occupancy if necessary
__global__ void sumArraysOnGPU(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride for grid-stride loop

    // Use grid-stride loop for better workload distribution
    for(; i < N; i += stride) {
        C[i] = A[i] + B[i];
    }
}