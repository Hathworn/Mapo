#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Find3DMinMax(int *d_Result, float *d_Data1, float *d_Data2, float *d_Data3, int width, int height)
{
    // Data cache
    __shared__ float data1[3*(MINMAX_SIZE + 2)];
    __shared__ float data2[3*(MINMAX_SIZE + 2)];
    __shared__ float data3[3*(MINMAX_SIZE + 2)];
    __shared__ float ymin1[(MINMAX_SIZE + 2)];
    __shared__ float ymin2[(MINMAX_SIZE + 2)];
    __shared__ float ymin3[(MINMAX_SIZE + 2)];
    __shared__ float ymax1[(MINMAX_SIZE + 2)];
    __shared__ float ymax2[(MINMAX_SIZE + 2)];
    __shared__ float ymax3[(MINMAX_SIZE + 2)];

    // Current tile and apron limits, relative to row start
    const int tx = threadIdx.x;
    const int xStart = blockIdx.x * MINMAX_SIZE;
    const int xEnd = xStart + MINMAX_SIZE - 1;
    const int xReadPos = xStart + tx - WARP_SIZE;
    const int xWritePos = xStart + tx;
    const int xEndClamped = min(xEnd, width - 1);
    const int memWid = MINMAX_SIZE + 2;

    int memPos0 = (tx - WARP_SIZE + 1);
    int memPos1 = memPos0;
    int yq = 0;
    unsigned int output = 0;
    for (int y = 0; y < 34; y++) {
        output >>= 1;
        int memPos = yq * memWid + memPos0;
        int yp = blockIdx.y * 32 + y - 1;
        yp = clamp(yp, 0, height - 1);
        int readStart = yp * width;

        // Set the entire data cache contents
        if (tx >= (WARP_SIZE - 1)) {
            float3 dataRead;
            if (xReadPos >= 0 && xReadPos < width) {
                dataRead = make_float3(d_Data1[readStart + xReadPos], d_Data2[readStart + xReadPos], d_Data3[readStart + xReadPos]);
            } else {
                dataRead = make_float3(0, 0, 0); // Load zeros for out-of-bounds
            }
            data1[memPos] = dataRead.x;
            data2[memPos] = dataRead.y;
            data3[memPos] = dataRead.z;
        }
        __syncthreads();

        int memPos2 = yq * memWid + tx;
        if (y > 1) {
            if (tx < memWid) {
                float3 minValues = make_float3(fminf(fminf(data1[memPos0], data1[memPos1]), data1[memPos2]),
                                               fminf(fminf(data2[memPos0], data2[memPos1]), data2[memPos2]),
                                               fminf(fminf(data3[memPos0], data3[memPos1]), data3[memPos2]));
                float3 maxValues = make_float3(fmaxf(fmaxf(data1[memPos0], data1[memPos1]), data1[memPos2]),
                                               fmaxf(fmaxf(data2[memPos0], data2[memPos1]), data2[memPos2]),
                                               fmaxf(fmaxf(data3[memPos0], data3[memPos1]), data3[memPos2]));

                ymin1[tx] = minValues.x;
                ymin2[tx] = fminf(fminf(minValues.x, minValues.y), minValues.z);
                ymin3[tx] = minValues.z;
                ymax1[tx] = maxValues.x;
                ymax2[tx] = fmaxf(fmaxf(maxValues.x, maxValues.y), maxValues.z);
                ymax3[tx] = maxValues.z;
            }
        }
        __syncthreads();

        if (y > 1) {
            if (tx < MINMAX_SIZE && xWritePos <= xEndClamped) {
                float middleValue = data2[memPos1 + 1];
                float minv = fminf(fminf(fminf(fminf(ymin2[tx], ymin2[tx + 2]), ymin1[tx + 1]), ymin3[tx + 1]), middleValue);
                minv = fminf(minv, d_ConstantA[1]);
                float maxv = fmaxf(fmaxf(fmaxf(fmaxf(ymax2[tx], ymax2[tx + 2]), ymax1[tx + 1]), ymax3[tx + 1]), middleValue);
                maxv = fmaxf(maxv, d_ConstantA[0]);
                if (middleValue < minv || middleValue > maxv)
                    output |= 0x80000000;
            }
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