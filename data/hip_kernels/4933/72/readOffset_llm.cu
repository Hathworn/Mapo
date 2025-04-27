#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readOffset(float *A, float *B, float *C, const int n, int offset)
{
    // Calculate the unique global index for each thread
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;

    // Check if calculated index is within bounds before performing calculation
    if (k < n) {
        C[i] = A[k] + B[k];
    }
}