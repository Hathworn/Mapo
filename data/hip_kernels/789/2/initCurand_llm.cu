#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initCurand(hiprandState *state, unsigned long seed, int n_rows) {
    int x = blockDim.x * blockIdx.x + threadIdx.x;
    if (x < n_rows) {
        // Unrolling loop for better performance
        #pragma unroll
        for (int i = 0; i < 1; i++) {
            hiprand_init(seed, x, 0, &state[x]);
        }
    }
}