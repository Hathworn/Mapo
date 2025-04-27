#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void KerComputeAceMod(unsigned n, const float3 *ace, float *acemod)
{
    // Calculate particle index based on unique thread identifier
    unsigned p = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if particle index is within bounds
    if (p < n) {
        // Load ace vector into registers
        const float3 r = ace[p];
        
        // Calculate and store the squared magnitude of the ace vector
        acemod[p] = r.x * r.x + r.y * r.y + r.z * r.z;
    }
}