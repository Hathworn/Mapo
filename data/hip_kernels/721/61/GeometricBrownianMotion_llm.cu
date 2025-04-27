#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GeometricBrownianMotion(float *d_a, float mu, float sigma, float dt, hiprandState_t *states, unsigned int size)
{
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    // Use shared memory to reduce repeated sqrt calculation
    __shared__ float shared_sqrt_dt;

    // Only one thread calculates sqrt once, avoiding redundant computation
    if (threadIdx.x == 0) {
        shared_sqrt_dt = sqrt(dt);
    }
    __syncthreads();

    if (i < size)
    {
        // Using shared memory for sqrt(dt) to optimize performance
        d_a[i] += d_a[i] * ((dt * mu) + (sigma * shared_sqrt_dt * hiprand_normal(&states[i])));
    }
}