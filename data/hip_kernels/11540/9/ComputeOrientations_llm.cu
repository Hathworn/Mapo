#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ComputeOrientations(float *g_Data, float *d_Sift, int maxPts, int w, int h)
{
    __shared__ float data[16*15];
    __shared__ float hist[32*13];
    __shared__ float gauss[16];
    const int tx = threadIdx.x;
    const int bx = blockIdx.x;

    // Initialize histogram bins to zero
    for (int i = 0; i < 13; i++)
        hist[i * 32 + tx] = 0.0f;
    __syncthreads();

    // Precompute Gaussian weights
    if (tx < 15) {
        float i2sigma2 = -1.0f / (2.0f * 3.0f * 3.0f);
        gauss[tx] = exp(i2sigma2 * (tx - 7) * (tx - 7));
    }

    int xp = (int)(d_Sift[bx + 0 * maxPts] - 6.5f);
    int yp = (int)(d_Sift[bx + 1 * maxPts] - 6.5f);
    int px = xp & 15;
    int x = tx - px;

    // Load data into shared memory with boundary checks
    for (int y = 0; y < 15; y++) {
        int memPos = 16 * y + x;
        int xi = max(0, min(w - 1, xp + x)); // Clamp xi
        int yi = max(0, min(h - 1, yp + y)); // Clamp yi
        if (x >= 0 && x < 15)
            data[memPos] = g_Data[yi * w + xi];
    }
    __syncthreads();

    // Compute gradients and organize into histogram
    if (x >= 1 && x < 14) {
        for (int y = 1; y < 14; y++) {
            int memPos = 16 * y + x;
            float dy = data[memPos + 16] - data[memPos - 16];
            float dx = data[memPos + 1] - data[memPos - 1];
            int bin = 16.0f * atan2f(dy, dx) / 3.1416f + 16.5f;
            bin = bin < 32 ? bin : 0; // Adjust for bin overflow
            float grad = sqrtf(dx * dx + dy * dy);
            atomicAdd(&hist[32 * (x - 1) + bin], grad * gauss[x] * gauss[y]); // Use atomic addition
        }
    }
    __syncthreads();

    // Reduce histogram bins
    for (int offset = 8; offset > 0; offset >>= 1) {
        for (int y = 0; y < 13 - offset; y += offset)
            hist[y * 32 + tx] += hist[(y + offset) * 32 + tx];
        __syncthreads();
    }
    
    // Smoothing histogram and finding peaks
    if (tx < 32) {
        hist[tx] = hist[32 * 0 + tx] * 6 + (hist[32 * 1 + (tx + 1) % 32] + hist[32 * 1 + (tx + 31) % 32]) * 4 + (hist[32 * 1 + (tx + 2) % 32] + hist[32 * 1 + (tx + 30) % 32]);
        __syncthreads();

        float v = hist[tx];
        float v_right = hist[(tx + 1) % 32];
        float v_left = hist[(tx + 31) % 32];

        if (v > v_right && v >= v_left) {
            float peak = tx + 0.5f * (v_right - v_left) / (2.0f * v - v_right - v_left);
            if (tx == 0) {
                d_Sift[bx + 5 * maxPts] = 11.25f * (peak < 0.0f ? peak + 32.0f : peak);
                // Determine second peak if valid
                float maxval = v * 0.8f;
                for (int i = 1; i < 32; i++) {
                    if (hist[i] > maxval) {
                        float v1 = hist[(i + 1) % 32];
                        float v2 = hist[(i + 31) % 32];
                        peak = i + 0.5f * (v1 - v2) / (2.0f * hist[i] - v1 - v2);
                        d_Sift[bx + 6 * maxPts] = 11.25f * (peak < 0.0f ? peak + 32.0f : peak);
                        break;
                    }
                }
            }
        }
    }
}