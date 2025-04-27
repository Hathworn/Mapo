#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ScaleUp(float *d_Result, float *d_Data, int width, int pitch, int height, int newpitch)
{
    #undef BW
    #undef BH
    #define BW (SCALEUP_W/2 + 2)
    #define BH (SCALEUP_H/2 + 2)
    __shared__ float buffer[BW*BH];

    const int tx = threadIdx.x;
    const int ty = threadIdx.y;
    const int bx = blockIdx.x * (SCALEUP_W / 2);
    const int by = blockIdx.y * (SCALEUP_H / 2);

    int x = min(max(bx + tx - 1, 0), width - 1);
    int y = min(max(by + ty - 1, 0), height - 1);

    // Load data into shared memory
    if (tx < BW && ty < BH) {
        buffer[ty * BW + tx] = d_Data[y * pitch + x];
    }
    __syncthreads();

    // Calculate output position
    x = bx * 2 + tx;
    y = by * 2 + ty;

    if (x < 2 * width && y < 2 * height) {
        int localX = (tx + 1) / 2;
        int localY = (ty + 1) / 2;
        int index = localY * BW + localX;
        float wx = 0.25f + (tx & 1) * 0.50f;
        float wy = 0.25f + (ty & 1) * 0.50f;

        // Compute interpolated value
        d_Result[y * newpitch + x] = 
            wy * (wx * buffer[index] + (1.0f - wx) * buffer[index + 1]) +
            (1.0f - wy) * (wx * buffer[index + BW] + (1.0f - wx) * buffer[index + BW + 1]);
    }
}