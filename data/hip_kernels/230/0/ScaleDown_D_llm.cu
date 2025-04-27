#include "hip/hip_runtime.h"
#include "includes.h"

__constant__ float d_Threshold[2];
__constant__ float d_Scales[8], d_Factor;
__constant__ float d_EdgeLimit;
__constant__ int d_MaxNumPoints;

__device__ unsigned int d_PointCounter[1];
__constant__ float d_Kernel1[5];
__constant__ float d_Kernel2[12*16];

__global__ void ScaleDown_D(float *d_Result, float *d_Data, int width, int pitch, int height, int newpitch) {
    __shared__ float inrow[SCALEDOWN_W + 4];
    __shared__ float brow[5 * (SCALEDOWN_W / 2)];

    __shared__ int yRead[SCALEDOWN_H + 4];
    __shared__ int yWrite[SCALEDOWN_H + 4];

    const int tx = threadIdx.x;

    // Optimize by calculating dx2 outside the loops
    const int dx2 = SCALEDOWN_W / 2;
    const int txIndices[5] = { tx, tx + dx2, tx + 2 * dx2, tx + 3 * dx2, tx + 4 * dx2 };

    const int xStart = blockIdx.x * SCALEDOWN_W;
    const int yStart = blockIdx.y * SCALEDOWN_H;
    const int xWrite = xStart / 2 + tx;
    int xRead = xStart + tx - 2;
    xRead = (xRead < 0 ? 0 : xRead);
    xRead = (xRead >= width ? width - 1 : xRead);

    const float *k = d_Kernel1;

    if (tx < SCALEDOWN_H + 4) {
        int y = yStart + tx - 1;
        y = (y < 0 ? 0 : y);
        y = (y >= height ? height - 1 : y);

        yRead[tx] = y * pitch;
        yWrite[tx] = (yStart + tx - 4) / 2 * newpitch;
    }

    __syncthreads();

    for (int dy = 0; dy < SCALEDOWN_H + 4; dy += 5) {
        inrow[tx] = d_Data[yRead[dy] + xRead];
        __syncthreads();

        if (tx < dx2) {
            brow[txIndices[0]] = k[0] * (inrow[2 * tx] + inrow[2 * tx + 4]) +
                                 k[1] * (inrow[2 * tx + 1] + inrow[2 * tx + 3]) +
                                 k[2] * inrow[2 * tx + 2];
        }

        __syncthreads();

        if (tx < dx2 && dy >= 4 && !(dy & 1)) {
            d_Result[yWrite[dy] + xWrite] = k[2] * brow[txIndices[2]] +
                                            k[0] * (brow[txIndices[0]] + brow[txIndices[4]]) +
                                            k[1] * (brow[txIndices[1]] + brow[txIndices[3]]);
        }

        // Optimize by reducing redundancy in loop
        for (int i = 1; i < 5 && dy + i < SCALEDOWN_H + 4; i++) {
            inrow[tx] = d_Data[yRead[dy + i] + xRead];
            __syncthreads();
            if (tx < dx2) {
                brow[txIndices[i]] = k[0] * (inrow[2 * tx] + inrow[2 * tx + 4]) +
                                     k[1] * (inrow[2 * tx + 1] + inrow[2 * tx + 3]) +
                                     k[2] * inrow[2 * tx + 2];
            }
            __syncthreads();

            int cond = ((dy + i - 1) >= 0 && ((dy + i - 1) & 1) != (i & 1));
            if (tx < dx2 && cond) {
                d_Result[yWrite[dy + i] + xWrite] = k[2] * brow[txIndices[(i+2)%5]] + 
                                                    k[0] * (brow[txIndices[i]] + brow[txIndices[(i+3)%5]]) +
                                                    k[1] * (brow[txIndices[(i+1)%5]] + brow[txIndices[(i+4)%5]]);
            }
        }
        __syncthreads();
    }
}