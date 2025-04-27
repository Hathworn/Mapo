#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Find3DMinMax(int *d_Result, float *d_Data1, float *d_Data2, float *d_Data3, int width, int height)
{
    // Improved cache by reducing redundant memory usage
    __shared__ float data1[(MINMAX_SIZE + 2) * 3];
    __shared__ float data2[(MINMAX_SIZE + 2) * 3];
    __shared__ float data3[(MINMAX_SIZE + 2) * 3];
    __shared__ float ymin[(MINMAX_SIZE + 2) * 3];
    __shared__ float ymax[(MINMAX_SIZE + 2) * 3];

    const int tx = threadIdx.x;
    const int xStart = blockIdx.x * MINMAX_SIZE;
    const int xEndClamped = min(xStart + MINMAX_SIZE - 1, width - 1);
    const int xReadPos = xStart + tx - WARP_SIZE;
    const int xWritePos = xStart + tx;
    int memWid = MINMAX_SIZE + 2;

    int memPos0 = (tx - WARP_SIZE + 1);
    int memPos1 = (tx - WARP_SIZE + 1);
    int yq = 0;
    unsigned int output = 0;
    
    for (int y = 0; y < 34; y++) {
        output >>= 1;
        int memPos = yq * memWid + (tx - WARP_SIZE + 1);
        int yp = 32 * blockIdx.y + y - 1;
        yp = max(yp, 0);
        yp = min(yp, height - 1);
        int readStart = yp * width;

        // Reducing branch divergence and improving memory access
        if (tx >= (WARP_SIZE - 1) && xReadPos >= 0 && xReadPos < width) {
            data1[memPos] = d_Data1[readStart + xReadPos];
            data2[memPos] = d_Data2[readStart + xReadPos];
            data3[memPos] = d_Data3[readStart + xReadPos];
        } else {
            data1[memPos] = 0;
            data2[memPos] = 0;
            data3[memPos] = 0;
        }
        __syncthreads();

        int memPos2 = yq * memWid + tx;
        if (y > 1 && tx < memWid) {
            // Utilize shared memory efficiently
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

        if (y > 1 && tx < MINMAX_SIZE && xWritePos <= xEndClamped) {
            // Streamlined conditional checks
            float minv = fminf(ymin[tx], fminf(ymin[tx + 2], data2[memPos2 + 1]));
            minv = fminf(minv, d_ConstantA[1]);
            float maxv = fmaxf(ymax[tx], fmaxf(ymax[tx + 2], data2[memPos2 + 1]));
            maxv = fmaxf(maxv, d_ConstantA[0]);
            
            if (data2[memPos1 + 1] < minv || data2[memPos1 + 1] > maxv)
                output |= 0x80000000;
        }
        __syncthreads();

        memPos0 = memPos1;
        memPos1 = memPos2;
        yq = (yq < 2 ? yq + 1 : 0);
    }
    
    if (tx < MINMAX_SIZE && xWritePos < width) {
        int writeStart = blockIdx.y * width + xWritePos;
        d_Result[writeStart] = output;
    }
}