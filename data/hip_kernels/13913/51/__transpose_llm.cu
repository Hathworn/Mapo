#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void __transpose(double *in, int instride, double *out, int outstride, int nrows, int ncols) {
    int nx = BLOCKDIM * gridDim.x;
    int ny = BLOCKDIM * gridDim.y;
    int ix = BLOCKDIM * blockIdx.x;
    int iy = BLOCKDIM * blockIdx.y;
    __shared__ double tile[BLOCKDIM][BLOCKDIM+1]; // Avoid bank conflicts with padding

    for (int yb = iy; yb < ncols; yb += ny) {
        for (int xb = ix; xb < nrows; xb += nx) {
            if (xb + threadIdx.x < nrows) {
                int ylim = min(ncols, yb + BLOCKDIM);
                // Coalesced read from global memory
                for (int y = threadIdx.y + yb; y < ylim; y += blockDim.y) {
                    tile[threadIdx.x][y-yb] = in[threadIdx.x+xb + y*instride];
                }
            }
            __syncthreads();

            if (yb + threadIdx.x < ncols) {
                int xlim = min(nrows, xb + BLOCKDIM);
                // Coalesced write to global memory
                for (int x = threadIdx.y + xb; x < xlim; x += blockDim.y) {
                    out[threadIdx.x + yb + x*outstride] = tile[x-xb][threadIdx.x];
                }
            }
            __syncthreads();
        }
    }
}