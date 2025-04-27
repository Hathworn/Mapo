#include "hip/hip_runtime.h"
#include "includes.h"

// Improved function to reduce redundant memory lookups
__device__ float computeExp(float i2sigma2, int idx) {
    return exp(i2sigma2 * (idx - 7) * (idx - 7));
}

__device__ int boundIndex(int idx, int bound) {
    if (idx < 0) return 0;
    if (idx >= bound) return bound - 1;
    return idx;
}

__global__ void ComputeOrientations(float *g_Data, int *d_Ptrs, float *d_Orient, int maxPts, int w, int h) {
    __shared__ float data[16*15];
    __shared__ float hist[32*13];
    __shared__ float gauss[16];

    const int tx = threadIdx.x;
    const int bx = blockIdx.x;

    // Reset histograms
    for (int i = 0; i < 13; i++)
        hist[i * 32 + tx] = 0.0f;
    __syncthreads();

    // Precompute Gaussian values
    float i2sigma2 = -1.0f / (2.0f * 3.0f * 3.0f);
    if (tx < 15)
        gauss[tx] = computeExp(i2sigma2, tx);

    int p = d_Ptrs[bx];
    int yp = p / w - 7;
    int xp = p % w - 7;
    int px = xp & 15;
    int x = tx - px;

    // Load data from global memory
    for (int y = 0; y < 15; y++) {
        int xi = boundIndex(xp + x, w);
        int yi = boundIndex(yp + y, h);
        int memPos = 16 * y + x;
        if (x >= 0 && x < 15)
            data[memPos] = g_Data[yi * w + xi];
    }
    __syncthreads();

    // Compute gradients and update histograms
    for (int y = 1; y < 14; y++) {
        int memPos = 16 * y + x;
        if (x >= 1 && x < 14) {
            float dy = data[memPos + 16] - data[memPos - 16];
            float dx = data[memPos + 1] - data[memPos - 1];
            int bin = 16.0f * atan2f(dy, dx) / 3.1416f + 16.5f;
            if (bin == 32) bin = 0;
            float grad = sqrtf(dx * dx + dy * dy);
            hist[32 * (x - 1) + bin] += grad * gauss[x] * gauss[y];
        }
    }
    __syncthreads();

    // Optimize accumulation process using loop unrolling
    for (int y = 0; y < 5; y++)
        hist[y * 32 + tx] += hist[(y + 8) * 32 + tx];
    __syncthreads();

    for (int y = 0; y < 4; y++)
        hist[y * 32 + tx] += hist[(y + 4) * 32 + tx];
    __syncthreads();

    for (int y = 0; y < 2; y++)
        hist[y * 32 + tx] += hist[(y + 2) * 32 + tx];
    __syncthreads();

    hist[tx] += hist[32 + tx];
    __syncthreads();

    // Smooth histogram using a shared memory loop
    if (tx == 0)
        hist[32] = 6 * hist[0] + 4 * (hist[1] + hist[31]) + (hist[2] + hist[30]);
    if (tx == 1)
        hist[33] = 6 * hist[1] + 4 * (hist[2] + hist[0]) + (hist[3] + hist[31]);
    
    if (tx >= 2 && tx <= 29)
        hist[tx + 32] = 6 * hist[tx] + 4 * (hist[tx + 1] + hist[tx - 1]) +
                        (hist[tx + 2] + hist[tx - 2]);
    
    if (tx == 30)
        hist[62] = 6 * hist[30] + 4 * (hist[31] + hist[29]) + (hist[0] + hist[28]);
    if (tx == 31)
        hist[63] = 6 * hist[31] + 4 * (hist[0] + hist[30]) + (hist[1] + hist[29]);
    __syncthreads();

    // Find peaks in histogram
    float v = hist[32 + tx];
    hist[tx] = (v > hist[32 + ((tx + 1) & 31)] && v >= hist[32 + ((tx + 31) & 31)] ? v : 0.0f);
    __syncthreads();

    // Determine maximum values and orientations
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
        d_Orient[bx] = 11.25f * (peak < 0.0f ? peak + 32.0f : peak);

        if (maxval2 < 0.8f * maxval1)
            i2 = -1;

        if (i2 >= 0) {
            val1 = hist[32 + ((i2 + 1) & 31)];
            val2 = hist[32 + ((i2 + 31) & 31)];
            float peak = i2 + 0.5f * (val1 - val2) / (2.0f * maxval2 - val1 - val2);
            d_Orient[bx + maxPts] = 11.25f * (peak < 0.0f ? peak + 32.0f : peak);
        } else {
            d_Orient[bx + maxPts] = i2;
        }
    }
}