#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computePressure_CUDA(float* pressure, float* density, const int num, const float rho0, const float stiff)
{
    // Use blockIdx.x * blockDim.x + threadIdx.x for simpler index calculation
    const unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the index is within bounds
    if (i >= num) return;
    
    // Pre-compute reciprocal of rho0 for optimization
    float invRho0 = 1.0f / rho0;

    // Calculate pressure more efficiently
    pressure[i] = stiff * (powf(density[i] * invRho0, 7.0f) - 1.0f);

    // Clamp pressure to be non-negative
    if (pressure[i] < 0.0f) pressure[i] = 0.0f;
}