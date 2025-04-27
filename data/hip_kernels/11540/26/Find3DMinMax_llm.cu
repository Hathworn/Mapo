#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Find3DMinMax(int *d_Result, float *d_Data1, float *d_Data2, float *d_Data3, int width, int height) {
    // Use dynamic shared memory declaration
    extern __shared__ float sharedData[];

    // Data cache allocation in shared memory
    float* data1 = sharedData;
    float* data2 = &sharedData[3 * (MINMAX_SIZE + 2)];
    float* data3 = &sharedData[6 * (MINMAX_SIZE + 2)];
    float* ymin1 = &sharedData[9 * (MINMAX_SIZE + 2)];
    float* ymin2 = &sharedData[10 * (MINMAX_SIZE + 2)];
    float* ymin3 = &sharedData[11 * (MINMAX_SIZE + 2)];
    float* ymax1 = &sharedData[12 * (MINMAX_SIZE + 2)];
    float* ymax2 = &sharedData[13 * (MINMAX_SIZE + 2)];
    float* ymax3 = &sharedData[14 * (MINMAX_SIZE + 2)];

    const int tx = threadIdx.x;
    const int xStart = blockIdx.x * MINMAX_SIZE;
    const int xEnd = xStart + MINMAX_SIZE - 1;
    const int xReadPos = xStart + tx - WARP_SIZE;
    const int xWritePos = xStart + tx;
    const int xEndClamped = min(xEnd, width - 1);
    int memWid = MINMAX_SIZE + 2;
    int memPos0 = (tx - WARP_SIZE + 1);
    int memPos1 = (tx - WARP_SIZE + 1);
    int yq = 0;
    unsigned int output = 0;

    for (int y = 0; y < 34; ++y) {
        output >>= 1;
        
        // Use offsets instead of individual loop variable to reduce algebra operations
        int yp = max(32 * blockIdx.y + y - 1, 0);
        yp = min(yp, height - 1);
        int readStart = __mul24(yp, width);

        int memPos = yq * memWid + memPos0;

        // Unified loading condition to reduce instruction divergence 
        if (tx >= (WARP_SIZE - 1)) {
            float value1 = (xReadPos >= 0 && xReadPos < width) ? d_Data1[readStart + xReadPos] : 0;
            float value2 = (xReadPos >= 0 && xReadPos < width) ? d_Data2[readStart + xReadPos] : 0;
            float value3 = (xReadPos >= 0 && xReadPos < width) ? d_Data3[readStart + xReadPos] : 0;
            data1[memPos] = value1;
            data2[memPos] = value2;
            data3[memPos] = value3;
        }
        __syncthreads();

        int memPos2 = yq * memWid + tx;

        if (y > 1 && tx < memWid) {  // Combine condition to reduce __syncthreads calls
            float min1 = fminf(fminf(data1[memPos0], data1[memPos1]), data1[memPos2]);
            float min2 = fminf(fminf(data2[memPos0], data2[memPos1]), data2[memPos2]);
            float min3 = fminf(fminf(data3[memPos0], data3[memPos1]), data3[memPos2]);
            float max1 = fmaxf(fmaxf(data1[memPos0], data1[memPos1]), data1[memPos2]);
            float max2 = fmaxf(fmaxf(data2[memPos0], data2[memPos1]), data2[memPos2]);
            float max3 = fmaxf(fmaxf(data3[memPos0], data3[memPos1]), data3[memPos2]);

            ymin1[tx] = min1;
            ymin2[tx] = fminf(fminf(min1, min2), min3);
            ymin3[tx] = min3;
            ymax1[tx] = max1;
            ymax2[tx] = fmaxf(fmaxf(max1, max2), max3);
            ymax3[tx] = max3;
        }
        __syncthreads();

        if (y > 1 && tx < MINMAX_SIZE && xWritePos <= xEndClamped) {  // Combine conditions to reduce checks
            float minv = fminf(fminf(fminf(fminf(fminf(ymin2[tx], ymin2[tx + 2]), ymin1[tx + 1]),
                                          ymin3[tx + 1]), data2[memPos0 + 1]), data2[memPos2 + 1]);
            minv = fminf(minv, d_ConstantA[1]);

            float maxv = fmaxf(fmaxf(fmaxf(fmaxf(fmaxf(ymax2[tx], ymax2[tx + 2]), ymax1[tx + 1]),
                                          ymax3[tx + 1]), data2[memPos0 + 1]), data2[memPos2 + 1]);
            maxv = fmaxf(maxv, d_ConstantA[0]);

            if (data2[memPos1 + 1] < minv || data2[memPos1 + 1] > maxv) {
                output |= 0x80000000;
            }
        }
        __syncthreads();

        memPos0 = memPos1;
        memPos1 = memPos2;
        yq = (yq < 2 ? yq + 1 : 0);
    }

    if (tx < MINMAX_SIZE && xWritePos < width) {
        int writeStart = __mul24(blockIdx.y, width) + xWritePos;
        d_Result[writeStart] = output;
    }
}