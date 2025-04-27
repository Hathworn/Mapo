#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_row_perm(int *d_bin_size, int *d_bin_offset, int *d_max_row_nz, int *d_row_perm, int M, int min, int mmin)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i >= M) {
        return;
    }

    int nz_per_row = d_max_row_nz[i];
    int dest;

    // Optimize loop to reduce redundant checks
    int threshold = min;
    for (int j = 0; j < BIN_NUM - 2; j++, threshold <<= 1) {
        if (nz_per_row <= threshold) {
            int offset_index = (nz_per_row <= mmin) ? j : j + 1;
            dest = atomicAdd(d_bin_size + offset_index, 1);
            d_row_perm[d_bin_offset[offset_index] + dest] = i;
            return;
        }
    }
    
    dest = atomicAdd(d_bin_size + BIN_NUM - 1, 1);
    d_row_perm[d_bin_offset[BIN_NUM - 1] + dest] = i;
}