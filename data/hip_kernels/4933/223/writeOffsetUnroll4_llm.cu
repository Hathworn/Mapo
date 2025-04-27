#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void writeOffsetUnroll4(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * (blockDim.x * 4) + threadIdx.x; // Load multiple elements per thread
    unsigned int k = i + offset;

    if (k + 3 * blockDim.x < n) // Efficient boundary check
    {
        float4 a, b, c; // Use float4 for coalesced memory access
        a = *((float4*)&A[i]);
        b = *((float4*)&B[i]);
        c.x = a.x + b.x;
        c.y = a.y + b.y;
        c.z = a.z + b.z;
        c.w = a.w + b.w;
        *((float4*)&C[k]) = c;
    }
}