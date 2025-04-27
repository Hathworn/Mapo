#include "hip/hip_runtime.h"
#include "includes.h"

#define N_ATOMS 343
#define MASS_ATOM 1.0f
#define time_step 0.01f
#define L 10.5f
#define T 0.728f
#define NUM_STEPS 10000

const int BLOCK_SIZE = 1024;
const int scheme = 1; // 0 for explicit, 1 for implicit

// Optimized kernel function for force reduction
__global__ void forcered_simple(float *force, float *forcered) {
    int index = threadIdx.x + blockDim.x * blockIdx.x;
    __shared__ float forcered_sh[3 * N_ATOMS];

    // Initialize shared memory
    for (int j = threadIdx.x; j < 3 * N_ATOMS; j += blockDim.x) {
        forcered_sh[j] = 0.0f;
    }
    __syncthreads();

    // Perform force reduction using shared memory
    if (index < 3 * N_ATOMS) {
        int findex = (index / N_ATOMS) * N_ATOMS * N_ATOMS + index % N_ATOMS;
        for (int i = 0; i < N_ATOMS; i++) {
            forcered_sh[index] += force[findex + i * N_ATOMS];
        }
    }
    __syncthreads();

    // Write result back to global memory
    if (index < 3 * N_ATOMS) {
        forcered[index] = forcered_sh[index];
    }
}