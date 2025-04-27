#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_bin(int *d_row_nz, int *d_bin_size, int *d_max, int M, int min, int mmin)
{
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the thread ID is within range
    if (i >= M) {
        return;
    }

    // Load data from global memory
    int nz_per_row = d_row_nz[i];

    // Compute maximum using atomic operation
    atomicMax(d_max, nz_per_row);

    // Determine appropriate bin
    for (int j = 0; j < BIN_NUM - 2; j++) {
        if (nz_per_row <= (min << j)) {
            atomicAdd(d_bin_size + j + (nz_per_row > mmin), 1); // Simplified binning logic
            return;
        }
    }

    // Handle case for last bin
    atomicAdd(d_bin_size + BIN_NUM - 1, 1);
}