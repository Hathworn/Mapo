#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_bin(int *d_row_nz, int *d_bin_size, int *d_max, int M, int min, int mmin)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= M) {
        return;
    }
    int nz_per_row = d_row_nz[i];
    
    // Use a shared variable to reduce atomic operations
    __shared__ int local_max;
    if (threadIdx.x == 0) {
        local_max = 0;
    }
    __syncthreads();

    // Update local max
    atomicMax(&local_max, nz_per_row);
    __syncthreads();

    // Write back the local max to global memory
    if (threadIdx.x == 0) {
        atomicMax(d_max, local_max);
    }

    int j = 0;
    for (j = 0; j < BIN_NUM - 2; j++) {
        if (nz_per_row <= (min << j)) {
            if (nz_per_row <= mmin) {
                atomicAdd(d_bin_size + j, 1);
            } else {
                atomicAdd(d_bin_size + j + 1, 1);
            }
            return;
        }
    }
    atomicAdd(d_bin_size + BIN_NUM - 1, 1);
}