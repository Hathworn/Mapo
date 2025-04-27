#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeDiagonalColUnroll4(float *out, float *in, const int nx, const int ny)
{
    // Use shared memory to improve memory access speed
    __shared__ float tile[4][4];

    unsigned int blk_y = blockIdx.x;
    unsigned int blk_x = (blockIdx.x + blockIdx.y) % gridDim.x;
    
    unsigned int ix_stride = blockDim.x * blk_x;
    unsigned int ix = ix_stride * 4 + threadIdx.x;
    unsigned int iy = blockDim.y * blk_y + threadIdx.y;
    
    if (ix < nx && iy < ny)
    {
        tile[threadIdx.y][threadIdx.x] = in[ix * ny + iy];
        __syncthreads();

        if (threadIdx.y < 4) {
            out[iy * nx + ix] = tile[threadIdx.y][threadIdx.x];
            ix += blockDim.x;
            out[iy * nx + ix] = tile[threadIdx.y][threadIdx.x];
            ix += blockDim.x;
            out[iy * nx + ix] = tile[threadIdx.y][threadIdx.x];
            ix += blockDim.x;
            out[iy * nx + ix] = tile[threadIdx.y][threadIdx.x];
        }
    }
}