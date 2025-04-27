#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_bin(int *d_row_nz, int *d_bin_size, int *d_max, int M, int min, int mmin)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread index is within bounds
    if (i < M) {
        int nz_per_row = d_row_nz[i];

        // Use atomic operation to find the maximum nz_per_row
        atomicMax(d_max, nz_per_row);

        // Use efficient loop for bin assignment
        for (int j = 0; j < BIN_NUM - 2; j++) {
            if (nz_per_row <= (min << j)) {
                atomicAdd(d_bin_size + (nz_per_row <= mmin ? j : j + 1), 1);
                return;
            }
        }

        // Handle case where nz_per_row falls into the last bin
        atomicAdd(d_bin_size + BIN_NUM - 1, 1);
    }
}