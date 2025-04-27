#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Find3DMinMax(int *d_Result, float *d_Data1, float *d_Data2, float *d_Data3, int width, int height) {
    // Data cache with reduced size using registers where applicable
    __shared__ float data1[3 * (MINMAX_SIZE + 2)];
    __shared__ float data2[3 * (MINMAX_SIZE + 2)];
    __shared__ float data3[3 * (MINMAX_SIZE + 2)];

    // Use local registers for ymin and ymax to reduce shared memory usage
    float ymin1, ymin2, ymin3, ymax1, ymax2, ymax3;

    const int tx = threadIdx.x;
    const int xStart = __mul24(blockIdx.x, MINMAX_SIZE);
    const int xEndClamped = min(xStart + MINMAX_SIZE - 1, width - 1);
    int memWid = MINMAX_SIZE + 2;

    int memPos0 = tx - WARP_SIZE + 1;
    int yq = 0;
    unsigned int output = 0;

    for (int y = 0; y < 34; y++) {
        output >>= 1;

        int yp = 32 * blockIdx.y + y - 1;
        yp = max(yp, 0);
        yp = min(yp, height - 1);
        int readStart = __mul24(yp, width);

        // Set the entire data cache contents with boundary check
        int xReadPos = xStart + tx - WARP_SIZE;
        if (tx >= (WARP_SIZE - 1)) {
            if (xReadPos < 0 || xReadPos >= width) {
                data1[memPos0] = data2[memPos0] = data3[memPos0] = 0.0f;
            } else {
                data1[memPos0] = d_Data1[readStart + xReadPos];
                data2[memPos0] = d_Data2[readStart + xReadPos];
                data3[memPos0] = d_Data3[readStart + xReadPos];
            }
        }
        __syncthreads();

        int memPos2 = yq * memWid + tx;
        if (y > 1 && tx < memWid) {
            // Calculate min and max using registers to reduce shared memory load
            ymin1 = fminf(fminf(data1[memPos0], data1[memPos0 + memWid]), data1[memPos2]);
            ymin2 = fminf(fminf(data2[memPos0], data2[memPos0 + memWid]), data2[memPos2]);
            ymin3 = fminf(fminf(data3[memPos0], data3[memPos0 + memWid]), data3[memPos2]);
            ymax1 = fmaxf(fmaxf(data1[memPos0], data1[memPos0 + memWid]), data1[memPos2]);
            ymax2 = fmaxf(fmaxf(data2[memPos0], data2[memPos0 + memWid]), data2[memPos2]);
            ymax3 = fmaxf(fmaxf(data3[memPos0], data3[memPos0 + memWid]), data3[memPos2]);
        }
        __syncthreads();

        if (y > 1 && tx < MINMAX_SIZE) {
            int xWritePos = xStart + tx;
            if (xWritePos <= xEndClamped) {
                // Consolidate min and max comparisons using local variables
                float minv = fminf(fminf(fminf(fminf(ymin2, ymin2 + 2), ymin1), ymin3), d_ConstantA[1]);
                float maxv = fmaxf(fmaxf(fmaxf(fmaxf(ymax2, ymax2 + 2), ymax1), ymax3), d_ConstantA[0]);
                if (data2[memPos0 + 1] < minv || data2[memPos0 + 1] > maxv) 
                    output |= 0x80000000;
            }
        }
        __syncthreads();

        memPos0 = yq * memWid + (tx - WARP_SIZE + 2);
        yq = (yq + 1) % 3;
    }

    if (tx < MINMAX_SIZE && (xStart + tx) < width) {
        int writeStart = __mul24(blockIdx.y, width) + xStart + tx;
        d_Result[writeStart] = output;
    }
}