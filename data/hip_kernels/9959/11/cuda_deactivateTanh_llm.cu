#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_deactivateTanh(double* pE, const double* pA, int n)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Use block-level loop unrolling for improved memory access
    #pragma unroll 4
    for (; id < n; id += blockDim.x * gridDim.x) {
        pE[id] *= (1.0 - (pA[id] * pA[id]));
    }
}