```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Random(float *results, int n, unsigned int seed) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Check idx is within bounds to avoid out of bounds memory access
    if (idx < n) {
        // Use thread index for more varied random state initialization
        hiprandState_t state;
        hiprand_init(seed, idx, 0, &state);
        // Write output using the valid index
        results[idx] = hiprand(&state) / 1000.0f;
    }
}