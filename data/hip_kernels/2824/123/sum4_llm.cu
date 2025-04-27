#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sum4(float4 *A, float4 *B, float4 *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (i < N)
    {
        // Perform vector addition directly using float4 structure
        C[i] = make_float4(A[i].x + B[i].x, A[i].y + B[i].y, A[i].z + B[i].z, A[i].w + B[i].w);
    }
}