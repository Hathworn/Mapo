#include "hip/hip_runtime.h"
#include "includes.h"

#define THREADS 32
#define SHARED_MEM_DATA_SIZE 16*15
#define SHARED_MEM_HIST_SIZE 32*13
#define GAUSS_SIZE 16
#define BLOCK_DIM 32

__global__ void ComputeOrientations(float *g_Data, float *d_Sift, int maxPts, int w, int h)
{
    __shared__ float data[SHARED_MEM_DATA_SIZE];
    __shared__ float hist[SHARED_MEM_HIST_SIZE];
    __shared__ float gauss[GAUSS_SIZE];
    
    const int tx = threadIdx.x;
    const int bx = blockIdx.x;
    
    // Initialize histogram
    for (int i = 0; i < 13; i++) {
        hist[i * THREADS + tx] = 0.0f;
    }
    __syncthreads();
    
    // Precompute Gaussian values
    float i2sigma2 = -1.0f / (2.0f * 3.0f * 3.0f);
    if (tx < 15) {
        gauss[tx] = exp(i2sigma2 * (tx - 7) * (tx - 7));
    }
    
    int xp = (int)(d_Sift[bx] - 6.5f);
    int yp = (int)(d_Sift[bx + maxPts] - 6.5f);
    int px = xp & 15;
    int x = tx - px;

    // Load data into shared memory
    for (int y = 0; y < 15; y++) {
        int memPos = 16 * y + x;
        int xi = xp + x;
        int yi = yp + y;
        xi = max(0, min(xi, w - 1));
        yi = max(0, min(yi, h - 1));

        if (x >= 0 && x < 15) {
            data[memPos] = g_Data[yi * w + xi];
        }
    }
    __syncthreads();
    
    // Calculate gradients and build histogram
    for (int y = 1; y < 14; y++) {
        int memPos = 16 * y + x;
        if (x >= 1 && x < 14) {
            float dy = data[memPos + 16] - data[memPos - 16];
            float dx = data[memPos + 1] - data[memPos - 1];
            int bin = 16.0f * atan2f(dy, dx) / 3.1416f + 16.5f;
            bin = bin == 32 ? 0 : bin;
            float grad = sqrtf(dx * dx + dy * dy);
            hist[THREADS * (x - 1) + bin] += grad * gauss[x] * gauss[y];
        }
    }
    __syncthreads();
    
    // Consolidate histogram entries
    for (int y = 0; y < 5; y++) {
        hist[y * THREADS + tx] += hist[(y + 8) * THREADS + tx];
    }
    __syncthreads();
    for (int y = 0; y < 4; y++) {
        hist[y * THREADS + tx] += hist[(y + 4) * THREADS + tx];
    }
    __syncthreads();
    for (int y = 0; y < 2; y++) {
        hist[y * THREADS + tx] += hist[(y + 2) * THREADS + tx];
    }
    __syncthreads();
    hist[tx] += hist[THREADS + tx];
    __syncthreads();

    // Gaussian smoothing
    if (tx < THREADS - 1) {
        hist[THREADS + tx] = 6 * hist[tx] + 4 * (hist[(tx + 1) % THREADS] + hist[(tx - 1 + THREADS) % THREADS]) +
                             (hist[(tx + 2) % THREADS] + hist[(tx - 2 + THREADS) % THREADS]);
    } else {
        hist[THREADS + tx] = 6 * hist[tx] + 4 * (hist[0] + hist[tx - 1]) + (hist[1] + hist[tx - 2]);
    }
    __syncthreads();

    // Find peaks in histogram
    float v = hist[THREADS + tx];
    hist[tx] = (v > hist[THREADS + ((tx + 1) % THREADS)] && v >= hist[THREADS + ((tx - 1 + THREADS) % THREADS)]) ? v : 0.0f;
    __syncthreads();

    if (tx == 0) {
        float maxval1 = 0.0f, maxval2 = 0.0f;
        int i1 = -1, i2 = -1;
        for (int i = 0; i < THREADS; i++) {
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
        
        // Subpixel precision
        float val1 = hist[THREADS + ((i1 + 1) % THREADS)];
        float val2 = hist[THREADS + ((i1 - 1 + THREADS) % THREADS)];
        float peak = i1 + 0.5f * (val1 - val2) / (2.0f * maxval1 - val1 - val2);
        d_Sift[bx + 5 * maxPts] = 11.25f * (peak < 0.0f ? peak + THREADS : peak);
        
        if (maxval2 < 0.8f * maxval1) i2 = -1;
        
        if (i2 >= 0) {
            val1 = hist[THREADS + ((i2 + 1) % THREADS)];
            val2 = hist[THREADS + ((i2 - 1 + THREADS) % THREADS)];
            peak = i2 + 0.5f * (val1 - val2) / (2.0f * maxval2 - val1 - val2);
            d_Sift[bx + 6 * maxPts] = 11.25f * (peak < 0.0f ? peak + THREADS : peak);
        } else {
            d_Sift[bx + 6 * maxPts] = i2;
        }
    }
}