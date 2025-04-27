```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ComputeOrientations(float *g_Data, float *d_Sift, int maxPts, int w, int h)
{
    __shared__ float data[16*15];
    __shared__ float hist[32*13];
    __shared__ float gauss[16];
    const int tx = threadIdx.x;
    const int bx = blockIdx.x;

    // Initialize histogram
    for (int i = 0; i < 13; i++)
        hist[i * 32 + tx] = 0.0f;
    __syncthreads();

    // Precompute Gaussian values
    if (tx < 15) {
        float i2sigma2 = -1.0f / (2.0f * 3.0f * 3.0f);
        gauss[tx] = exp(i2sigma2 * (tx - 7) * (tx - 7));
    }

    int xp = (int)(d_Sift[bx + 0 * maxPts] - 6.5f);
    int yp = (int)(d_Sift[bx + 1 * maxPts] - 6.5f);
    int px = xp & 15;  // Improved modulus operation by bitwise mask
    int x = tx - px;

    // Load data into shared memory
    for (int y = 0; y < 15; y++) {
        int memPos = 16 * y + x;
        int xi = max(0, min(w - 1, xp + x));
        int yi = max(0, min(h - 1, yp + y));
        if (x >= 0 && x < 15) 
            data[memPos] = g_Data[yi * w + xi];
    }
    __syncthreads();

    // Calculate gradients and build histogram
    for (int y = 1; y < 14; y++) {
        int memPos = 16 * y + x;
        if (x >= 1 && x < 14) {
            float dy = data[memPos + 16] - data[memPos - 16];
            float dx = data[memPos + 1] - data[memPos - 1];
            int bin = 16.0f * atan2f(dy, dx) / 3.1416f + 16.5f;
            if (bin == 32) bin = 0;
            float grad = sqrtf(dx * dx + dy * dy);
            atomicAdd(&hist[32 * (x - 1) + bin], grad * gauss[x] * gauss[y]);  // Use atomicAdd to avoid race condition
        }
    }
    __syncthreads();

    // Histogram folding
    for (int shift = 8; shift > 0; shift >>= 1) {
        if (tx < shift * 4) 
            hist[tx] += hist[tx + shift * 32];
        __syncthreads();
    }
    if (tx == 0) {
        hist[32] = 6 * hist[0] + 4 * (hist[1] + hist[31]) + (hist[2] + hist[30]);
        hist[63] = 6 * hist[31] + 4 * (hist[0] + hist[30]) + (hist[1] + hist[29]);
    }
    if (tx >= 1 && tx <= 30) 
        hist[tx + 32] = 6 * hist[tx] + 4 * (hist[tx + 1] + hist[tx - 1]) + 
                        (hist[tx + 2] + hist[tx - 2]);

    __syncthreads();

    // Non-max suppression
    float v = hist[32 + tx];
    hist[tx] = (v > hist[32 + ((tx + 1) & 31)] && v >= hist[32 + ((tx + 31) & 31)]) ? v : 0.0f;
    __syncthreads();

    // Find the key peaks
    if (tx == 0) {
        float maxval1 = 0.0f;
        float maxval2 = 0.0f;
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
        float val1 = hist[32 + ((i1 + 1) & 31)];
        float val2 = hist[32 + ((i1 + 31) & 31)];
        float peak = i1 + 0.5f * (val1 - val2) / (2.0f * maxval1 - val1 - val2);
        d_Sift[bx + 5 * maxPts] = 11.25f * (peak < 0.0f ? peak + 32.0f : peak);

        if (maxval2 < 0.8f * maxval1) { i2 = -1; }
        if (i2 >= 0) {
            val1 = hist[32 + ((i2 + 1) & 31)];
            val2 = hist[32 + ((i2 + 31) & 31)];
            float peak = i2 + 0.5f * (val1 - val2) / (2.0f * maxval2 - val1 - val2);
            d_Sift[bx + 6 * maxPts] = 11.25f * (peak < 0.0f ? peak + 32.0f : peak);
        } else
            d_Sift[bx + 6 * maxPts] = i2;
    }
}