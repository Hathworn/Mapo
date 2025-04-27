#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add (float *d_A, float *d_B, float *d_C, int widthA, int widthB, int widthC)
{
    // Optimize memory access by using cooperative fetching and vectorized loads/stores
    int globalIndex = blockIdx.x * 64 + threadIdx.x * 2 + (blockIdx.y * 8 + threadIdx.y) * widthA;
    
    float2 tempA = *(reinterpret_cast<float2*>(d_A + globalIndex));
    float2 tempB = *(reinterpret_cast<float2*>(d_B + globalIndex));
    
    tempA.x += tempB.x;
    tempA.y += tempB.y;

    *(reinterpret_cast<float2*>(d_C + globalIndex)) = tempA;
}