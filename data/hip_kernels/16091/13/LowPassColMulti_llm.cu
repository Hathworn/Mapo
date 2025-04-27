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
        
        // Use loop unrolling for memory loading
        for (int y = totStart + ty; y <= totEnd; y += blockDim.y * 4) {
            sdata[0] = (y < 0) ? d_Data[colStart] : (y >= height) ? d_Data[colEnd] : d_Data[gPos];
            sdata += sStep;
            gPos += gStep;
            if (y + blockDim.y * 1 <= totEnd) {
                sdata[0] = (y + blockDim.y * 1 < 0) ? d_Data[colStart] : (y + blockDim.y * 1 >= height) ? d_Data[colEnd] : d_Data[gPos];
                sdata += sStep;
                gPos += gStep;
            }
            if (y + blockDim.y * 2 <= totEnd) {
                sdata[0] = (y + blockDim.y * 2 < 0) ? d_Data[colStart] : (y + blockDim.y * 2 >= height) ? d_Data[colEnd] : d_Data[gPos];
                sdata += sStep;
                gPos += gStep;
            }
            if (y + blockDim.y * 3 <= totEnd) {
                sdata[0] = (y + blockDim.y * 3 < 0) ? d_Data[colStart] : (y + blockDim.y * 3 >= height) ? d_Data[colEnd] : d_Data[gPos];
            }
        }
    }
    __syncthreads();

    if (colStart < width) {
        float *sdata = data + ty*CONVCOL_W + tx;
        int gPos = colStart + (miny + ty)*pitch;
        
        // Optimize computation loop using loop unrolling
        for (int y = miny + ty; y <= maxy; y += blockDim.y*4) {
            #pragma unroll
            for (int offset = 0; offset < 4 && y + offset * blockDim.y <= maxy; ++offset) {
                d_Result[gPos + offset * gStep] =
                    (sdata[0*CONVCOL_W] + sdata[8*CONVCOL_W])*kernel[0] +
                    (sdata[1*CONVCOL_W] + sdata[7*CONVCOL_W])*kernel[1] +
                    (sdata[2*CONVCOL_W] + sdata[6*CONVCOL_W])*kernel[2] +
                    (sdata[3*CONVCOL_W] + sdata[5*CONVCOL_W])*kernel[3] +
                    sdata[4*CONVCOL_W]*kernel[4];
                sdata += sStep;
            }
            gPos += gStep*4;
        }
    }
}