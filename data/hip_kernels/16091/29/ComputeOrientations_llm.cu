#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ComputeOrientations(float *g_Data, int *d_Ptrs, float *d_Orient, int maxPts, int w, int h)
{
    __shared__ float data[16*15];
    __shared__ float hist[32*13];
    __shared__ float gauss[16];
    const int tx = threadIdx.x;
    const int bx = blockIdx.x;

    // Initialize histogram
    for (int i=0; i<13; i++) 
        hist[i*32+tx] = 0.0f;
    __syncthreads();

    // Precompute Gaussian
    float i2sigma2 = -1.0f / (2.0f * 3.0f * 3.0f);
    if (tx < 15)
        gauss[tx] = exp(i2sigma2 * (tx - 7) * (tx - 7));
    __syncthreads();

    int p = d_Ptrs[bx];
    int yp = p / w - 7;
    int xp = p % w - 7;
    int px = xp & 15;
    int x = tx - px;

    // Load data into shared memory
    for (int y = 0; y < 15; y++) {
        int memPos = 16*y + x;
        int xi = xp + x;
        int yi = yp + y;
        if (xi < 0) xi = 0;
        if (xi >= w) xi = w - 1;
        if (yi < 0) yi = 0;
        if (yi >= h) yi = h - 1;
        if (x >= 0 && x < 15)
            data[memPos] = g_Data[yi * w + xi];
    }
    __syncthreads();

    // Compute gradients and histogram
    for (int y = 1; y < 14; y++) {
        int memPos = 16*y + x;
        if (x >= 1 && x < 14) {
            float dy = data[memPos+16] - data[memPos-16];
            float dx = data[memPos+1]  - data[memPos-1];
            float grad = sqrtf(dx * dx + dy * dy);
            int bin = __float2int_rn(16.0f * atan2f(dy, dx) / 3.1416f + 16.5f) % 32; // Optimized bin calculation
            hist[32*(x-1) + bin] += grad * gauss[x] * gauss[y];
        }
    }
    __syncthreads();

    // Reduce histogram
    for (int offset = 8; offset > 0; offset /= 2) {
        if (tx < offset * 32) 
            hist[tx] += hist[tx + offset * 32];
        __syncthreads();
    }
    
    // Smoothing the histogram
    float v = hist[tx + 32];
    hist[tx] = (v > hist[(tx+1)&31 + 32] && v >= hist[(tx+31)&31 + 32]) ? v : 0.0f;
    __syncthreads();

    // Find peaks of the histogram
    if (tx == 0) {
        float maxval1 = 0.0, maxval2 = 0.0;
        int i1 = -1, i2 = -1;
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
        if (i1 >= 0) {
            float val1 = hist[(i1+1)&31 + 32];
            float val2 = hist[(i1+31)&31 + 32];
            float peak = i1 + 0.5f * (val1 - val2) / (2.0f * maxval1 - val1 - val2);
            d_Orient[bx] = 11.25f * ((peak < 0.0f) ? peak + 32.0f : peak);

            if (maxval2 < 0.8f * maxval1) i2 = -1;
            if (i2 >= 0) {
                val1 = hist[(i2+1)&31 + 32];
                val2 = hist[(i2+31)&31 + 32];
                peak = i2 + 0.5f * (val1 - val2) / (2.0f * maxval2 - val1 - val2);
                d_Orient[bx + maxPts] = 11.25f * ((peak < 0.0f) ? peak + 32.0f : peak);
            } else {
                d_Orient[bx + maxPts] = i2;
            }
        }
    }
}