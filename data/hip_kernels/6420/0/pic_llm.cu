#include "hip/hip_runtime.h"
#include "includes.h"

#define ITER  10000000000  // Number of bins
#define NUMBLOCKS   13  // Number of thread blocks
#define NUMTHREADS 192  // Number of threads per block

int tid;
float pi;

// Kernel
__global__ void pic(float *sum, int nbin, float step, int nthreads, int nblocks) {
    int i;
    float x;
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Sequential thread index across the blocks
    float local_sum = 0.0f;  // Use register for local sum

    // Stride loop for work distribution
    for (i = idx; i < nbin; i += nthreads * nblocks) {
        x = (i + 0.5) * step;
        local_sum += 4.0f / (1.0f + x * x);
    }
    
    sum[idx] = local_sum;  // Store local sum in global memory
}