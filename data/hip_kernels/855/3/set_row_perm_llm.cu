#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void set_row_perm(int *d_bin_size, int *d_bin_offset, int *d_max_row_nz, int *d_row_perm, int M, int min, int mmin)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i >= M) {
        return;
    }

    int nz_per_row = d_max_row_nz[i];
    int dest;
    int j = 0;

    // Use shared memory to store bin_size and bin_offset to reduce global memory accesses
    __shared__ int bin_size[BIN_NUM];
    __shared__ int bin_offset[BIN_NUM];

    if (threadIdx.x < BIN_NUM) {
        bin_size[threadIdx.x] = d_bin_size[threadIdx.x];
        bin_offset[threadIdx.x] = d_bin_offset[threadIdx.x];
    }
    __syncthreads();

    // Unroll loop to reduce iterations and improve performance
    #pragma unroll
    for (j = 0; j < BIN_NUM - 2; j++) {
        if (nz_per_row <= (min << j)) {
            if (nz_per_row <= mmin) {
                dest = atomicAdd(bin_size + j, 1);
                d_row_perm[bin_offset[j] + dest] = i;
            } else {
                dest = atomicAdd(bin_size + j + 1, 1);
                d_row_perm[bin_offset[j + 1] + dest] = i;
            }
            // Synchronize bin_sizes back to global memory
            atomicExch(d_bin_size + j, bin_size[j]);
            atomicExch(d_bin_size + j + 1, bin_size[j + 1]);
            return;
        }
    }
    dest = atomicAdd(bin_size + BIN_NUM - 1, 1);
    d_row_perm[bin_offset[BIN_NUM - 1] + dest] = i;
    atomicExch(d_bin_size + BIN_NUM - 1, bin_size[BIN_NUM - 1]);
}