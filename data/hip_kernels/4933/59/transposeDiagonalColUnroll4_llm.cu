#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeDiagonalColUnroll4(float *out, float *in, const int nx, const int ny)
{
    // Calculate optimized block coordinates
    unsigned int blk_y = blockIdx.x;
    unsigned int blk_x = (blockIdx.x + blockIdx.y) % gridDim.x;

    // Calculate global thread indices with unrolling factor
    unsigned int ix_stride = blockDim.x * blk_x * 4;
    unsigned int ix = ix_stride + threadIdx.x;
    unsigned int iy = blockDim.y * blk_y + threadIdx.y;

    // Unroll 4 - Load and store
    if (ix < nx && iy < ny) {
        unsigned int out_index = iy * nx + ix;
        unsigned int in_index = ix * ny + iy;
    
        out[out_index] = in[in_index];
        if (ix + blockDim.x < nx) {
            out[out_index + blockDim.x] = in[in_index + blockDim.x * ny];
        }
        if (ix + 2 * blockDim.x < nx) {
            out[out_index + 2 * blockDim.x] = in[in_index + 2 * blockDim.x * ny];
        }
        if (ix + 3 * blockDim.x < nx) {
            out[out_index + 3 * blockDim.x] = in[in_index + 3 * blockDim.x * ny];
        }
    }
}