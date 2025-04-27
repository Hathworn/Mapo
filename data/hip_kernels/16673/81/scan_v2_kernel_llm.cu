#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scan_v2_kernel(float *d_output, float *d_input, int length)
{
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    int tid = threadIdx.x;

    extern __shared__ float s_buffer[];
    s_buffer[tid] = d_input[idx];
    s_buffer[tid + BLOCK_DIM] = d_input[idx + BLOCK_DIM];

    int offset = 1;

    // Forward pass
    for (; offset < length; offset <<= 1) 
    {
        __syncthreads();

        int idx_a = offset * (2 * tid + 1) - 1;
        int idx_b = offset * (2 * tid + 2) - 1;

        // Prevent unnecessary divergence
        if (idx_b < 2 * BLOCK_DIM) 
        {
            if (idx_a >= 0) 
            {
                s_buffer[idx_b] += s_buffer[idx_a];
            }
        }
    }

    offset >>= 1;

    // Backward pass
    for (; offset > 0; offset >>= 1) 
    {
        __syncthreads();

        int idx_a = offset * (2 * tid + 2) - 1;
        int idx_b = offset * (2 * tid + 3) - 1;

        // Prevent unnecessary divergence
        if (idx_b < 2 * BLOCK_DIM) 
        {
            if (idx_a >= 0)
            {
                s_buffer[idx_b] += s_buffer[idx_a];
            }
        }
    }
    __syncthreads();

    // Write back to global memory
    d_output[idx] = s_buffer[tid];
    d_output[idx + BLOCK_DIM] = s_buffer[tid + BLOCK_DIM];
}