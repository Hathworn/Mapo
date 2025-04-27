#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void readOffsetUnroll4(float *A, float *B, float *C, const int n, int offset)
{
    // Calculate global thread index
    unsigned int i = blockIdx.x * blockDim.x * 4 + threadIdx.x;
    unsigned int k = i + offset;

    // Ensure the loop continues if within bounds
    float a0, a1, a2, a3, b0, b1, b2, b3;
    if (k + 3 * blockDim.x < n)
    {
        // Load data into registers to minimize global memory access latency
        a0 = A[k];
        b0 = B[k];
        a1 = A[k + blockDim.x];
        b1 = B[k + blockDim.x];
        a2 = A[k + 2 * blockDim.x];
        b2 = B[k + 2 * blockDim.x];
        a3 = A[k + 3 * blockDim.x];
        b3 = B[k + 3 * blockDim.x];

        // Perform computations and store results back to C array
        C[i] = a0 + b0;
        C[i + blockDim.x] = a1 + b1;
        C[i + 2 * blockDim.x] = a2 + b2;
        C[i + 3 * blockDim.x] = a3 + b3;
    }
}