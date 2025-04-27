#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LowPassColMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    __shared__ float data[CONVCOL_W*(CONVCOL_H + 2*RADIUS)];
    const int tx = threadIdx.x;
    const int ty = threadIdx.y;
    const int block = blockIdx.x/(NUM_SCALES+3);
    const int scale = blockIdx.x - (NUM_SCALES+3)*block;
    const int miny = blockIdx.y*CONVCOL_H;
    const int maxy = min(miny + CONVCOL_H, height) - 1;
    const int totStart = miny - RADIUS;
    const int totEnd = maxy + RADIUS;
    const int colStart = block*CONVCOL_W + tx;
    const int sStep = CONVCOL_W*CONVCOL_S;
    const int gStep = pitch*CONVCOL_S;
    float *kernel = d_Kernel + scale*16;
    const int size = pitch*height*scale;

    d_Result += size;
    d_Data += size;

    if (colStart < width) {
        float *sdata = data + ty*CONVCOL_W + tx;
        int gPos = colStart + (totStart + ty) * pitch;

        for (int y = totStart + ty; y <= totEnd; y += blockDim.y) {
            if (y < 0)
                sdata[0] = d_Data[colStart];  // Out of bounds check
            else if (y >= height)
                sdata[0] = d_Data[colStart + (height - 1) * pitch];  // Out of bounds check
            else
                sdata[0] = d_Data[gPos];

            sdata += sStep;
            gPos += gStep;
        }
    }
    __syncthreads();

    if (colStart < width) {
        float *sdata = data + ty*CONVCOL_W + tx;
        int gPos = colStart + (miny + ty) * pitch;

        for (int y = miny + ty; y <= maxy; y += blockDim.y) {
            float result = 0.0f;
            for (int k = 0; k < 5; ++k) {
                result += (sdata[k*CONVCOL_W] + sdata[(8-k)*CONVCOL_W]) * kernel[k];  // Unrolling and symmetric access
            }
            result += sdata[4*CONVCOL_W] * kernel[4]; // Add center pixel contribution only once
            d_Result[gPos] = result;

            sdata += sStep;
            gPos += gStep;
        }
    }
}