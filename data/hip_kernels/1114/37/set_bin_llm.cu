#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void set_bin(int *d_row_nz, int *d_bin_size, int *d_max, int M, int min, int mmin)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= M) {
        return;
    }
    int nz_per_row = d_row_nz[i];

    // Use atomic to find maximum
    atomicMax(d_max, nz_per_row);

    // Optimize bin determination with loop unrolling
    if (nz_per_row <= min) {
        if (nz_per_row <= mmin) {
            atomicAdd(d_bin_size, 1);
        } else {
            atomicAdd(d_bin_size + 1, 1);
        }
    } else if (nz_per_row <= (min << 1)) {
        atomicAdd(d_bin_size + 1, 1);
    } else if (nz_per_row <= (min << 2)) {
        atomicAdd(d_bin_size + 2, 1);
    } else {
        atomicAdd(d_bin_size + BIN_NUM - 1, 1);
    }
}