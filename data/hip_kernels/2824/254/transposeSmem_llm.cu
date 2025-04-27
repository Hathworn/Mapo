#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeSmem(float *out, float *in, int nx, int ny)
{
    // static shared memory
    __shared__ float tile[BDIMY][BDIMX+1]; // Avoid bank conflicts by padding

    // coordinate in original matrix
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // linear global memory index for original matrix
    unsigned int ti = iy * nx + ix;

    // boundary check
    if (ix < nx && iy < ny) {
        // load data from global memory to shared memory
        tile[threadIdx.y][threadIdx.x] = in[ti];
    }

    // thread synchronization
    __syncthreads();

    // calculate transposed coordinates
    ix = blockDim.y * blockIdx.y + threadIdx.x;
    iy = blockDim.x * blockIdx.x + threadIdx.y;

    // linear global memory index for transposed matrix
    unsigned int to = iy * ny + ix;

    // boundary check
    if (ix < ny && iy < nx) {
        // store data to global memory from shared memory
        out[to] = tile[threadIdx.x][threadIdx.y];
    }
}