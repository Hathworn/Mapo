#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel to find 3D minimum and maximum values
__global__ void Find3DMinMax(int *d_Result, float *d_Data1, float *d_Data2, float *d_Data3, int width, int pitch, int height)
{
    // Shared memory for data caching
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

        // Use conditional operator for cleaner code
        if (tx >= (WARP_SIZE - 1)) {
            data1[memPos] = (xReadPos < 0 || xReadPos >= width) ? 0 : d_Data1[readStart + xReadPos];
            data2[memPos] = (xReadPos < 0 || xReadPos >= width) ? 0 : d_Data2[readStart + xReadPos];
            data3[memPos] = (xReadPos < 0 || xReadPos >= width) ? 0 : d_Data3[readStart + xReadPos];
        }
        __syncthreads();

        int memPos2 = yq * memWid + tx;
        if (y > 1) {
            if (tx < memWid) {
                // Reduce redundant function calls for better performance
                float min1 = fminf(data1[memPos0], data1[memPos1]);
                min1 = fminf(min1, data1[memPos2]);
                float min2 = fminf(data2[memPos0], data2[memPos1]);
                min2 = fminf(min2, data2[memPos2]);
                float min3 = fminf(data3[memPos0], data3[memPos1]);
                min3 = fminf(min3, data3[memPos2]);
                float max1 = fmaxf(data1[memPos0], data1[memPos1]);
                max1 = fmaxf(max1, data1[memPos2]);
                float max2 = fmaxf(data2[memPos0], data2[memPos1]);
                max2 = fmaxf(max2, data2[memPos2]);
                float max3 = fmaxf(data3[memPos0], data3[memPos1]);
                max3 = fmaxf(max3, data3[memPos2]);
                
                // Consolidate calculations for ymin and ymax
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
                    // Simplify minv and maxv calculations
                    float minv = fminf(ymin2[tx], ymin2[tx+2]);
                    minv = fminf(minv, ymin1[tx+1]);
                    minv = fminf(minv, ymin3[tx+1]);
                    minv = fminf(minv, data2[memPos0+1]);
                    minv = fminf(minv, data2[memPos2+1]);
                    minv = fminf(minv, d_Threshold[1]);

                    float maxv = fmaxf(ymax2[tx], ymax2[tx+2]);
                    maxv = fmaxf(maxv, ymax1[tx+1]);
                    maxv = fmaxf(maxv, ymax3[tx+1]);
                    maxv = fmaxf(maxv, data2[memPos0+1]);
                    maxv = fmaxf(maxv, data2[memPos2+1]);
                    maxv = fmaxf(maxv, d_Threshold[0]);

                    // Update output based on threshold
                    if (data2[memPos1+1] < minv || data2[memPos1+1] > maxv)
                        output |= 0x80000000;
                }
            }
        }
        __syncthreads();

        memPos0 = memPos1;
        memPos1 = memPos2;
        yq = (yq < 2 ? yq + 1 : 0);
    }

    // Write the output to the global memory
    if (tx < MINMAX_W && xWritePos < width) {
        int writeStart = blockIdx.y * pitch + xWritePos;
        d_Result[writeStart] = output;
    }
}