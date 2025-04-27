#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void computeGradientCentralDiff(const float* __restrict__ similarities, float* __restrict__ gradient, const int* __restrict__ activeMask, int activeSlices, int slices, int p)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i >= activeSlices) return;
    
    int slice = activeMask[i];

    // Use a single memory read for similarities to minimize access
    float similarity_value = similarities[slice];
    float dx = similarity_value - similarities[slices + slice];

    // Use direct multiplication result storage
    gradient[p * slices + slice] = dx;
    
    // Optimize updating the gradient to avoid branching
    float dx2 = dx * dx;
    atomicAdd(&gradient[6 * slices + slice], dx2 * (p != 0) + dx2 * (p == 0)); 
}