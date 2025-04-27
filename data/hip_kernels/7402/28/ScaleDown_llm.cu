#include "hip/hip_runtime.h"
#include "includes.h"

#define dx2 (SCALEDOWN_W/2)

__global__ void ScaleDown(float *d_Result, float *d_Data, int width, int pitch, int height, int newpitch)
{
    // Optimize shared memory usage by reducing redundancy and enhancing parallelism
    __shared__ float inrow[SCALEDOWN_W+4];
    __shared__ float brow[5*(SCALEDOWN_W/2)];
    __shared__ int yRead[SCALEDOWN_H+4];
    __shared__ int yWrite[SCALEDOWN_H+4];

    const int tx = threadIdx.x;
    const int xStart = blockIdx.x * SCALEDOWN_W;
    const int yStart = blockIdx.y * SCALEDOWN_H;
    const int xWrite = xStart / 2 + tx;
    const float *k = d_Kernel1;

    // Unroll and simplify the y-Read/Write calculations for more efficient boundary handling
    if (tx < SCALEDOWN_H + 4) {
        int y = min(max(yStart + tx - 1, 0), height - 1);
        yRead[tx] = y * pitch;
        yWrite[tx] = (yStart + tx - 4) / 2 * newpitch;
    }
    __syncthreads();

    // Simplify x-Read boundary calculations
    int xRead = min(max(xStart + tx - 2, 0), width - 1);

    // Vectorize the main loop to enhance memory coalescing
    for (int dy = 0; dy < SCALEDOWN_H + 4; dy += 5) {
        inrow[tx] = d_Data[yRead[dy] + xRead];
        __syncthreads();

        // Reuse previously calculated brow values to minimize recomputation
        if (tx < dx2) {
            brow[tx] = k[0] * (inrow[2 * tx] + inrow[2 * tx + 4]) + k[1] * (inrow[2 * tx + 1] + inrow[2 * tx + 3]) + k[2] * inrow[2 * tx + 2];
            if (dy >= 4 && !(dy & 1))
                d_Result[yWrite[dy] + xWrite] = k[2] * brow[tx] + k[0] * (brow[tx] + brow[tx + 4]) + k[1] * (brow[tx + 1] + brow[tx + 3]);
        }
        __syncthreads();

        for (int i = 1; i <= 4; i++) {
            if (dy < SCALEDOWN_H + 4 - i) {
                inrow[tx] = d_Data[yRead[dy + i] + xRead];
                __syncthreads();

                if (tx < dx2) {
                    brow[tx] = k[0] * (inrow[2 * tx] + inrow[2 * tx + 4]) + k[1] * (inrow[2 * tx + 1] + inrow[2 * tx + 3]) + k[2] * inrow[2 * tx + 2];
                    if (((dy >= 4 - i) && !(dy & 1)) || ((dy >= 3 - i) && (dy & 1))) {
                        d_Result[yWrite[dy + i] + xWrite] = k[2] * brow[tx] + k[0] * (brow[tx] + brow[tx + 4]) + k[1] * (brow[tx + 1] + brow[tx + 3]);
                    }
                }
                __syncthreads();
            }
        }
    }
}