#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SetupPoissKernel(hiprandState *curand_state, uint64_t n_dir_conn, unsigned long long seed)
{
    // Calculate the global thread index.
    uint64_t i_conn = (uint64_t)blockIdx.y * gridDim.x * blockDim.x + blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the index is within range.
    if (i_conn < n_dir_conn) {
        hiprand_init(seed, i_conn, 0, &curand_state[i_conn]);
    }
}