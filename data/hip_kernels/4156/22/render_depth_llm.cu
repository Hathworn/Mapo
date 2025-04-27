#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void render_depth(float *points3d_polar, unsigned int * depth_render)
{
    // Calculate global thread positions
    int x = blockIdx.x * TILE_DIM + threadIdx.x;
    int y = blockIdx.y * TILE_DIM + threadIdx.y;
    int w = gridDim.x * TILE_DIM;
    int h = w / 2;

    // Declare shared memory for coalesced memory access and minimize global memory latency
    __shared__ float shared_points3d_polar[TILE_DIM * BLOCK_ROWS * 3];

    // Load data into shared memory
    int local_index = threadIdx.y * TILE_DIM + threadIdx.x;
    int global_index = y * w + x;
    if (y < h && x < w) {
        shared_points3d_polar[local_index * 3 + 0] = points3d_polar[global_index * 3 + 0];
        shared_points3d_polar[local_index * 3 + 1] = points3d_polar[global_index * 3 + 1];
        shared_points3d_polar[local_index * 3 + 2] = points3d_polar[global_index * 3 + 2];
    }
    __syncthreads();

    // Process each row block in the TILE_DIM step
    for (int j = threadIdx.y; j < TILE_DIM; j += BLOCK_ROWS)
    {
        int iw = x;
        int ih = y + j;
        if (ih < h && iw < w) {
            // Use loaded shared memory
            float theta = shared_points3d_polar[(j * TILE_DIM + threadIdx.x) * 3 + 1];
            float phi = shared_points3d_polar[(j * TILE_DIM + threadIdx.x) * 3 + 2];
            float radius = shared_points3d_polar[(j * TILE_DIM + threadIdx.x) * 3 + 0];

            int tx = round((theta + M_PI) / (2 * M_PI) * w - 0.5);
            int ty = round(phi / M_PI * h - 0.5);
            int this_depth = (int)(512 * radius);

            // Use atomic operation to update the minimum depth
            if (ty < h && tx < w) {
                atomicMin(&depth_render[(ty * w + tx)], this_depth);
            }
        }
    }
}
```
