#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void assembleBinBlockCSRKernel(const unsigned matrix_size, const float* __restrict__ diagonal_blks, const float* __restrict__ nondiagonal_blks, const int* __restrict__ csr_rowptr, const unsigned* __restrict__ blkrow_offset, float* __restrict__ JtJ_data) {
    const unsigned row_idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (row_idx >= matrix_size) return;

    int data_offset = csr_rowptr[row_idx];
    const unsigned blkrow_idx = row_idx / 6;
    const unsigned inblk_offset = row_idx % 6;

    // Use shared memory for diagonal blocks to reduce redundant global accesses
    __shared__ float shared_diagonal_blks[36];
    if (threadIdx.x < 36) {
        shared_diagonal_blks[threadIdx.x] = diagonal_blks[36 * blkrow_idx + threadIdx.x];
    }
    __syncthreads();

    // Fill the diagonal blocks with preloaded shared memory data
    for (unsigned k = 0; k < 6; k++, data_offset += bin_size) {
        JtJ_data[data_offset] = shared_diagonal_blks[inblk_offset + 6 * k];
    }

    // Fill the non-diagonal blocks without loop unrolling
    unsigned Iij_begin = blkrow_offset[blkrow_idx];
    const unsigned Iij_end = blkrow_offset[blkrow_idx + 1];
    for (; Iij_begin < Iij_end; Iij_begin++) {
        for (unsigned k = 0; k < 6; k++, data_offset += bin_size) {
            JtJ_data[data_offset] = nondiagonal_blks[36 * Iij_begin + inblk_offset + 6 * k];
        }
    }
}