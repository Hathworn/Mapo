#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computeGradientCentralDiff(const float* __restrict__ similarities, float* __restrict__ gradient, const int* __restrict__ activeMask, const int activePatches, const int patches, const int p)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= activePatches)
        return;
    
    int patch = activeMask[i];
    float dx = similarities[patch] - similarities[patches + patch];

    // Use atomic operations to prevent race conditions and ensure correct computations
    gradient[p * patches + patch] = dx;
    if (p == 0)
        gradient[6 * patches + patch] = dx * dx;
    else
        atomicAdd(&gradient[6 * patches + patch], dx * dx);
}