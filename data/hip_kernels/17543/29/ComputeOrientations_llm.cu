#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOrientations(float *g_Data, int *d_Ptrs, float *d_Orient, int maxPts, int w, int h)
{
    __shared__ float data[16*15];
    __shared__ float hist[32*13];
    __shared__ float gauss[16];
    const int tx = threadIdx.x;
    const int bx = blockIdx.x;

    #pragma unroll
    for (int i = 0; i < 13; i++)
        hist[i * 32 + tx] = 0.0f;
    __syncthreads();

    float i2sigma2 = -1.0f / (2.0f * 3.0f * 3.0f);
    if (tx < 15)
        gauss[tx] = exp(i2sigma2 * (tx - 7) * (tx - 7));
    
    int p = d_Ptrs[bx];
    int yp = p / w - 7;
    int xp = p % w - 7;
    int px = xp & 15;
    int x = tx - px;

    for (int y = 0; y < 15; y++) {
        int memPos = 16 * y + x;
        int xi = xp + x;
        int yi = yp + y;
        xi = max(0, min(xi, w - 1));
        yi = max(0, min(yi, h - 1));
        if (x >= 0 && x < 15)
            data[memPos] = g_Data[yi * w + xi];
    }
    __syncthreads();

    #pragma unroll
    for (int y = 1; y < 14; y++) {
        int memPos = 16 * y + x;
        if (x >= 1 && x < 14) {
            float dy = data[memPos + 16] - data[memPos - 16];
            float dx = data[memPos + 1] - data[memPos - 1];
            int bin = int(16.0f * atan2f(dy, dx) / 3.1416f + 16.5f) % 32;
            float grad = sqrtf(dx * dx + dy * dy);
            hist[32 * (x - 1) + bin] += grad * gauss[x] * gauss[y];
        }
    }
    __syncthreads();

    // Reduce histogram values for better performance
    for (int y = 0; y < 4; y++) 
        hist[y * 32 + tx] += hist[(y + 4) * 32 + tx] + hist[(y + 8) * 32 + tx];
    __syncthreads();
    
    for (int y = 0; y < 2; y++)
        hist[y * 32 + tx] += hist[(y + 2) * 32 + tx];
    
    __syncthreads();
    
    hist[tx] += hist[32 + tx];
    __syncthreads();

    // Calculate weighted histogram
    if (tx < 32) {
        int idx1 = (tx + 1) & 31;
        int idx2 = (tx + 31) & 31;
        float v = hist[32 + tx];
        hist[tx] = (v > hist[32 + idx1] && v >= hist[32 + idx2]) ? v : 0.0f;
    }
    __syncthreads();

    // Find peaks and second peak
    if (tx == 0) {
        float maxval1 = 0.0f, maxval2 = 0.0f;
        int i1 = -1, i2 = -1;

        #pragma unroll
        for (int i = 0; i < 32; i++) {
            float v = hist[i];
            if (v > maxval1) {
                maxval2 = maxval1;
                maxval1 = v;
                i2 = i1;
                i1 = i;
            } else if (v > maxval2) {
                maxval2 = v;
                i2 = i;
            }
        }

        float peakOffset1 = 0.5f * (hist[32 + ((i1 + 1) & 31)] - hist[32 + ((i1 + 31) & 31)]) / (2.0f * maxval1 - hist[32 + ((i1 + 1) & 31)] - hist[32 + ((i1 + 31) & 31)]);
        d_Orient[bx] = 11.25f * ((peakOffset1 < 0.0f) ? peakOffset1 + 32.0f : peakOffset1);

        if (maxval2 < 0.8f * maxval1)
            i2 = -1;

        if (i2 >= 0) {
            float peakOffset2 = 0.5f * (hist[32 + ((i2 + 1) & 31)] - hist[32 + ((i2 + 31) & 31)]) / (2.0f * maxval2 - hist[32 + ((i2 + 1) & 31)] - hist[32 + ((i2 + 31) & 31)]);
            d_Orient[bx + maxPts] = 11.25f * ((peakOffset2 < 0.0f) ? peakOffset2 + 32.0f : peakOffset2);
        } else {
            d_Orient[bx + maxPts] = i2;
        }
    }
}