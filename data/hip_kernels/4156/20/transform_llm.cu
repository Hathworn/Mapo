#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transform(float *points3d_after, float *points3d, float * transformation_matrix)
{
    int x = blockIdx.x * TILE_DIM + threadIdx.x;
    int y = blockIdx.y * TILE_DIM + threadIdx.y;
    int w = gridDim.x * TILE_DIM;

    // Optimize loop to use shared memory to reduce global memory accesses.
    __shared__ float shared_transform[TILE_DIM][TILE_DIM][4];
    for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS)
    {
        int iw = x;
        int ih = y + j;
        if (ih * w + iw < gridDim.y * TILE_DIM * TILE_DIM)
        {
            // Load data into shared memory
            for (int k = 0; k < 4; k++) {
                shared_transform[threadIdx.y + j][threadIdx.x][k] = points3d[(ih * w + iw) * 4 + k];
            }
            __syncthreads();

            // Compute transformation using shared memory
            for (int ic = 0; ic < 3; ic++) {
                float sum = 0.0f;
                for (int k = 0; k < 4; k++) {
                    sum += shared_transform[threadIdx.y + j][threadIdx.x][k] * transformation_matrix[4 * ic + k];
                }
                points3d_after[(ih * w + iw) * 3 + ic] = sum;
            }
            __syncthreads();
        }
    }
}