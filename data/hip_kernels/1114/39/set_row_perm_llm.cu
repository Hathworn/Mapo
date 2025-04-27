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

    // Loop unrolling for optimization
    if (nz_per_row <= min) {
        if (nz_per_row <= mmin) {
            dest = atomicAdd(d_bin_size, 1);
            d_row_perm[d_bin_offset[0] + dest] = i;
        }
        else {
            dest = atomicAdd(d_bin_size + 1, 1);
            d_row_perm[d_bin_offset[1] + dest] = i;
        }
        return;
    }
    if (nz_per_row <= (min << 1)) {
        if (nz_per_row <= mmin) {
            dest = atomicAdd(d_bin_size + 1, 1);
            d_row_perm[d_bin_offset[1] + dest] = i;
        }
        else {
            dest = atomicAdd(d_bin_size + 2, 1);
            d_row_perm[d_bin_offset[2] + dest] = i;
        }
        return;
    }
    // Add more unrolled conditions if needed for BIN_NUM
    // Fallback for the last bin
    dest = atomicAdd(d_bin_size + BIN_NUM - 1, 1);
    d_row_perm[d_bin_offset[BIN_NUM - 1] + dest] = i;
}