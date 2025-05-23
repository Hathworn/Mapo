#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void resetParticlesKernel(float3* pos, float3* vel, float* age, float* life, int nParts)
{
unsigned int x = blockIdx.x*blockDim.x + threadIdx.x;

int n = x;

if (n<nParts) {
pos[n] = make_float3(0.0,0.0,0.0);
vel[n] =  make_float3(0.0,0.0,0.0);
age[n] = 1.0;
life[n] = 1.0;
}
}