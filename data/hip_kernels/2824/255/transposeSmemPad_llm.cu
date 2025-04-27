#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeSmemPad(float *out, float *in, int nx, int ny)
{
    // static shared memory with padding
    __shared__ float tile[BDIMY][BDIMX + IPAD];

    // coordinate in original matrix
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // linear global memory index for original matrix
    unsigned int ti = iy * nx + ix;

    // thread index in transposed block
    unsigned int bidx = threadIdx.y * blockDim.x + threadIdx.x;
    unsigned int irow = bidx / blockDim.y;
    unsigned int icol = bidx % blockDim.y;

    // coordinate in transposed matrix
    unsigned int transposed_ix = blockDim.y * blockIdx.y + icol;
    unsigned int transposed_iy = blockDim.x * blockIdx.x + irow;

    // linear global memory index for transposed matrix
    unsigned int to = transposed_iy * ny + transposed_ix;

    // Transpose with boundary check
    if (ix < nx && iy < ny) {
        // Load data from global memory to shared memory
        tile[threadIdx.y][threadIdx.x] = in[ti];
    }

    // Thread synchronization
    __syncthreads();

    // Transpose and store back to global memory if within bounds
    if (transposed_ix < ny && transposed_iy < nx) {
        out[to] = tile[icol][irow];
    }
}