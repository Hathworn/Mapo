#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transform2d(float *points3d_after, float fov_scale)
{
    int x = blockIdx.x * TILE_DIM + threadIdx.x;
    int y = blockIdx.y * TILE_DIM + threadIdx.y;
    int w = gridDim.x * TILE_DIM;

    // Utilize shared memory for better memory access efficiency
    __shared__ float shared_points[TILE_DIM * BLOCK_ROWS * 3];
    int local_tid = threadIdx.y * TILE_DIM + threadIdx.x;

    for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS)
    {
        int iw = x;
        int ih = y + j;
        int global_idx = (ih * w + iw) * 3;

        // Load points into shared memory
        shared_points[local_tid * 3 + 0] = points3d_after[global_idx + 0];
        shared_points[local_tid * 3 + 1] = points3d_after[global_idx + 1];
        shared_points[local_tid * 3 + 2] = points3d_after[global_idx + 2];
        __syncthreads();

        float x = shared_points[local_tid * 3 + 0];
        float y = shared_points[local_tid * 3 + 1];
        float z = shared_points[local_tid * 3 + 2];

        float x2 = fov_scale * x;

        // Use branchless programming for more efficient conditional updates
        bool condition = (x2 > 0) && (y < x2 * 1.1) && (y > -x2 * 1.1) && (z < x2 * 1.1) && (z > -x2 * 1.1);
        float denom = x2 + 1e-5;

        points3d_after[global_idx + 0] = x; // Unchanged
        points3d_after[global_idx + 1] = condition ? y / denom : -1;
        points3d_after[global_idx + 2] = condition ? -z / denom : -1;
    }
}