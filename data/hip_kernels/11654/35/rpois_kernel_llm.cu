#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rpois_kernel(hiprandState *state, int *vals, int n, double lambda)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Process valid index
    if (idx < n) {
        vals[idx] = hiprand_poisson(&state[idx], lambda);
    }
}