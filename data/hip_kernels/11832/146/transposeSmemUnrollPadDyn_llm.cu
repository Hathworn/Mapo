#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeSmemUnrollPadDyn(float *out, float *in, const int nx, const int ny) {
    // Use dynamic shared memory
    extern __shared__ float tile[];

    unsigned int ix = blockDim.x * blockIdx.x * 2 + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    unsigned int bidx = threadIdx.y * blockDim.x + threadIdx.x;
    unsigned int irow = bidx / blockDim.y;
    unsigned int icol = bidx % blockDim.y;

    // Calculate transposed matrix coordinates
    unsigned int ix2 = blockDim.y * blockIdx.y + icol;
    unsigned int iy2 = blockDim.x * 2 * blockIdx.x + irow;
    unsigned int to = iy2 * ny + ix2;

    // Transpose with boundary test
    if (ix + blockDim.x < nx && iy < ny) {
        // Load data from global memory to shared memory
        unsigned int row_idx = threadIdx.y * (blockDim.x * 2 + IPAD) + threadIdx.x;
        tile[row_idx] = in[iy * nx + ix];
        tile[row_idx + BDIMX] = in[iy * nx + ix + BDIMX];

        // Synchronize threads
        __syncthreads();

        unsigned int col_idx = icol * (blockDim.x * 2 + IPAD) + irow;
        out[to] = tile[col_idx];
        out[to + ny * BDIMX] = tile[col_idx + BDIMX];
    }
}