#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compress_s_write_permutation(unsigned short *d_s_write_permutation, unsigned short *d_s_write_permutation_offset, int *d_write_permutation, int c_size, int chunk)
{
    // Calculate the global index of the thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the index is within bounds
    if (i >= c_size * chunk) {
        return;
    }

    // Calculate chunk ID for current element
    int chunk_id = i / chunk;

    // Compute s_write_permutation using modulo with USHORT_MAX
    d_s_write_permutation[i] = (unsigned short)(d_write_permutation[i] % USHORT_MAX);

    // Compute s_write_permutation_offset only for the first element in each chunk
    if (i % chunk == 0) {
        d_s_write_permutation_offset[chunk_id] = (unsigned short)(d_write_permutation[i] / USHORT_MAX);
    }
}