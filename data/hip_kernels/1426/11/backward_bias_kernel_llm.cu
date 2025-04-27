#include "hip/hip_runtime.h"
#include "includes.h"

// Define BLOCK size for shared memory
#define BLOCK 256

__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Loop through batches with stride BLOCK to minimize memory latency
    for (int b = 0; b < batch; ++b) {
        for (int i = p; i < size; i += BLOCK) {
            int index = i + size * (filter + n * b);
            sum += delta[index];  // Accumulate delta values
        }
    }
    part[p] = sum;

    __syncthreads();

    // Use atomicAdd to safely update bias_updates (avoid race condition)
    if (p == 0) {
        for (int i = 0; i < BLOCK; ++i) {
            atomicAdd(&bias_updates[filter], part[i]);
        }
    }
}