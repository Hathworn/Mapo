#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scan_v2_kernel(float *d_output, float *d_input, int length)
{
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    int tid = threadIdx.x;

    extern __shared__ float s_buffer[];
    // Load input into shared memory
    int double_tid = 2 * tid;
    s_buffer[double_tid] = d_input[idx];
    s_buffer[double_tid + 1] = d_input[idx + BLOCK_DIM];

    int offset = 1;

    for (; offset < 2 * BLOCK_DIM; offset <<= 1) {
        __syncthreads();
        int idx_a = offset * (double_tid + 1) - 1;
        int idx_b = offset * (double_tid + 2) - 1;

        if (idx_b < 2 * BLOCK_DIM) {
#if (DEBUG_INDEX > 0)
            printf("[ %d, %d ]\t", idx_a, idx_b);
#endif
            s_buffer[idx_b] += s_buffer[idx_a];
        }
    }

    for (offset >>= 1; offset > 0; offset >>= 1) {
        __syncthreads();
        int idx_a = offset * (double_tid + 2) - 1;
        int idx_b = offset * (double_tid + 3) - 1;

        if (idx_b < 2 * BLOCK_DIM) {
#if (DEBUG_INDEX > 0)
            printf("[ %d, %d ]\t", idx_a, idx_b);
#endif
            s_buffer[idx_b] += s_buffer[idx_a];
        }
    }
    __syncthreads();

    // Write results to output
    d_output[idx] = s_buffer[double_tid];
    d_output[idx + BLOCK_DIM] = s_buffer[double_tid + 1];
}