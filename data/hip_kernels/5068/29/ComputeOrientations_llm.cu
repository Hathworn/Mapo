#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOrientations(float *g_Data, int *d_Ptrs, float *d_Orient, int maxPts, int w, int h)
{
    __shared__ float data[16*15];
    __shared__ float hist[32*13];
    __shared__ float gauss[16];
    const int tx = threadIdx.x;
    const int bx = blockIdx.x;

    // Initialize histogram to 0
    for (int i = 0; i < 13; i++)
        hist[i * 32 + tx] = 0.0f;
    __syncthreads();

    // Precompute Gaussian weights
    float i2sigma2 = -1.0f / (2.0f * 3.0f * 3.0f);
    if (tx < 15)
        gauss[tx] = exp(i2sigma2 * (tx - 7) * (tx - 7));

    // Calculate pixel coordinates
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
        xi = max(0, min(xi, w - 1));  // Clamp xi to valid range
        yi = max(0, min(yi, h - 1));  // Clamp yi to valid range
        if (x >= 0 && x < 15)
            data[memPos] = g_Data[yi * w + xi];
    }
    __syncthreads();

    // Gradient calculation and histogram binning
    for (int y = 1; y < 14; y++) {
        int memPos = 16 * y + x;
        if (x >= 1 && x < 14) {
            float dy = data[memPos + 16] - data[memPos - 16];
            float dx = data[memPos + 1] - data[memPos - 1];
            int bin = 16.0f * atan2f(dy, dx) / 3.1416f + 16.5f;
            bin = (bin == 32) ? 0 : bin;  // Wrap bin index
            float grad = sqrtf(dx * dx + dy * dy);
            hist[32 * (x - 1) + bin] += grad * gauss[x] * gauss[y];
        }
    }
    __syncthreads();

    // Reduce histogram
    if (tx < 32) {
        for (int offset = 4; offset > 0; offset /= 2) {
            for (int y = 0; y < offset; y++)
                hist[y * 32 + tx] += hist[(y + offset) * 32 + tx];
            __syncthreads();
        }
        hist[tx] += hist[32 + tx];
    }
    __syncthreads();

    // Smooth histogram
    if (tx < 32) {
        hist[32 + tx] = 6 * hist[tx] + 4 * (hist[(tx + 1) & 31] + hist[(tx + 31) & 31]) + (hist[(tx + 2) & 31] + hist[(tx + 30) & 31]);
    }
    __syncthreads();

    // Find peaks
    if (tx < 32) {
        float v = hist[32 + tx];
        hist[tx] = (v > hist[32 + ((tx + 1) & 31)] && v >= hist[32 + ((tx + 31) & 31)]) ? v : 0.0f;
    }
    __syncthreads();

    // Find dominant orientations
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

        // Compute peak location
        float peak1 = i1 + 0.5f * (hist[32 + ((i1 + 1) & 31)] - hist[32 + ((i1 + 31) & 31)]) / (2.0f * maxval1 - hist[32 + ((i1 + 1) & 31)] - hist[32 + ((i1 + 31) & 31)]);
        d_Orient[bx] = 11.25f * ((peak1 < 0.0f) ? peak1 + 32.0f : peak1);

        if (maxval2 < 0.8f * maxval1) {
            d_Orient[bx + maxPts] = i2;
        } else {
            float peak2 = i2 + 0.5f * (hist[32 + ((i2 + 1) & 31)] - hist[32 + ((i2 + 31) & 31)]) / (2.0f * maxval2 - hist[32 + ((i2 + 1) & 31)] - hist[32 + ((i2 + 31) & 31)]);
            d_Orient[bx + maxPts] = 11.25f * ((peak2 < 0.0f) ? peak2 + 32.0f : peak2);
        }
    }
}