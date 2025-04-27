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
    const int colEnd = colStart + (height-1)*pitch;
    const int sStep = CONVCOL_W*CONVCOL_S;
    const int gStep = pitch*CONVCOL_S;
    float *kernel = d_Kernel + scale*16;
    const int size = pitch*height*scale;
    d_Result += size;
    d_Data += size;

    if (colStart < width) {
        float *sdata = data + ty*CONVCOL_W + tx;
        int gPos = colStart + (totStart + ty)*pitch;
        for (int y = totStart + ty; y <= totEnd; y += blockDim.y) {
            if (y < 0)
                sdata[0] = d_Data[colStart];
            else if (y >= height)
                sdata[0] = d_Data[colEnd];
            else
                sdata[0] = d_Data[gPos];
            sdata += sStep;
            gPos += gStep;
        }
    }

    __syncthreads();

    if (colStart < width) {
        float *sdata = data + ty*CONVCOL_W + tx;
        int gPos = colStart + (miny + ty)*pitch;
        for (int y = miny + ty; y <= maxy; y += blockDim.y) {
            // Use local variables to minimize array access and improve performance
            float val0 = sdata[0*CONVCOL_W];
            float val1 = sdata[1*CONVCOL_W];
            float val2 = sdata[2*CONVCOL_W];
            float val3 = sdata[3*CONVCOL_W];
            float val4 = sdata[4*CONVCOL_W];
            float val5 = sdata[5*CONVCOL_W];
            float val6 = sdata[6*CONVCOL_W];
            float val7 = sdata[7*CONVCOL_W];
            float val8 = sdata[8*CONVCOL_W];

            d_Result[gPos] = 
                (val0 + val8) * kernel[0] + 
                (val1 + val7) * kernel[1] + 
                (val2 + val6) * kernel[2] + 
                (val3 + val5) * kernel[3] + 
                val4 * kernel[4];
            sdata += sStep;
            gPos += gStep;
        }
    }
}