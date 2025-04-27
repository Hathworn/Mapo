#include "hip/hip_runtime.h"
#include "includes.h"

// Using more efficient shared memory usage and reducing repetitive computations
__global__ void ComputeOrientations(float *g_Data, int *d_Ptrs, float *d_Orient, int maxPts, int w, int h) {
    __shared__ float data[16 * 15];
    __shared__ float hist[32];
    __shared__ float gauss[15];
    
    int tx = threadIdx.x;
    int bx = blockIdx.x;

    if (tx < 13) {
        hist[tx*32 + threadIdx.x] = 0.0f;
    }
    __syncthreads();

    float i2sigma2 = -1.0f / (2.0f * 3.0f * 3.0f);
    if (tx < 15) {
        gauss[tx] = expf(i2sigma2 * (tx - 7) * (tx - 7));
    }

    int p = d_Ptrs[bx];
    int yp = p / w - 7;
    int xp = p % w - 7;
    int px = xp & 15;
    int x = tx - px;

    // Load data into shared memory
    for (int y = 0; y < 15; y++) {
        int memPos = 16 * y + x;
        int xi = min(max(xp + x, 0), w - 1);
        int yi = min(max(yp + y, 0), h - 1);
        if (x >= 0 && x < 15) {
            data[memPos] = g_Data[yi * w + xi];
        }
    }
    __syncthreads();

    // Calculate gradients and populate histogram
    for (int y = 1; y < 14; y++) {
        int memPos = 16 * y + x;
        if (x >= 1 && x < 14) {
            float dy = data[memPos + 16] - data[memPos - 16];
            float dx = data[memPos + 1] - data[memPos - 1];
            int bin = static_cast<int>(16.0f * atan2f(dy, dx) / 3.1416f + 16.5f) & 31;
            float grad = sqrtf(dx * dx + dy * dy);
            atomicAdd(&hist[bin], grad * gauss[x] * gauss[y]);
        }
    }
    __syncthreads();

    // Reduce histogram across threads
    if (tx < 16) {
        for (int i = 16; i > 0; i /= 2) {
            hist[tx] += hist[tx + i];
            __syncthreads();
        }
    }

    // Identify primary and secondary peaks in histogram
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

        // Compute peak angle using quadratic interpolation
        float val1 = hist[(i1 + 1) & 31];
        float val2 = hist[(i1 + 31) & 31];
        float peak = i1 + 0.5f * (val1 - val2) / (2.0f * maxval1 - val1 - val2);
        d_Orient[bx] = 11.25f * (peak < 0.0f ? peak + 32.0f : peak);

        if (maxval2 < 0.8f * maxval1) i2 = -1;

        if (i2 >= 0) {
            val1 = hist[(i2 + 1) & 31];
            val2 = hist[(i2 + 31) & 31];
            peak = i2 + 0.5f * (val1 - val2) / (2.0f * maxval2 - val1 - val2);
            d_Orient[bx + maxPts] = 11.25f * (peak < 0.0f ? peak + 32.0f : peak);
        } else {
            d_Orient[bx + maxPts] = i2;
        }
    }
}