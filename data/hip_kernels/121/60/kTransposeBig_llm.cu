```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTransposeBig(float *odata, float *idata, int height, int width) {
    __shared__ float tile[32][33];  // Allocate shared memory for coalesced access

    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Transpose logic: load data into shared memory for faster access
    if (x < width && y < height) {
        tile[threadIdx.y][threadIdx.x] = idata[y * width + x];
    }
    __syncthreads();

    // Compute transposed position and ensure within bounds
    x = blockIdx.y * blockDim.y + threadIdx.x;
    y = blockIdx.x * blockDim.x + threadIdx.y;
    if (x < height && y < width) {
        odata[x * width + y] = tile[threadIdx.x][threadIdx.y];
    }
}