#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Find3DMinMax(int *d_Result, float *d_Data1, float *d_Data2, float *d_Data3, int width, int pitch, int height)
{
    // Optimizing shared memory usage
    __shared__ float data1[3*(MINMAX_W + 2)];
    __shared__ float data2[3*(MINMAX_W + 2)];
    __shared__ float data3[3*(MINMAX_W + 2)];
    __shared__ float ymin[(MINMAX_W + 2)];
    __shared__ float ymax[(MINMAX_W + 2)];

    // Current tile and apron limits, relative to row start
    const int tx = threadIdx.x;
    const int xStart = blockIdx.x * MINMAX_W;
    const int xEndClamped = min(xStart + MINMAX_W - 1, width - 1);
    const int memWid = MINMAX_W + 2;
    
    int xReadPos = xStart + tx - WARP_SIZE;
    int xWritePos = xStart + tx;
    int memPos0 = tx - WARP_SIZE + 1;
    int memPos1 = memPos0;
    int yq = 0;
    unsigned int output = 0;

    for (int y = 0; y < 32 + 2; y++) {
        output >>= 1;
        int memPos = yq * memWid + memPos0;
        int yp = max(32 * blockIdx.y + y - 1, 0);
        yp = min(yp, height - 1);
        int readStart = yp * pitch;

        // Efficient data loading
        if (tx >= (WARP_SIZE - 1)) {
            float val1 = (xReadPos < 0 || xReadPos >= width) ? 0 : d_Data1[readStart + xReadPos];
            float val2 = (xReadPos < 0 || xReadPos >= width) ? 0 : d_Data2[readStart + xReadPos];
            float val3 = (xReadPos < 0 || xReadPos >= width) ? 0 : d_Data3[readStart + xReadPos];
            data1[memPos] = val1;
            data2[memPos] = val2;
            data3[memPos] = val3;
        }
        __syncthreads();

        int memPos2 = yq * memWid + tx;
        if (y > 1 && tx < memWid) {
            // Combine computations to minimize shared memory accesses
            float min1 = fminf(fminf(data1[memPos0], data1[memPos1]), data1[memPos2]);
            float min2 = fminf(fminf(data2[memPos0], data2[memPos1]), data2[memPos2]);
            float min3 = fminf(fminf(data3[memPos0], data3[memPos1]), data3[memPos2]);
            float max1 = fmaxf(fmaxf(data1[memPos0], data1[memPos1]), data1[memPos2]);
            float max2 = fmaxf(fmaxf(data2[memPos0], data2[memPos1]), data2[memPos2]);
            float max3 = fmaxf(fmaxf(data3[memPos0], data3[memPos1]), data3[memPos2]);
            ymin[tx] = fminf(fminf(min1, min2), min3);
            ymax[tx] = fmaxf(fmaxf(max1, max2), max3);
        }
        __syncthreads();

        if (y > 1 && tx < MINMAX_W && xWritePos <= xEndClamped) {
            // Simplify min and max calculations
            float minv = fminf(fminf(fminf(ymin[tx], ymin[tx + 2]), data2[memPos0 + 1]), data2[memPos2 + 1]);
            minv = fminf(minv, d_Threshold[1]);
            float maxv = fmaxf(fmaxf(fmaxf(ymax[tx], ymax[tx + 2]), data2[memPos0 + 1]), data2[memPos2 + 1]);
            maxv = fmaxf(maxv, d_Threshold[0]);
            if (data2[memPos1 + 1] < minv || data2[memPos1 + 1] > maxv) {
                output |= 0x80000000;
            }
        }
        __syncthreads();

        memPos0 = memPos1;
        memPos1 = memPos2;
        yq = (yq < 2 ? yq + 1 : 0);
    }

    if (tx < MINMAX_W && xWritePos < width) {
        int writeStart = blockIdx.y * pitch + xWritePos;
        d_Result[writeStart] = output;
    }
}