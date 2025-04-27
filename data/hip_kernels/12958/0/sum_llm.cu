#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function for vector addition
__global__ void sum(int *A , int *B, int *C, long long N)
{
    long long idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unrolling the loop to improve memory access efficiency
    #pragma unroll 4
    for (long long offset = idx; offset < N; offset += blockDim.x * gridDim.x)
    {
        C[offset] = A[offset] + B[offset];
    }
}