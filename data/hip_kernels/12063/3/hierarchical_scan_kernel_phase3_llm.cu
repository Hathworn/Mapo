#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hierarchical_scan_kernel_phase3(int *S, int *Y) {
    int tx = threadIdx.x;
    int bx = blockIdx.x;
    int i = bx * SECTION_SIZE + tx;

    // Utilize shared memory for improved memory access pattern
    __shared__ int shared_S;
    if (tx == 0) {
        shared_S = bx > 0 ? S[bx - 1] : 0;
    }
    __syncthreads();

    // Loop unrolling for performance optimization
    for (int j = 0; j < SECTION_SIZE; j += BLOCK_DIM) {
        Y[i + j] += shared_S;
    }
}