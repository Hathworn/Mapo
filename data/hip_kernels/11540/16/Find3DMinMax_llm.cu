#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Find3DMinMax(int *d_Result, float *d_Data1, float *d_Data2, float *d_Data3, int width, int pitch, int height)
{
    // Data cache
    __shared__ float data1[3*(MINMAX_W + 2)];
    __shared__ float data2[3*(MINMAX_W + 2)];
    __shared__ float data3[3*(MINMAX_W + 2)];
    __shared__ float ymin1[(MINMAX_W + 2)];
    __shared__ float ymin2[(MINMAX_W + 2)];
    __shared__ float ymin3[(MINMAX_W + 2)];
    __shared__ float ymax1[(MINMAX_W + 2)];
    __shared__ float ymax2[(MINMAX_W + 2)];
    __shared__ float ymax3[(MINMAX_W + 2)];

    // Current tile and apron limits, relative to row start
    const int tx = threadIdx.x;
    const int xStart = blockIdx.x * MINMAX_W;
    const int xEndClamped = min(xStart + MINMAX_W - 1, width - 1);
    int memWid = MINMAX_W + 2;

    int memPos0 = (tx - WARP_SIZE + 1);
    int memPos1 = (tx - WARP_SIZE + 1);
    int yq = 0;
    unsigned int output = 0;

    for (int y = 0; y < 32 + 2; y++) {
        output >>= 1;
        int memPos = yq * memWid + memPos0;
        int yp = 32 * blockIdx.y + y - 1;
        yp = max(yp, 0);
        yp = min(yp, height - 1);
        int readStart = yp * pitch;

        // Set the entire data cache contents
        if (tx >= (WARP_SIZE - 1)) {
            if (tx + xStart - WARP_SIZE < 0 || tx + xStart - WARP_SIZE >= width) {
                data1[memPos] = 0;
                data2[memPos] = 0;
                data3[memPos] = 0;
            } else {
                data1[memPos] = d_Data1[readStart + tx + xStart - WARP_SIZE];
                data2[memPos] = d_Data2[readStart + tx + xStart - WARP_SIZE];
                data3[memPos] = d_Data3[readStart + tx + xStart - WARP_SIZE];
            }
        }
        __syncthreads();

        int memPos2 = yq * memWid + tx;

        // Compute 3D minimum and maximum values
        if (y > 1 && tx < memWid) {
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

        // Evaluate threshold conditions
        if (y > 1 && tx < MINMAX_W && (tx + xStart) <= xEndClamped) {
            float minv = fminf(fminf(ymin2[tx], ymin2[tx+2]), ymin1[tx+1]);
            minv = fminf(minv, fminf(ymin3[tx+1], data2[memPos0+1]));
            minv = fminf(minv, d_Threshold[1]);
            float maxv = fmaxf(fmaxf(ymax2[tx], ymax2[tx+2]), ymax1[tx+1]);
            maxv = fmaxf(maxv, fmaxf(ymax3[tx+1], data2[memPos0+1]));
            maxv = fmaxf(maxv, d_Threshold[0]);
            if (data2[memPos1+1] < minv || data2[memPos1+1] > maxv)
                output |= 0x80000000;
        }
        __syncthreads();

        memPos0 = memPos1;
        memPos1 = memPos2;
        yq = (yq < 2 ? yq + 1 : 0);
    }
    
    // Write results
    if (tx < MINMAX_W && (tx + xStart) < width) {
        int writeStart = blockIdx.y * pitch + (tx + xStart);
        d_Result[writeStart] = output;
    }
}