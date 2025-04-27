#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel
__global__ void Find3DMinMax(int *d_Result, float *d_Data1, float *d_Data2, float *d_Data3, int width, int pitch, int height) {
    __shared__ float data1[3 * (MINMAX_W + 2)];
    __shared__ float data2[3 * (MINMAX_W + 2)];
    __shared__ float data3[3 * (MINMAX_W + 2)];
    __shared__ float ymin1[(MINMAX_W + 2)];
    __shared__ float ymin2[(MINMAX_W + 2)];
    __shared__ float ymin3[(MINMAX_W + 2)];
    __shared__ float ymax1[(MINMAX_W + 2)];
    __shared__ float ymax2[(MINMAX_W + 2)];
    __shared__ float ymax3[(MINMAX_W + 2)];

    const int tx = threadIdx.x;
    const int xStart = blockIdx.x * MINMAX_W;
    const int xEndClamped = min(xStart + MINMAX_W - 1, width - 1);
    const int xReadPos = xStart + tx - WARP_SIZE;
    const int xWritePos = xStart + tx;
    const int memWid = MINMAX_W + 2;

    int memPos0 = tx - WARP_SIZE + 1;
    int memPos1 = memPos0;
    int yq = 0;
    unsigned int output = 0;

    for (int y = 0; y < 32 + 2; y++) {
        output >>= 1;
        int yp = min(max(32 * blockIdx.y + y - 1, 0), height - 1);
        int readStart = yp * pitch;

        if (tx >= WARP_SIZE - 1) {
            float data_val1 = (xReadPos < 0 || xReadPos >= width) ? 0 : d_Data1[readStart + xReadPos];
            float data_val2 = (xReadPos < 0 || xReadPos >= width) ? 0 : d_Data2[readStart + xReadPos];
            float data_val3 = (xReadPos < 0 || xReadPos >= width) ? 0 : d_Data3[readStart + xReadPos];
            
            data1[yq * memWid + memPos0] = data_val1;
            data2[yq * memWid + memPos0] = data_val2;
            data3[yq * memWid + memPos0] = data_val3;
        }
        __syncthreads();

        if (y > 1 && tx < memWid) {
            float min1 = fminf(fminf(data1[memPos0], data1[memPos1]), data1[yq * memWid + tx]);
            float min2 = fminf(fminf(data2[memPos0], data2[memPos1]), data2[yq * memWid + tx]);
            float min3 = fminf(fminf(data3[memPos0], data3[memPos1]), data3[yq * memWid + tx]);
            float max1 = fmaxf(fmaxf(data1[memPos0], data1[memPos1]), data1[yq * memWid + tx]);
            float max2 = fmaxf(fmaxf(data2[memPos0], data2[memPos1]), data2[yq * memWid + tx]);
            float max3 = fmaxf(fmaxf(data3[memPos0], data3[memPos1]), data3[yq * memWid + tx]);

            ymin1[tx] = min1;
            ymin2[tx] = fminf(fminf(min1, min2), min3);
            ymin3[tx] = min3;
            ymax1[tx] = max1;
            ymax2[tx] = fmaxf(fmaxf(max1, max2), max3);
            ymax3[tx] = max3;
        }
        __syncthreads();

        if (y > 1 && tx < MINMAX_W && xWritePos <= xEndClamped) {
            float minv = fminf(
                fminf(fminf(ymin2[tx], ymin2[tx+2]), ymin1[tx+1]),
                fminf(ymin3[tx+1], fminf(data2[memPos0+1], data2[yq * memWid + tx+1]))
            );
            minv = fminf(minv, d_Threshold[1]);

            float maxv = fmaxf(
                fmaxf(fmaxf(ymax2[tx], ymax2[tx+2]), ymax1[tx+1]),
                fmaxf(ymax3[tx+1], fmaxf(data2[memPos0+1], data2[yq * memWid + tx+1]))
            );
            maxv = fmaxf(maxv, d_Threshold[0]);

            if (data2[memPos1 + 1] < minv || data2[memPos1 + 1] > maxv) {
                output |= 0x80000000;
            }
        }
        __syncthreads();

        memPos0 = memPos1;
        memPos1 = yq * memWid + tx;
        yq = (yq < 2 ? yq + 1 : 0);
    }

    if (tx < MINMAX_W && xWritePos < width) {
        int writeStart = blockIdx.y * pitch + xWritePos;
        d_Result[writeStart] = output;
    }
}