#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square(int *d_num_steps, unsigned long long *d_fact, double *d_out) {
    __shared__ double local_d_out[256]; // Use shared memory for partial results

    int idx = threadIdx.x;
    int num_steps = *d_num_steps;
    local_d_out[idx] = 0; // Initialize shared memory

    for (int k = idx + 1; k < num_steps; k += blockDim.x) {
        local_d_out[idx] += (double) k * 0.5 / (double) d_fact[k - 1];
    }

    d_out[idx] = local_d_out[idx]; // Write back to global memory
}