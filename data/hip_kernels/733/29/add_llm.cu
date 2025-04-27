#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add (float *d_A, float *d_B, float *d_C, int widthA, int widthB, int widthC)
{
    // Calculate single index for each dimension
    int idx = blockIdx.x * 64 + threadIdx.x * 2;
    int idy = blockIdx.y * 8 + threadIdx.y;

    // Compute starting locations for A, B, and C arrays
    int startA = idx + idy * widthA;
    int startB = idx + idy * widthB;
    int startC = idx + idy * widthC;

    // Load and sum float2 values
    float2 tempA = *(float2 *)(d_A + startA);
    float2 tempB = *(float2 *)(d_B + startB);
    tempA.x += tempB.x;
    tempA.y += tempB.y;

    // Store result into d_C
    *(float2 *)(d_C + startC) = tempA;
}