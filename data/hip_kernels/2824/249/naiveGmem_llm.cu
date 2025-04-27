#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void naiveGmem(float *out, float *in, const int nx, const int ny)
{
    // Use shared memory for optimization and eliminate bank conflicts
    __shared__ float tile[TILE_DIM][TILE_DIM+1];

    // matrix coordinate (ix,iy)
    unsigned int ix = blockIdx.x * TILE_DIM + threadIdx.x;
    unsigned int iy = blockIdx.y * TILE_DIM + threadIdx.y;
    
    // linear index
    unsigned int index_in = iy * nx + ix;
    unsigned int index_out = threadIdx.y * TILE_DIM + threadIdx.x;

    // Load data into shared memory
    if (ix < nx && iy < ny)
    {
        tile[threadIdx.y][threadIdx.x] = in[index_in];
    }
    
    // Synchronize threads in the block
    __syncthreads();
    
    // Compute transposed index
    ix = blockIdx.y * TILE_DIM + threadIdx.x;
    iy = blockIdx.x * TILE_DIM + threadIdx.y;
    
    // Write transposed data back to global memory
    if (ix < ny && iy < nx)
    {
        out[iy * ny + ix] = tile[threadIdx.x][threadIdx.y];
    }
}