#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_kernel(long long seed, hiprandState_t* devStates, ushort N) {
    // Calculate global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize loop by calculating stride once
    int stride = gridDim.x * blockDim.x;

    // Loop over all necessary indices using calculated stride
    for (int i = idx; i < N; i += stride) {
        hiprand_init(seed, i, 0, &devStates[i]);
    }
}