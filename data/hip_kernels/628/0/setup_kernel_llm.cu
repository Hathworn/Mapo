#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_kernel(long long seed, hiprandState_t* devStates, ushort N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Compute the stride for the loop
    for (int i = idx; i < N; i += stride) { // Use precomputed stride in loop
        hiprand_init(seed, i, 0, &devStates[i]);
    }
}