#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GeometricBrownianMotion(float *d_a, float mu, float sigma, float dt, hiprandState_t *states, unsigned int size)
{
    // Cache variables outside loop
    float sqrtDtSigma = sigma * sqrt(dt);
    float dtMu = dt * mu;

    // Optimize access and computation
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if (i < size)
    {
        float randNormal = hiprand_normal(&states[i]);
        // Perform update using cached computations
        d_a[i] += d_a[i] * (dtMu + sqrtDtSigma * randNormal);
    }
}