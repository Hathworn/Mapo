#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generateGaussian_kernel(float* og, float delta, int radius)
{
    // Use shared memory to optimize access
    extern __shared__ float shared_mem[];

    int x = threadIdx.x - radius;
    // Precompute constant part of the equation to be reused
    float coeff = 1.0f / (2 * delta * delta);
    int idx = threadIdx.x;

    // Store intermediate calculation in shared memory
    shared_mem[idx] = x * x * coeff;

    // Synchronize to ensure complete shared memory writes
    __syncthreads();

    // Perform the final math operation using shared memory
    og[idx] = __expf(-shared_mem[idx]);
}