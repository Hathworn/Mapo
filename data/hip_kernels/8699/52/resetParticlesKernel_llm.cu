#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void resetParticlesKernel(float3* pos, float3* vel, float* age, float* life, char* opafix, int nParts)
{
    // Use blockIdx.x * blockDim.x + threadIdx.x as the thread's global index
    unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the thread index is within the bounds
    if (x < nParts) {
        // Reset particle properties using single assignment and reduce redundant calculations
        pos[x] = make_float3(2.0f, 0.0f, 0.0f);
        vel[x] = make_float3(0.0f, 0.0f, 0.0f);
        age[x] = life[x] = -1.0f;
        opafix[x] = 0;
    }
}