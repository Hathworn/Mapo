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
        float* sdata = data + ty*CONVCOL_W + tx;
        int gPos = colStart + (totStart + ty)*pitch;
        // Load data into shared memory with boundary handling
        for (int y = totStart + ty; y <= totEnd; y += blockDim.y) {
            if (y < 0)
                data[ty * CONVCOL_W + tx] = d_Data[colStart];
            else if (y >= height)
                data[ty * CONVCOL_W + tx] = d_Data[colEnd];
            else
                data[ty * CONVCOL_W + tx] = d_Data[gPos];
            sdata += sStep;
            gPos += gStep;
        }
    }
    __syncthreads();
    
    if (colStart < width) {
        float *sdata = data + ty*CONVCOL_W + tx;
        int gPos = colStart + (miny + ty)*pitch;
        // Perform convolution using pre-loaded data
        for (int y = miny + ty; y <= maxy; y += blockDim.y) {
            float sum = 0.0f;
            for (int k = 0; k < 5; ++k) {
                sum += kernel[k] * 
                      (sdata[(k * CONVCOL_W)] + 
                       sdata[((8-k) * CONVCOL_W)]); // symmetry utilization
            }
            sum += kernel[4] * sdata[4 * CONVCOL_W]; // middle element
            d_Result[gPos] = sum;
            sdata += sStep;
            gPos += gStep;
        }
    }
}