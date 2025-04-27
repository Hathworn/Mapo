#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transpose_smem_pad_unrolling(int * in, int* out, int nx, int ny)
{
    __shared__ int tile[BDIMY * (2 * BDIMX + IPAD)];

    // Calculate input positions
    int ix = 2 * blockDim.x * blockIdx.x + threadIdx.x;
    int iy = blockDim.y * blockIdx.y + threadIdx.y;
    int in_index = iy * nx + ix;

    // Calculate shared memory index
    int _1d_index = threadIdx.y * blockDim.x + threadIdx.x;
    int i_row = _1d_index / blockDim.x;
    int i_col = _1d_index % blockDim.x;

    // Calculate output coordinates
    int out_ix = blockIdx.y * blockDim.y + i_col;
    int out_iy = 2 * blockIdx.x * blockDim.x + i_row;
    int out_index = out_iy * ny + out_ix;
    
    // Check bounds and perform transpose
    if (ix < nx && iy < ny)
    {
        int row_idx = threadIdx.y * (2 * blockDim.x + IPAD) + threadIdx.x;
        
        // Load input into shared memory
        tile[row_idx] = in[in_index];
        if (ix + BDIMX < nx) // Ensure we don't read out of bounds
            tile[row_idx + BDIMX] = in[in_index + BDIMX];
        
        // Wait for all threads to complete loading
        __syncthreads();
        
        int col_idx = i_col * (2 * blockDim.x + IPAD) + i_row;
        
        // Store to output from shared memory
        out[out_index] = tile[col_idx];
        if (out_iy + BDIMX < ny) // Ensure we don't write out of bounds
            out[out_index + ny * BDIMX] = tile[col_idx + BDIMX];
    }
}