#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Find3DMinMax(int *d_Result, float *d_Data1, float *d_Data2, float *d_Data3, int width, int height)
{
    // Reduced shared memory usage
    __shared__ float dataCache[9 * (MINMAX_SIZE + 2)];
    __shared__ float ymin[3 * (MINMAX_SIZE + 2)];
    __shared__ float ymax[3 * (MINMAX_SIZE + 2)];

    // Current tile and apron limits, relative to row start
    const int tx = threadIdx.x;
    const int xStart = blockIdx.x * MINMAX_SIZE;
    const int xEndClamped = min(xStart + MINMAX_SIZE - 1, width - 1);
    int memWid = MINMAX_SIZE + 2;

    int memPos0 = (tx - WARP_SIZE + 1);
    int memPos1 = memPos0;
    int yq = 0;
    unsigned int output = 0;

    for (int y = 0; y < 34; y++) {
        output >>= 1;
        int memPos = yq * memWid + memPos0;
        int yp = 32 * blockIdx.y + y - 1;
        yp = clamp(yp, 0, height - 1);
        int readStart = yp * width;

        // Efficiently load data into shared memory
        if (tx >= (WARP_SIZE - 1)) {
            if (tx < MINMAX_SIZE + 2) {
                int xReadPos = xStart + tx - WARP_SIZE;
                if (xReadPos >= 0 && xReadPos < width) {
                    dataCache[memPos] = d_Data1[readStart + xReadPos];
                    dataCache[memPos + memWid] = d_Data2[readStart + xReadPos];
                    dataCache[memPos + 2 * memWid] = d_Data3[readStart + xReadPos];
                } else {
                    dataCache[memPos] = 0;
                    dataCache[memPos + memWid] = 0;
                    dataCache[memPos + 2 * memWid] = 0;
                }
            }
        }
        __syncthreads();

        int memPos2 = yq * memWid + tx;
        if (y > 1 && tx < MINMAX_SIZE + 2) {
            float min1 = fminf(fminf(dataCache[memPos0], dataCache[memPos1]), dataCache[memPos2]);
            float min2 = fminf(fminf(dataCache[memPos0 + memWid], dataCache[memPos1 + memWid]), dataCache[memPos2 + memWid]);
            float min3 = fminf(fminf(dataCache[memPos0 + 2 * memWid], dataCache[memPos1 + 2 * memWid]), dataCache[memPos2 + 2 * memWid]);
            float max1 = fmaxf(fmaxf(dataCache[memPos0], dataCache[memPos1]), dataCache[memPos2]);
            float max2 = fmaxf(fmaxf(dataCache[memPos0 + memWid], dataCache[memPos1 + memWid]), dataCache[memPos2 + memWid]);
            float max3 = fmaxf(fmaxf(dataCache[memPos0 + 2 * memWid], dataCache[memPos1 + 2 * memWid]), dataCache[memPos2 + 2 * memWid]);

            ymin[tx] = min1;
            ymin[tx + memWid] = fminf(fminf(min1, min2), min3);
            ymin[tx + 2 * memWid] = min3;
            ymax[tx] = max1;
            ymax[tx + memWid] = fmaxf(fmaxf(max1, max2), max3);
            ymax[tx + 2 * memWid] = max3;
        }
        __syncthreads();

        if (y > 1 && tx < MINMAX_SIZE) {
            int xWritePos = xStart + tx;
            if (xWritePos <= xEndClamped) {
                float minv = fminf(ymin[tx + memWid], ymin[tx + memWid + 2]);
                minv = fminf(minv, ymin[tx + 1]);
                minv = fminf(fminf(minv, ymin[tx + 1 + memWid]), dataCache[memPos0 + 1 + memWid]);
                minv = fminf(minv, dataCache[memPos2 + 1 + memWid]);
                minv = fminf(minv, d_ConstantA[1]);
                float maxv = fmaxf(ymax[tx + memWid], ymax[tx + memWid + 2]);
                maxv = fmaxf(maxv, ymax[tx + 1]);
                maxv = fmaxf(fmaxf(maxv, ymax[tx + 1 + memWid]), dataCache[memPos0 + 1 + memWid]);
                maxv = fmaxf(maxv, dataCache[memPos2 + 1 + memWid]);
                maxv = fmaxf(maxv, d_ConstantA[0]);
                if (dataCache[memPos1 + 1 + memWid] < minv || dataCache[memPos1 + 1 + memWid] > maxv)
                    output |= 0x80000000;
            }
        }
        __syncthreads();

        memPos0 = memPos1;
        memPos1 = memPos2;
        yq = (yq < 2 ? yq + 1 : 0);
    }
    if (tx < MINMAX_SIZE && xStart + tx < width) {
        int writeStart = blockIdx.y * width + xStart + tx;
        d_Result[writeStart] = output;
    }
}