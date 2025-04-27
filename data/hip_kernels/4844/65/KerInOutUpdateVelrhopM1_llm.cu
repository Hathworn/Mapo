#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void KerInOutUpdateVelrhopM1(unsigned n, const int *inoutpart, const float4 *velrhop, float4 *velrhopm1)
{
    // Calculate the global thread index
    const unsigned cp = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if within bounds
    if (cp < n) {
        const unsigned p = inoutpart[cp];
        // Update velrhopm1 with values from velrhop
        velrhopm1[p] = velrhop[p];
    }
}