#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Find3DMinMax(int *d_Result, float *d_Data1, float *d_Data2, float *d_Data3, int width, int pitch, int height) {
    // Data cache with reduced shared memory usage
    __shared__ float data1[3 * (MINMAX_W + 2)];
    __shared__ float data2[3 * (MINMAX_W + 2)];
    __shared__ float data3[3 * (MINMAX_W + 2)];
    __shared__ float ymin[(MINMAX_W + 2)];
    __shared__ float ymax[(MINMAX_W + 2)];

    // Current tile and apron limits, relative to row start
    const int tx = threadIdx.x;
    const int xStart = blockIdx.x * MINMAX_W;
    const int xEnd = xStart + MINMAX_W - 1;
    const int xReadPos = xStart + tx - WARP_SIZE;
    const int xWritePos = xStart + tx;
    const int xEndClamped = min(xEnd, width - 1);
    int memWid = MINMAX_W + 2;

    int memPos0 = tx - WARP_SIZE + 1;
    int yq = 0;
    unsigned int output = 0;

    for (int y = 0; y < 32 + 2; y++) {
        output >>= 1;
        int memPos = yq * memWid + memPos0;
        int yp = 32 * blockIdx.y + y - 1;
        yp = max(yp, 0);
        yp = min(yp, height - 1);
        int readStart = yp * pitch;

        if (tx >= (WARP_SIZE - 1)) {
            data1[memPos] = (xReadPos >= 0 && xReadPos < width) ? d_Data1[readStart + xReadPos] : 0;
            data2[memPos] = (xReadPos >= 0 && xReadPos < width) ? d_Data2[readStart + xReadPos] : 0;
            data3[memPos] = (xReadPos >= 0 && xReadPos < width) ? d_Data3[readStart + xReadPos] : 0;
        }
        __syncthreads();

        int memPos2 = yq * memWid + tx;
        if (y > 1 && tx < memWid) {
            // Compute min and max for all data dimensions simultaneously
            float min1 = fminf(data1[memPos0], data1[memPos2]);
            float min2 = fminf(data2[memPos0], data2[memPos2]);
            float min3 = fminf(data3[memPos0], data3[memPos2]);
            float max1 = fmaxf(data1[memPos0], data1[memPos2]);
            float max2 = fmaxf(data2[memPos0], data2[memPos2]);
            float max3 = fmaxf(data3[memPos0], data3[memPos2]);

            ymin[tx] = fminf(fminf(min1, min2), min3);
            ymax[tx] = fmaxf(fmaxf(max1, max2), max3);
        }
        __syncthreads();

        if (y > 1 && tx < MINMAX_W && xWritePos <= xEndClamped) {
            float minv = fminf(ymin[tx], d_Threshold[1]);
            float maxv = fmaxf(ymax[tx], d_Threshold[0]);
            if (data2[memPos0 + 1] < minv || data2[memPos0 + 1] > maxv) {
                output |= 0x80000000;
            }
        }
        __syncthreads();

        memPos0 = memPos2;
        yq = (yq < 2 ? yq + 1 : 0);
    }

    if (tx < MINMAX_W && xWritePos < width) {
        int writeStart = blockIdx.y * pitch + xWritePos;
        d_Result[writeStart] = output;
    }
}