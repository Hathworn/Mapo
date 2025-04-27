#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int f() { return 21; }

__global__ void vDisp(const float *A, const float *B, int ds)
{
    // Create typical 1D thread index from built-in variables more efficiently
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index is within bounds
    if (idx < ds)
    {
        // Device output only when within data size to minimize unnecessary calculations
        printf("Device: [%d], \t%f\t%f \n", idx, A[idx], B[idx]);
    }
}