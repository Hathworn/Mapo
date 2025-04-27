#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void to3d_point(float *depth, float *points3d)
{
    int x = blockIdx.x * TILE_DIM + threadIdx.x;
    int y = blockIdx.y * TILE_DIM + threadIdx.y;
    int w = gridDim.x * TILE_DIM;
    int h = w / 2;

    // Unroll the loop to increase parallel execution efficiency
    for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS)
    {
        int iw = x;
        int ih = y + j;
        
        // Reduce global memory access
        int index = ih * w + iw;
        float depth_point = depth[index] * 128.0f;
        float phi = ((float)(ih) + 0.5f) / (float)h * M_PI;
        float theta = ((float)(iw) + 0.5f) / (float)w * 2 * M_PI + M_PI;

        // Precalculate common expressions
        float sin_phi = sin(phi);
        float cos_phi = cos(phi);
        float cos_theta = cos(theta);
        float sin_theta = sin(theta);

        points3d[index * 4 + 0] = depth_point * sin_phi * cos_theta;
        points3d[index * 4 + 1] = depth_point * sin_phi * sin_theta;
        points3d[index * 4 + 2] = depth_point * cos_phi;
        points3d[index * 4 + 3] = 1.0f;
    }
}