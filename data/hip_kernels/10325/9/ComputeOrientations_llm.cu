#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ComputeOrientations(float *g_Data, float *d_Sift, int maxPts, int w, int h)
{
    __shared__ float data[16*15]; // Shared memory for data
    __shared__ float hist[32*13]; // Shared memory for histogram
    __shared__ float gauss[16];   // Shared memory for Gaussian weights

    const int tx = threadIdx.x;
    const int bx = blockIdx.x;

    // Initialize histogram
    for (int i = 0; i < 13; i++)
        hist[i * 32 + tx] = 0.0f;
    __syncthreads();

    // Precompute Gaussian weights
    float i2sigma2 = -1.0f / (2.0f * 3.0f * 3.0f);
    if (tx < 15)
        gauss[tx] = exp(i2sigma2 * (tx - 7) * (tx - 7)); // Gaussian calculation

    int xp = (int)(d_Sift[bx + 0 * maxPts] - 6.5f);
    int yp = (int)(d_Sift[bx + 1 * maxPts] - 6.5f);
    int px = xp & 15;
    int x = tx - px;

    // Load data into shared memory
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

    // Compute gradient and vote into histogram
    for (int y = 1; y < 14; y++) {
        int memPos = 16 * y + x;
        if (x >= 1 && x < 14) {
            float dy = data[memPos + 16] - data[memPos - 16];
            float dx = data[memPos + 1]  - data[memPos - 1];
            int bin = __float2int_rd(16.0f * atan2f(dy, dx) / 3.1416f + 16.5f) % 32; // Use modulo for safety
            float grad = sqrtf(dx * dx + dy * dy);
            atomicAdd(&hist[32 * (x - 1) + bin], grad * gauss[x] * gauss[y]);
        }
    }
    __syncthreads();

    // Reduce histogram across y
    if (tx < 32) {
        for (int y = 0; y < 5; y++)
            hist[y * 32 + tx] += hist[(y + 8) * 32 + tx];
        __syncthreads();
        for (int y = 0; y < 4; y++)
            hist[y * 32 + tx] += hist[(y + 4) * 32 + tx];
        __syncthreads();
        for (int y = 0; y < 2; y++)
            hist[y * 32 + tx] += hist[(y + 2) * 32 + tx];
        __syncthreads();

        // Smooth histogram
        float v = hist[tx];
        hist[tx] += hist[32 + tx];
        __syncthreads();

        if (tx < 32) { // Smoothing loop amend
            float smoothed = 6 * v + 4 * (hist[(tx + 1) & 31] + hist[(tx + 31) & 31]);
            smoothed += hist[(tx + 2) & 31] + hist[(tx + 30) & 31];
            hist[32 + tx] = smoothed; // Consolidate smoothing
        }
    }
    __syncthreads();

    // Find peaks in histogram
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
        
        // Interpolation for the best peak location
        float valL = hist[(i1 + 31) % 32 + 32];
        float valR = hist[(i1 + 1) % 32 + 32];
        float peak = i1 + 0.5f * (valR - valL) / (2.0f * maxval1 - valL - valR);
        d_Sift[bx + 5 * maxPts] = 11.25f * (peak < 0.0f ? peak + 32.0f : peak);
        
        if (maxval2 < 0.8f * maxval1)
            i2 = -1;
        if (i2 >= 0) {
            valL = hist[(i2 + 31) % 32 + 32];
            valR = hist[(i2 + 1) % 32 + 32];
            peak = i2 + 0.5f * (valR - valL) / (2.0f * maxval2 - valL - valR);
            d_Sift[bx + 6 * maxPts] = 11.25f * (peak < 0.0f ? peak + 32.0f : peak);
        } else
            d_Sift[bx + 6 * maxPts] = i2;
    }
}