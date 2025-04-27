#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void counthits(int n, uint *hitsp, unsigned decalage_index) {
    // Optimize to reduce thread divergence and memory access latency
    hiprandStatePhilox4_32_10_t state;
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned hits = 0;
    float x1, y1, x2, y2;

    // Initialize random state
    hiprand_init(0, index + decalage_index, 0, &state);

    for (int tries = 0; tries < n; tries += 2) {
        // Generate random numbers using hiprand
        float4 rand_vec = hiprand_uniform4(&state);
        x1 = 2 * rand_vec.x - 1;
        y1 = 2 * rand_vec.y - 1;
        x2 = 2 * rand_vec.z - 1;
        y2 = 2 * rand_vec.w - 1;

        // Accumulate hits for points inside unit circle
        hits += (x1 * x1 + y1 * y1 < 1) + (x2 * x2 + y2 * y2 < 1);
    }

    // Store hits count to global memory
    hitsp[index] = hits;
}