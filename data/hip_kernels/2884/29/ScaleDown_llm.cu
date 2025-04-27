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
        y = (y < 0 ? 0 : y);
        y = (y >= height ? height - 1 : y);
        yRead[tx] = y * pitch;
        yWrite[tx] = (yStart + tx - 4) / 2 * newpitch;
    }
    __syncthreads();

    int xRead = xStart + tx - 2;
    xRead = (xRead < 0 ? 0 : xRead);
    xRead = (xRead >= width ? width - 1 : xRead);

    int maxtx = min(dx2, width / 2 - xStart / 2);

    for (int dy = 0; dy < SCALEDOWN_H + 4; dy += 5) {
        // Load input data and compute partial reduction
        if (dy < (SCALEDOWN_H+4)) {
            inrow[tx] = d_Data[yRead[dy] + xRead];
            __syncthreads();
            if (tx < maxtx) {
                brow[(dy/5)*dx2 + tx] = k0*(inrow[2*tx] + inrow[2*tx+4]) + k1*(inrow[2*tx+1] + inrow[2*tx+3]) + k2*inrow[2*tx+2];
                
                // Calculate output applying the finalized kernel
                if (dy >= 4 && ((dy&1) == 0))
                    d_Result[yWrite[dy] + xWrite] = k2*brow[((dy/5)-1)*dx2 + tx] + k0*(brow[((dy/5)-2)*dx2 + tx] + brow[(dy/5)*dx2 + tx]) + k1*(brow[((dy/5)-1)*dx2 + tx] + brow[((dy/5)+1)*dx2 + tx]);
            }
            __syncthreads();
        }
    }
}