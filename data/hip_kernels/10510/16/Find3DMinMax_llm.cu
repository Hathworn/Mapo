#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Find3DMinMax(int *d_Result, float *d_Data1, float *d_Data2, float *d_Data3, int width, int pitch, int height) {
    // Data cache
    __shared__ float data1[3 * (MINMAX_W + 2)];
    __shared__ float data2[3 * (MINMAX_W + 2)];
    __shared__ float data3[3 * (MINMAX_W + 2)];
    __shared__ float ymin1[(MINMAX_W + 2)];
    __shared__ float ymin2[(MINMAX_W + 2)];
    __shared__ float ymin3[(MINMAX_W + 2)];
    __shared__ float ymax1[(MINMAX_W + 2)];
    __shared__ float ymax2[(MINMAX_W + 2)];
    __shared__ float ymax3[(MINMAX_W + 2)];

    // Current tile and apron limits, relative to row start
    const int tx = threadIdx.x;
    const int xStart = blockIdx.x * MINMAX_W;
    const int xEnd = xStart + MINMAX_W - 1;
    const int xReadPos = xStart + tx - WARP_SIZE;
    const int xWritePos = xStart + tx;
    const int xEndClamped = min(xEnd, width - 1);
    int memWid = MINMAX_W + 2;

    int memPos0 = (tx - WARP_SIZE + 1);
    int memPos1 = (tx - WARP_SIZE + 1);
    int yq = 0;
    unsigned int output = 0;

    for (int y = 0; y < 32 + 2; y++) {
        output >>= 1;
        int memPos = yq * memWid + (tx - WARP_SIZE + 1);
        int yp = 32 * blockIdx.y + y - 1;
        yp = max(yp, 0);
        yp = min(yp, height - 1);
        int readStart = yp * pitch;

        // Load data into shared memory if within bounds
        if (tx >= (WARP_SIZE - 1)) {
            if (xReadPos < 0 || xReadPos >= width) {
                data1[memPos] = 0;
                data2[memPos] = 0;
                data3[memPos] = 0;
            } else {
                data1[memPos] = d_Data1[readStart + xReadPos];
                data2[memPos] = d_Data2[readStart + xReadPos];
                data3[memPos] = d_Data3[readStart + xReadPos];
            }
        }
        __syncthreads();

        int memPos2 = yq * memWid + tx;
        if (y > 1) {
            if (tx < memWid) {
                // Minimize redundant function calls by using temporary variables
                float val1_0 = data1[memPos0], val1_1 = data1[memPos1], val1_2 = data1[memPos2];
                float val2_0 = data2[memPos0], val2_1 = data2[memPos1], val2_2 = data2[memPos2];
                float val3_0 = data3[memPos0], val3_1 = data3[memPos1], val3_2 = data3[memPos2];

                float min1 = fminf(fminf(val1_0, val1_1), val1_2);
                float min2 = fminf(fminf(val2_0, val2_1), val2_2);
                float min3 = fminf(fminf(val3_0, val3_1), val3_2);
                float max1 = fmaxf(fmaxf(val1_0, val1_1), val1_2);
                float max2 = fmaxf(fmaxf(val2_0, val2_1), val2_2);
                float max3 = fmaxf(fmaxf(val3_0, val3_1), val3_2);

                ymin1[tx] = min1;
                ymin2[tx] = fminf(fminf(min1, min2), min3);
                ymin3[tx] = min3;
                ymax1[tx] = max1;
                ymax2[tx] = fmaxf(fmaxf(max1, max2), max3);
                ymax3[tx] = max3;
            }
        }
        __syncthreads();

        if (y > 1) {
            if (tx < MINMAX_W) {
                if (xWritePos <= xEndClamped) {
                    // Reduce the number of fminf and fmaxf calls
                    float minVal = fminf(fminf(ymin2[tx], ymin2[tx + 2]), fminf(fminf(ymin1[tx + 1], ymin3[tx + 1]), fminf(data2[memPos0 + 1], data2[memPos2 + 1])));
                    float maxVal = fmaxf(fmaxf(ymax2[tx], ymax2[tx + 2]), fmaxf(fmaxf(ymax1[tx + 1], ymax3[tx + 1]), fmaxf(data2[memPos0 + 1], data2[memPos2 + 1])));
                    
                    minVal = fminf(minVal, d_Threshold[1]);
                    maxVal = fmaxf(maxVal, d_Threshold[0]);

                    // Check data2[memPos1 + 1] against thresholds
                    if (data2[memPos1 + 1] < minVal || data2[memPos1 + 1] > maxVal) {
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

    // Write output if within width bounds
    if (tx < MINMAX_W && xWritePos < width) {
        int writeStart = blockIdx.y * pitch + xWritePos;
        d_Result[writeStart] = output;
    }
}