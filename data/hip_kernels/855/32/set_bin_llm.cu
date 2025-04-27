#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void set_bin(int *d_row_nz, int *d_bin_size, int *d_max, int M, int min, int mmin)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= M) {
        return;
    }
    int nz_per_row = d_row_nz[i];
    
    // Use atomicMax on shared memory to prevent contention
    atomicMax(d_max, nz_per_row);

    // Improved iteration to minimize branching
    int j;
    for (j = 0; j < BIN_NUM - 2; j++) {
        int threshold = min << j;
        if (nz_per_row <= threshold) {
            if (nz_per_row <= mmin) {
                atomicAdd(d_bin_size + j, 1);
            } else {
                atomicAdd(d_bin_size + j + 1, 1);
            }
            return;
        }
    }
    
    // If none of the conditions met, add to the last bin
    atomicAdd(d_bin_size + BIN_NUM - 1, 1);
}