#include "hip/hip_runtime.h"
#include "includes.h"

// Define block size for performance optimization
#define BLOCK_SIZE 32 

__global__ void ComputeOrientations(float *g_Data, int *d_Ptrs, float *d_Orient, int maxPts, int w, int h)
{
    __shared__ float data[16*15];
    __shared__ float hist[BLOCK_SIZE*14];
    __shared__ float gauss[16];

    const int tx = threadIdx.x;
    const int bx = blockIdx.x;

    // Initialize histogram to zero
    for (int i = 0; i < 13; i++)
        hist[i * BLOCK_SIZE + tx] = 0.0f;
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

    // Load data and apply boundary conditions
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

    // Compute gradients and update histogram
    for (int y = 1; y < 14; y++) {
        int memPos = 16 * y + x;
        if (x >= 1 && x < 14) {
            float dy = data[memPos + 16] - data[memPos - 16];
            float dx = data[memPos + 1] - data[memPos - 1];
            float bin = 16.0f * atan2f(dy, dx) / 3.1416f + 16.5f;
            if (bin == 32)
                bin = 0;
            float grad = sqrtf(dx * dx + dy * dy);
            hist[32 * (x - 1) + static_cast<int>(bin)] += grad * gauss[x] * gauss[y];
        }
    }
    __syncthreads();

    // Reduce histogram values
    for (int offset = 8; offset >= 1; offset >>= 1) {
        for (int y = 0; y < BLOCK_SIZE / (2 * offset); y++)
            hist[y * BLOCK_SIZE + tx] += hist[(y + offset) * BLOCK_SIZE + tx];
        __syncthreads();
    }

    // Apply smoothing
    if (tx < BLOCK_SIZE) {
        int prev = (tx + BLOCK_SIZE - 1) % BLOCK_SIZE;
        int next = (tx + 1) % BLOCK_SIZE;
        hist[BLOCK_SIZE + tx] = 6 * hist[tx] + 4 * (hist[next] + hist[prev]) + (hist[(next + 1) % BLOCK_SIZE] + hist[(prev + BLOCK_SIZE - 1) % BLOCK_SIZE]);
    }
    __syncthreads();

    // Find peak values for orientation
    if (tx == 0) {
        float maxval1 = 0.0f, maxval2 = 0.0f;
        int i1 = -1, i2 = -1;
        for (int i = 0; i < BLOCK_SIZE; i++) {
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

        // Parabolic interpolation for accurate peak position
        float val1 = hist[BLOCK_SIZE + ((i1 + 1) & (BLOCK_SIZE - 1))];
        float val2 = hist[BLOCK_SIZE + ((i1 + BLOCK_SIZE - 1) & (BLOCK_SIZE - 1))];
        float peak = i1 + 0.5f * (val1 - val2) / (2.0f * maxval1 - val1 - val2);
        d_Orient[bx] = 11.25f * (peak < 0.0f ? peak + BLOCK_SIZE : peak);

        if (maxval2 < 0.8f * maxval1)
            i2 = -1;
        if (i2 >= 0) {
            val1 = hist[BLOCK_SIZE + ((i2 + 1) & (BLOCK_SIZE - 1))];
            val2 = hist[BLOCK_SIZE + ((i2 + BLOCK_SIZE - 1) & (BLOCK_SIZE - 1))];
            peak = i2 + 0.5f * (val1 - val2) / (2.0f * maxval2 - val1 - val2);
            d_Orient[bx + maxPts] = 11.25f * (peak < 0.0f ? peak + BLOCK_SIZE : peak);
        } else
            d_Orient[bx + maxPts] = i2;
    }
}