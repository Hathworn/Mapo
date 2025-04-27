#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void coalesced4(float *A, float *C, const int N)
{
    int i = (blockIdx.x * blockDim.x + threadIdx.x) * 4;
    if (i < N - 3) {    // Simplified boundary check
        float4 *A4 = reinterpret_cast<float4*>(A); // Use float4 for coalesced access
        float4 *C4 = reinterpret_cast<float4*>(C);
        C4[blockIdx.x * blockDim.x + threadIdx.x] = A4[blockIdx.x * blockDim.x + threadIdx.x];
    }
}