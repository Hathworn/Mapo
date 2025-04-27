#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Find3DMinMax(int *d_Result, float *d_Data1, float *d_Data2, float *d_Data3, int width, int pitch, int height)
{
    // Data cache with optimized shared memory utilization
    __shared__ float data1[3 * (MINMAX_W + 2)];
    __shared__ float data2[3 * (MINMAX_W + 2)];
    __shared__ float data3[3 * (MINMAX_W + 2)];
    __shared__ float ymin1[MINMAX_W + 2];
    __shared__ float ymin2[MINMAX_W + 2];
    __shared__ float ymin3[MINMAX_W + 2];
    __shared__ float ymax1[MINMAX_W + 2];
    __shared__ float ymax2[MINMAX_W + 2];
    __shared__ float ymax3[MINMAX_W + 2];

    // Current tile and apron limits, relative to row start
    const int tx = threadIdx.x;
    const int xStart = blockIdx.x * MINMAX_W;
    const int xEnd = xStart + MINMAX_W - 1;
    const int xReadPos = xStart + tx - WARP_SIZE;
    const int xWritePos = xStart + tx;
    const int xEndClamped = min(xEnd, width - 1);
    const int memWid = MINMAX_W + 2;

    int memPos0 = (tx - WARP_SIZE + 1);
    int memPos1 = (tx - WARP_SIZE + 1);
    int yq = 0;
    unsigned int output = 0;

    for (int y = 0; y < 32 + 2; y++) {
        output >>= 1;
        const int memPos = yq * memWid + (tx - WARP_SIZE + 1);
        int yp = 32 * blockIdx.y + y - 1;
        yp = clamp(yp, 0, height - 1);
        int readStart = yp * pitch;

        // Load data into shared memory with boundary checks
        if (tx >= (WARP_SIZE - 1)) {
            if (xReadPos >= 0 && xReadPos < width) {
                data1[memPos] = d_Data1[readStart + xReadPos];
                data2[memPos] = d_Data2[readStart + xReadPos];
                data3[memPos] = d_Data3[readStart + xReadPos];
            } else {
                data1[memPos] = 0;
                data2[memPos] = 0;
                data3[memPos] = 0;
            }
        }
        __syncthreads();

        int memPos2 = yq * memWid + tx;
        if (y > 1) {
            if (tx < memWid) {
                // Calculate min/max using the shared memory data
                float min1 = fminf(fminf(data1[memPos0], data1[memPos1]), data1[memPos2]);
                float min2 = fminf(fminf(data2[memPos0], data2[memPos1]), data2[memPos2]);
                float min3 = fminf(fminf(data3[memPos0], data3[memPos1]), data3[memPos2]);
                float max1 = fmaxf(fmaxf(data1[memPos0], data1[memPos1]), data1[memPos2]);
                float max2 = fmaxf(fmaxf(data2[memPos0], data2[memPos1]), data2[memPos2]);
                float max3 = fmaxf(fmaxf(data3[memPos0], data3[memPos1]), data3[memPos2]);
                ymin1[tx] = min1;
                ymin2[tx] = fminf(min1, fminf(min2, min3));
                ymin3[tx] = min3;
                ymax1[tx] = max1;
                ymax2[tx] = fmaxf(max1, fmaxf(max2, max3));
                ymax3[tx] = max3;
            }
        }
        __syncthreads();

        if (y > 1) {
            if (tx < MINMAX_W) {
                if (xWritePos <= xEndClamped) {
                    // Compute final min/max and apply threshold
                    float minv = fminf(ymin2[tx], ymin2[tx + 2]);
                    minv = fminf(minv, fminf(ymin1[tx + 1], ymin3[tx + 1]));
                    minv = fminf(minv, fminf(data2[memPos0 + 1], data2[memPos2 + 1]));
                    minv = fminf(minv, d_Threshold[1]);
                    
                    float maxv = fmaxf(ymax2[tx], ymax2[tx + 2]);
                    maxv = fmaxf(maxv, fmaxf(ymax1[tx + 1], ymax3[tx + 1]));
                    maxv = fmaxf(maxv, fmaxf(data2[memPos0 + 1], data2[memPos2 + 1]));
                    maxv = fmaxf(maxv, d_Threshold[0]);
                    
                    if (data2[memPos1 + 1] < minv || data2[memPos1 + 1] > maxv) {
                        output |= 0x80000000;
                    }
                }
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