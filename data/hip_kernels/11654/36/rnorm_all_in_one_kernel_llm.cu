#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rnorm_all_in_one_kernel(float *vals, int n, float mu, float sigma)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x + 
              blockIdx.y * (blockDim.x * gridDim.x) + 
              threadIdx.y * gridDim.x * blockDim.x + 
              blockIdx.z * (blockDim.x * blockDim.y * gridDim.x * gridDim.y) + 
              threadIdx.z * (gridDim.x * gridDim.y * blockDim.x * blockDim.y);

    // Setup the RNG only for valid indices
    if (idx < n) {
        hiprandState rng_state;
        hiprand_init(9131 + idx * 17, 0, 0, &rng_state);
        vals[idx] = mu + sigma * hiprand_normal(&rng_state);
    }
}