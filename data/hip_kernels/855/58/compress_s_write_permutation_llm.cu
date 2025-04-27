#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void compress_s_write_permutation(unsigned short *d_s_write_permutation, unsigned short *d_s_write_permutation_offset, int *d_write_permutation, int c_size, int chunk)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= c_size * chunk) {
        return;
    }

    // Compute chunk_id and index within the chunk
    int chunk_id = i / chunk;
    int index_within_chunk = i % chunk;

    // Load value once and use it for both assignments
    int write_perm_value = d_write_permutation[i];

    // Simplified and optimized calculations
    d_s_write_permutation[i] = (unsigned short)(write_perm_value % USHORT_MAX);

    // Only computed for the first element in each chunk
    if (index_within_chunk == 0) {
        d_s_write_permutation_offset[chunk_id] = (unsigned short)(write_perm_value / USHORT_MAX);
    }
}