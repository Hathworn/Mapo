#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOrientations(float *g_Data, int *d_Ptrs, float *d_Orient, int maxPts, int w, int h)
{
    __shared__ float data[16 * 15];
    __shared__ float hist[32 * 13];
    __shared__ float gauss[16];

    const int tx = threadIdx.x;
    const int bx = blockIdx.x;
    
    // Initialize histogram bins to zero
    for (int i = 0; i < 13; i++) {
        hist[i * 32 + tx] = 0.0f;
    }
    __syncthreads();

    // Precompute Gaussian weights
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

        // Clamp coordinates inside image boundaries
        xi = max(0, min(xi, w - 1));
        yi = max(0, min(yi, h - 1));

        if (x >= 0 && x < 15) 
            data[memPos] = g_Data[yi * w + xi];
    }
    __syncthreads();

    for (int y = 1; y < 14; y++) {
        int memPos = 16 * y + x;
        if (x >= 1 && x < 14) {
            float dy = data[memPos + 16] - data[memPos - 16];
            float dx = data[memPos + 1] - data[memPos - 1];
            int bin = 16.0f * atan2f(dy, dx) / 3.1416f + 16.5f;

            if (bin == 32)
                bin = 0;
            
            float grad = sqrtf(dx * dx + dy * dy);
            hist[32 * (x - 1) + bin] += grad * gauss[x] * gauss[y];
        }
    }
    __syncthreads();

    // Aggregation of histogram bins
    for (int offset = 8; offset >= 1; offset /= 2) {
        if (tx < 32) {
            for (int y = 0; y < (8 / offset); y++) {
                hist[y * 32 + tx] += hist[(y + offset) * 32 + tx];
            }
        }
        __syncthreads();
    }

    if (tx < 32)
        hist[tx] += hist[32 + tx];
    __syncthreads();

    // Apply smoothing to histogram
    if (tx == 0) {
        hist[32] = 6 * hist[0] + 4 * (hist[1] + hist[31]) + (hist[2] + hist[30]);
    } else if (tx == 1) {
        hist[33] = 6 * hist[1] + 4 * (hist[2] + hist[0]) + (hist[3] + hist[31]);
    } else if (tx >= 2 && tx <= 29) {
        hist[tx + 32] = 6 * hist[tx] + 4 * (hist[tx + 1] + hist[tx - 1]) +
                        (hist[tx + 2] + hist[tx - 2]);
    } else if (tx == 30) {
        hist[62] = 6 * hist[30] + 4 * (hist[31] + hist[29]) + (hist[0] + hist[28]);
    } else if (tx == 31) {
        hist[63] = 6 * hist[31] + 4 * (hist[0] + hist[30]) + (hist[1] + hist[29]);
    }
    __syncthreads();

    // Find maximum orientation peaks
    float v = hist[32 + tx];
    if (tx < 32) {
        hist[tx] = (v > hist[32 + ((tx + 1) & 31)] && v >= hist[32 + ((tx + 31) & 31)]) ? v : 0.0f;
    }
    __syncthreads();

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

        float val1 = hist[32 + ((i1 + 1) & 31)];
        float val2 = hist[32 + ((i1 + 31) & 31)];
        float peak = i1 + 0.5f * (val1 - val2) / (2.0f * maxval1 - val1 - val2);
        d_Orient[bx] = 11.25f * (peak < 0.0f ? peak + 32.0f : peak);

        if (maxval2 < 0.8f * maxval1)
            i2 = -1;

        if (i2 >= 0) {
            val1 = hist[32 + ((i2 + 1) & 31)];
            val2 = hist[32 + ((i2 + 31) & 31)];
            peak = i2 + 0.5f * (val1 - val2) / (2.0f * maxval2 - val1 - val2);
            d_Orient[bx + maxPts] = 11.25f * (peak < 0.0f ? peak + 32.0f : peak);
        } else {
            d_Orient[bx + maxPts] = i2;
        }
    }
}