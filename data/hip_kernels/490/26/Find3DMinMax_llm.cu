#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel function
__global__ void Find3DMinMax(int *d_Result, float *d_Data1, float *d_Data2, float *d_Data3, int width, int height)
{
    // Improved shared memory usage with minimal allocation
    __shared__ float data1[MINMAX_SIZE + 2];
    __shared__ float data2[MINMAX_SIZE + 2];
    __shared__ float data3[MINMAX_SIZE + 2];
    __shared__ float ymin1[MINMAX_SIZE];
    __shared__ float ymin2[MINMAX_SIZE];
    __shared__ float ymin3[MINMAX_SIZE];
    __shared__ float ymax1[MINMAX_SIZE];
    __shared__ float ymax2[MINMAX_SIZE];
    __shared__ float ymax3[MINMAX_SIZE];

    const int tx = threadIdx.x;
    const int xStart = blockIdx.x * MINMAX_SIZE;
    const int xEndClamped = min(xStart + MINMAX_SIZE - 1, width - 1);
    const int xReadPos = xStart + tx - WARP_SIZE + 1;
    const int xWritePos = xStart + tx;
    int yq = 0;
    unsigned int output = 0;

    // Read data within a vertical strip
    for (int y = 0; y < 34; y++) {
        output >>= 1;
        int yp = max(32 * blockIdx.y + y - 1, 0);
        yp = min(yp, height - 1);
        int readStart = yp * width;

        // Cache data when within bounds
        if (tx >= WARP_SIZE - 1) {
            if (xReadPos >= 0 && xReadPos < width) {
                data1[tx] = d_Data1[readStart + xReadPos];
                data2[tx] = d_Data2[readStart + xReadPos];
                data3[tx] = d_Data3[readStart + xReadPos];
            } else {
                data1[tx] = 0;
                data2[tx] = 0;
                data3[tx] = 0;
            }
        }
        __syncthreads();

        int memPos2 = yq * (MINMAX_SIZE + 2) + tx;
        if (y > 1 && tx < MINMAX_SIZE + 2) {
            float min1 = fminf(fminf(data1[tx - 1], data1[tx]), data1[tx + 1]);
            float min2 = fminf(fminf(data2[tx - 1], data2[tx]), data2[tx + 1]);
            float min3 = fminf(fminf(data3[tx - 1], data3[tx]), data3[tx + 1]);
            float max1 = fmaxf(fmaxf(data1[tx - 1], data1[tx]), data1[tx + 1]);
            float max2 = fmaxf(fmaxf(data2[tx - 1], data2[tx]), data2[tx + 1]);
            float max3 = fmaxf(fmaxf(data3[tx - 1], data3[tx]), data3[tx + 1]);
            ymin1[tx] = min1;
            ymin2[tx] = fminf(fminf(min1, min2), min3);
            ymin3[tx] = min3;
            ymax1[tx] = max1;
            ymax2[tx] = fmaxf(fmaxf(max1, max2), max3);
            ymax3[tx] = max3;
        }
        __syncthreads();

        if (y > 1 && tx < MINMAX_SIZE && xWritePos <= xEndClamped) {
            float minv = fminf(fminf(fminf(fminf(fminf(ymin2[tx], ymin2[tx + 2]), ymin1[tx + 1]), ymin3[tx + 1]), data2[tx]), d_ConstantA[1]);
            float maxv = fmaxf(fmaxf(fmaxf(fmaxf(fmaxf(ymax2[tx], ymax2[tx + 2]), ymax1[tx + 1]), ymax3[tx + 1]), data2[tx]), d_ConstantA[0]);
            if (data2[tx] < minv || data2[tx] > maxv)
                output |= 0x80000000;
        }
        __syncthreads();

        yq = (yq < 2 ? yq + 1 : 0);
    }

    // Write results back to global memory
    if (tx < MINMAX_SIZE && xWritePos < width) {
        d_Result[blockIdx.y * width + xWritePos] = output;
    }
}