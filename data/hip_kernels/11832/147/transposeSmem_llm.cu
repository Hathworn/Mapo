#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_DIM 16 // Assuming square block size for simplicity

__global__ void transposeSmem(float *out, float *in, int nx, int ny)
{
    // Static shared memory with adjusted dimensions for memory coalescing
    __shared__ float tile[BLOCK_DIM][BLOCK_DIM + 1];

    // Original matrix coordinates
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    if (ix < nx && iy < ny) {
        // Linear global memory index for original matrix
        unsigned int ti = iy * nx + ix;

        // Load data from global memory to shared memory
        tile[threadIdx.y][threadIdx.x] = in[ti];
    }

    // Thread synchronization
    __syncthreads();

    // Coordinates for the transposed matrix
    ix = blockDim.y * blockIdx.y + threadIdx.x;
    iy = blockDim.x * blockIdx.x + threadIdx.y;

    if (ix < ny && iy < nx) {
        // Linear global memory index for transposed matrix
        unsigned int to = iy * ny + ix;

        // Store data to global memory from shared memory with transposed index
        out[to] = tile[threadIdx.x][threadIdx.y];
    }
}