#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void device_transpose() 
{
    int ivis = blockIdx.x * blockDim.x + threadIdx.x;
    int ihid = blockIdx.y;

    // Load data to shared memory to improve access coalescing
    __shared__ float blockTile[BLOCK_DIM][BLOCK_DIM+1];

    if (ivis < d_n_inputs)
        blockTile[threadIdx.y][threadIdx.x] = d_w[ihid*d_n_inputs_cols+ivis];

    __syncthreads();

    // Write transposed data to global memory
    if (threadIdx.y + blockIdx.y * blockDim.y < d_nhid_cols && ivis < d_n_inputs)
        d_wtr[ivis*d_nhid_cols+ihid] = blockTile[threadIdx.x][threadIdx.y];
}