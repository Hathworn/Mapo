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

    // Initialize histogram bins to zero
    for (int i = 0; i < 13; i++) {
        hist[i*32 + tx] = 0.0f;
    }
    __syncthreads();

    // Pre-compute Gaussian values
    float i2sigma2 = -1.0f / (2.0f * 3.0f * 3.0f);
    if (tx < 15) {
        gauss[tx] = exp(i2sigma2 * (tx - 7) * (tx - 7));
    }

    // Fetch location from pointers
    int p = d_Ptrs[bx];
    int yp = p / w - 7;
    int xp = p % w - 7;

    // Pre-calculate px and corresponding x value
    int px = xp & 15;
    int x = tx - px;

    // Load data into shared memory
    for (int y = 0; y < 15; y++) {
        int memPos = 16 * y + x;
        int xi = max(0, min(w - 1, xp + x));
        int yi = max(0, min(h - 1, yp + y));

        if (x >= 0 && x < 15) {
            data[memPos] = g_Data[yi * w + xi];
        }
    }
    __syncthreads();

    // Compute gradients and vote into orientation histogram
    for (int y = 1; y < 14; y++) {
        int memPos = 16 * y + x;
        if (x >= 1 && x < 14) {
            float dy = data[memPos + 16] - data[memPos - 16];
            float dx = data[memPos + 1] - data[memPos - 1];
            int bin = __float2int_rn(16.0f * atan2f(dy, dx) / 3.1416f + 16.5f);  // Avoids if-condition, uses rounding
            bin = (bin == 32) ? 0 : bin;  // Correct bin wrapping
            float grad = sqrtf(dx * dx + dy * dy);
            atomicAdd(&hist[32 * (x - 1) + bin], grad * gauss[x] * gauss[y]);  // Atomic add to prevent race condition
        }
    }
    __syncthreads();

    // Reduction to base histogram
    for (int stride = 8; stride > 0; stride /= 2) {
        if (tx < stride) {
            hist[tx] += hist[tx + stride];
        }
        __syncthreads();
    }

    // Smoothing histogram using a sliding kernel
    if (tx < 32) {
        float v1 = hist[(tx + 1) & 31];
        float v2 = hist[(tx + 31) & 31];
        hist[tx] = 6 * hist[tx] + 4 * (v1 + v2) + (hist[(tx + 2) & 31] + hist[(tx + 30) & 31]);
    }
    __syncthreads();

    // Find peaks in the histogram
    if (tx == 0) {
        float maxval1 = 0.0f;
        float maxval2 = 0.0f;
        int i1 = -1;
        int i2 = -1;
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

        // Compute first orientation peak
        float val1 = hist[32 + ((i1 + 1) & 31)];
        float val2 = hist[32 + ((i1 + 31) & 31)];
        float peak = i1 + 0.5f * (val1 - val2) / (2.0f * maxval1 - val1 - val2);
        d_Orient[bx] = 11.25f * ((peak < 0.0f) ? peak + 32.0f : peak);

        // Compute second orientation peak
        if (maxval2 < 0.8f * maxval1) {
            i2 = -1;
        }
        if (i2 >= 0) {
            val1 = hist[32 + ((i2 + 1) & 31)];
            val2 = hist[32 + ((i2 + 31) & 31)];
            peak = i2 + 0.5f * (val1 - val2) / (2.0f * maxval2 - val1 - val2);
            d_Orient[bx + maxPts] = 11.25f * ((peak < 0.0f) ? peak + 32.0f : peak);
        } else {
            d_Orient[bx + maxPts] = i2;
        }
    }
}