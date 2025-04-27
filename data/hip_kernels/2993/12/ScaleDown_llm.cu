#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ScaleDown(float *d_Result, float *d_Data, int width, int pitch, int height, int newpitch)
{
    __shared__ float inrow[SCALEDOWN_W+4];
    __shared__ float brow[5*(SCALEDOWN_W/2)];
    __shared__ int yRead[SCALEDOWN_H+4];
    __shared__ int yWrite[SCALEDOWN_H+4];
    #define dx2 (SCALEDOWN_W/2)
    const int tx = threadIdx.x;
    const int xStart = blockIdx.x * SCALEDOWN_W;
    const int yStart = blockIdx.y * SCALEDOWN_H;
    const int xWrite = xStart / 2 + tx;
    float k0 = d_ScaleDownKernel[0];
    float k1 = d_ScaleDownKernel[1];
    float k2 = d_ScaleDownKernel[2];

    if (tx < SCALEDOWN_H + 4) {
        int y = yStart + tx - 2;
        y = max(0, min(y, height - 1));  // Use `max` and `min` for bounds check
        yRead[tx] = y * pitch;
        yWrite[tx] = (yStart + tx - 4) / 2 * newpitch;
    }
    __syncthreads();

    int maxtx = min(dx2, width / 2 - xStart / 2);

    for (int dy = 0; dy < SCALEDOWN_H + 4; dy += 5) {
        int xRead = xStart + tx - 2;
        xRead = max(0, min(xRead, width - 1));  // Use `max` and `min` for bounds check

        inrow[tx] = d_Data[yRead[dy] + xRead];
        __syncthreads();

        if (tx < maxtx) {
            brow[tx + 3 * dx2] = k0 * (inrow[tx * 2] + inrow[tx * 2 + 4]) + k1 * (inrow[tx * 2 + 1] + inrow[tx * 2 + 3]) + k2 * inrow[tx * 2 + 2];
            if (dy >= 4 && !(dy & 1)) {
                d_Result[yWrite[dy] + xWrite] = k2 * brow[tx + 2 * dx2] + k0 * (brow[tx] + brow[tx + 3 * dx2]) + k1 * (brow[tx + 1 * dx2] + brow[tx + 2 * dx2 + dx2]);
            }
        }
        __syncthreads();
    }
}
```
