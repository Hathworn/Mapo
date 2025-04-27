#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normal_kerneld(int seed, double *data, int n, double mean, double std) {
    // Each thread computes its own random number, improving parallelism
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    if (idx >= n) return;

    // Use grid-stride loop to handle larger data sizes
    hiprandState state;
    hiprand_init(seed, idx, 0, &state);
    for (size_t i = idx; i < n; i += blockDim.x * gridDim.x) {
        data[i] = hiprand_normal_double(&state) * std + mean;
    }
}