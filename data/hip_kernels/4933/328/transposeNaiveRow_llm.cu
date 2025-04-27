#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeNaiveRow(int *in, int *out, const int nx, const int ny)
{
    // Use shared memory for coalesced access
    __shared__ int tile[TILE_SIZE][TILE_SIZE + 1];

    // Set thread id.
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;

    if (ix < nx && iy < ny)
    {
        // Load data into shared memory
        tile[threadIdx.y][threadIdx.x] = in[iy * nx + ix];
    }
    __syncthreads();

    // Transpose block using shared memory
    unsigned int transposed_ix = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int transposed_iy = threadIdx.x + blockIdx.x * blockDim.x;
    
    if (transposed_ix < ny && transposed_iy < nx)
    {
        // Write transposed data from shared memory
        out[transposed_iy * ny + transposed_ix] = tile[threadIdx.x][threadIdx.y];
    }
}