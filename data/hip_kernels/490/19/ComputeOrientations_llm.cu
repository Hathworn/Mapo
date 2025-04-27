```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ComputeOrientations(float *g_Data, int *d_Ptrs, float *d_Orient, int maxPts, int w, int h)
{
    __shared__ float data[16*15];
    __shared__ float hist[32*13];
    __shared__ float gauss[16];

    const int tx = threadIdx.x;
    const int bx = blockIdx.x;

    // Initialize histogram bins
    for (int i = 0; i < 13; i++)
        hist[i * 32 + tx] = 0.0f;
    __syncthreads();

    // Precompute Gaussian values
    float i2sigma2 = -1.0f / (2.0f * 3.0f * 3.0f);
    if (tx < 15)
        gauss[tx] = exp(i2sigma2 * (tx - 7) * (tx - 7));

    int p = d_Ptrs[bx];
    int yp = p / w - 7;
    int xp = p % w - 7;
    int px = xp & 15;
    int x = tx - px;

    // Load data into shared memory
    for (int y = 0; y < 15; y++) {
        int memPos = 16 * y + x;
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

    // Compute gradients and fill histogram
    for (int y = 1; y < 14; y++) {
        int memPos = 16 * y + x;
        if (x >= 1 && x < 14) {
            float dy = data[memPos + 16] - data[memPos - 16];
            float dx = data[memPos + 1] - data[memPos - 1];
            int bin = 16.0f * atan2f(dy, dx) / 3.1416f + 16.5f;
            if (bin == 32)
                bin = 0;
            float grad = sqrtf(dx * dx + dy * dy);
            atomicAdd(&hist[32 * (x - 1) + bin], grad * gauss[x] * gauss[y]);
        }
    }
    __syncthreads();

    // Histogram reduction
    for (int stride = 8; stride > 0; stride /= 2) {
        if (y * 2 + stride < 13 * 32)
            hist[y * 32 + tx] += hist[(y + stride) * 32 + tx];
        __syncthreads();
    }

    // Smooth histogram
    if (tx < 32) {
        float v = 6 * hist[tx] + 4 * (hist[(tx + 1) % 32] + hist[(tx + 31) % 32]) + (hist[(tx + 2) % 32] + hist[(tx + 30) % 32]);
        hist[32 + tx] = v;
    }
    __syncthreads();

    // Find peaks in the histogram
    if (tx == 0) {
        float maxval1 = 0.0f, maxval2 = 0.0f;
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
        // Calculate and store orientations
        d_Orient[bx] = calculateOrientation(hist, i1, maxval1);
        d_Orient[bx + maxPts] = (maxval2 >= 0.8f * maxval1) ? calculateOrientation(hist, i2, maxval2) : -1;
    }
}

// Helper function to compute orientation
__device__ float calculateOrientation(float *hist, int i, float maxval) {
    float val1 = hist[32 + ((i + 1) % 32)];
    float val2 = hist[32 + ((i + 31) % 32)];
    float peak = i + 0.5f * (val1 - val2) / (2.0f * maxval - val1 - val2);
    return 11.25f * (peak < 0.0f ? peak + 32.0f : peak);
}