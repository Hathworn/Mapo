#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __transpose(float *in, int instride, float *out, int outstride, int nrows, int ncols) {
    // Calculate flattened thread index
    int bx = blockIdx.x * BLOCKDIM, by = blockIdx.y * BLOCKDIM;
    int tx = threadIdx.x, ty = threadIdx.y;
    __shared__ float tile[BLOCKDIM][BLOCKDIM+1]; // Avoid bank conflicts

    // Use a single loop over a flattened grid
    if (bx + tx < nrows) {
        int ylim = min(ncols, by + BLOCKDIM);
        for (int y = ty + by; y < ylim; y += blockDim.y) {
            tile[tx][y - by] = in[tx + bx + y * instride];
        }
    }
    __syncthreads();

    // Writing transposed data
    if (by + tx < ncols) {
        int xlim = min(nrows, bx + BLOCKDIM);
        for (int x = ty + bx; x < xlim; x += blockDim.y) {
            out[tx + by + x * outstride] = tile[x - bx][tx];
        }
    }
}