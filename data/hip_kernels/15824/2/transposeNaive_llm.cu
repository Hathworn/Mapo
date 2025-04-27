#include "hip/hip_runtime.h"
#include "includes.h"

// Use shared memory to optimize transpose
__global__ void transposeNaive(float *odata, const float *idata, int idata_rows, int idata_cols)
{
    __shared__ float tile[TILE_SIZE][TILE_SIZE + 1]; // Avoid bank conflicts with padding

    int x = blockIdx.x * TILE_SIZE + threadIdx.x;
    int y = blockIdx.y * TILE_SIZE + threadIdx.y;

    // Load data into shared memory
    if (y < idata_rows && x < idata_cols)
        tile[threadIdx.y][threadIdx.x] = idata[y * idata_cols + x];

    __syncthreads(); // Synchronize to ensure all data is loaded

    // Transpose within shared memory and store result
    x = blockIdx.y * TILE_SIZE + threadIdx.x; // Transpose block offset
    y = blockIdx.x * TILE_SIZE + threadIdx.y;

    if (y < idata_cols && x < idata_rows)
        odata[y * idata_rows + x] = tile[threadIdx.x][threadIdx.y];
}