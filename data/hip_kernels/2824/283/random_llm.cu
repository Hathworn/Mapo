#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void random(float *A, float *B, float *C, const int N)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load index from B into a local variable
    int index = __float2int_rd(B[i]);

    // Check bounds and perform the copy
    if (index < N) {
        C[index] = A[index];
    }
}