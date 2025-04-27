#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Find3DMinMax(int *d_Result, float *d_Data1, float *d_Data2, float *d_Data3, int width, int pitch, int height)
{
    // Using shared memory for data caching.
    __shared__ float s_data1[3 * (MINMAX_W + 2)];
    __shared__ float s_data2[3 * (MINMAX_W + 2)];
    __shared__ float s_data3[3 * (MINMAX_W + 2)];

    // Shared memory for min and max calculations within a tile.
    __shared__ float s_ymin1[(MINMAX_W + 2)], s_ymin2[(MINMAX_W + 2)], s_ymin3[(MINMAX_W + 2)];
    __shared__ float s_ymax1[(MINMAX_W + 2)], s_ymax2[(MINMAX_W + 2)], s_ymax3[(MINMAX_W + 2)];

    const int tx = threadIdx.x;
    const int xStart = blockIdx.x * MINMAX_W;
    const int xEndClamped = min(xStart + MINMAX_W - 1, width - 1);
    const int xReadPos = xStart + tx - WARP_SIZE;
    const int xWritePos = xStart + tx;
    int memWid = MINMAX_W + 2;

    int memPos0 = (tx - WARP_SIZE + 1);
    int memPos1 = memPos0;
    int yIndex = 0;
    unsigned int output = 0;

    for (int y = 0; y < 34; ++y) { // Merged loop init with reset for y.
        output >>= 1; // Right shift output bits.

        int memPos = yIndex * memWid + memPos0;
        int yp = 32 * blockIdx.y + y - 1;
        yp = min(max(yp, 0), height - 1);
        int readStart = yp * pitch;

        // Load data into shared memory.
        if (tx >= (WARP_SIZE - 1)) {
            float fetch1 = (xReadPos >= 0 && xReadPos < width) ? d_Data1[readStart + xReadPos] : 0;
            float fetch2 = (xReadPos >= 0 && xReadPos < width) ? d_Data2[readStart + xReadPos] : 0;
            float fetch3 = (xReadPos >= 0 && xReadPos < width) ? d_Data3[readStart + xReadPos] : 0;
            s_data1[memPos] = fetch1;
            s_data2[memPos] = fetch2;
            s_data3[memPos] = fetch3;
        }
        __syncthreads();

        int memPos2 = yIndex * memWid + tx;
        if (y > 1) { // Min-max logic applied after two initial rows are read.
            if (tx < memWid) {
                float min1 = fminf(fminf(s_data1[memPos0], s_data1[memPos1]), s_data1[memPos2]);
                float min2 = fminf(fminf(s_data2[memPos0], s_data2[memPos1]), s_data2[memPos2]);
                float min3 = fminf(fminf(s_data3[memPos0], s_data3[memPos1]), s_data3[memPos2]);
                float max1 = fmaxf(fmaxf(s_data1[memPos0], s_data1[memPos1]), s_data1[memPos2]);
                float max2 = fmaxf(fmaxf(s_data2[memPos0], s_data2[memPos1]), s_data2[memPos2]);
                float max3 = fmaxf(fmaxf(s_data3[memPos0], s_data3[memPos1]), s_data3[memPos2]);

                s_ymin1[tx] = min1;
                s_ymin2[tx] = fminf(fminf(min1, min2), min3);
                s_ymin3[tx] = min3;
                s_ymax1[tx] = max1;
                s_ymax2[tx] = fmaxf(fmaxf(max1, max2), max3);
                s_ymax3[tx] = max3;
            }
        }
        __syncthreads();

        if (y > 1 && tx < MINMAX_W && xWritePos <= xEndClamped) { // Range checks prior to writing output.
            float minv = fminf(fminf(fminf(fminf(fminf(s_ymin2[tx], s_ymin2[tx + 2]), s_ymin1[tx + 1]), s_ymin3[tx + 1]), s_data2[memPos0 + 1]), s_data2[memPos2 + 1]);
            minv = fminf(minv, d_Threshold[1]);
            float maxv = fmaxf(fmaxf(fmaxf(fmaxf(fmaxf(s_ymax2[tx], s_ymax2[tx + 2]), s_ymax1[tx + 1]), s_ymax3[tx + 1]), s_data2[memPos0 + 1]), s_data2[memPos2 + 1]);
            maxv = fmaxf(maxv, d_Threshold[0]);

            if (s_data2[memPos1 + 1] < minv || s_data2[memPos1 + 1] > maxv)
                output |= 0x80000000; // Set flag for result.
        }
        __syncthreads();

        memPos0 = memPos1;
        memPos1 = memPos2;
        yIndex = (yIndex < 2) ? yIndex + 1 : 0; // Cycles through memory positions for caching.
    }

    if (tx < MINMAX_W && xWritePos < width) {
        int writeStart = blockIdx.y * pitch + xWritePos;
        d_Result[writeStart] = output;
    }
}