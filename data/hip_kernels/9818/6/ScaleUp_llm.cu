#include "hip/hip_runtime.h"
#include "includes.h"

#define BW (SCALEUP_W/2 + 2)
#define BH (SCALEUP_H/2 + 2)

__global__ void ScaleUp(float *d_Result, float *d_Data, int width, int pitch, int height, int newpitch)
{
    __shared__ float buffer[BW*BH];

    const int tx = threadIdx.x;
    const int ty = threadIdx.y;
    const int blockX = blockIdx.x * (SCALEUP_W / 2);
    const int blockY = blockIdx.y * (SCALEUP_H / 2);

    // Optimize shared memory loading with fewer conditionals
    if (tx < BW && ty < BH) {
        int x = min(max(blockX + tx - 1, 0), width - 1);
        int y = min(max(blockY + ty - 1, 0), height - 1);
        buffer[ty * BW + tx] = d_Data[y * pitch + x];
    }
    
    __syncthreads();

    int x = blockIdx.x * SCALEUP_W + tx;
    int y = blockIdx.y * SCALEUP_H + ty;

    // Use pre-computed indices and weights for simplicity
    if (x < 2 * width && y < 2 * height) {
        int bx = (tx + 1) >> 1;
        int by = (ty + 1) >> 1;
        int bp = by * BW + bx;
        float wx = 0.25f + (tx & 1) * 0.50f;
        float wy = 0.25f + (ty & 1) * 0.50f;

        d_Result[y * newpitch + x] = wy * (wx * buffer[bp] + (1.0f - wx) * buffer[bp + 1]) +
                                     (1.0f - wy) * (wx * buffer[bp + BW] + (1.0f - wx) * buffer[bp + BW + 1]);
    }
}