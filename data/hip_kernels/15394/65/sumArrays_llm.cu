#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArrays(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use warp divergence to prevent unnecessary calculations
    #pragma unroll
    for (int j = i; j < N; j += blockDim.x * gridDim.x)
    {
        C[j] = A[j] + B[j];
    }
}