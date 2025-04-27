#include "hip/hip_runtime.h"
#include "includes.h"

#define SIZE_thread 1024

__global__ void VectorAdd(int *A, int *B, int *C, int n)
{
    // Use a more efficient block and thread calculation
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds before performing operations
    if (i < n) {
        C[i] = A[i] + B[i];
    }
}