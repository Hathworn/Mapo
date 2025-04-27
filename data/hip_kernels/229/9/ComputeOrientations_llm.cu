#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOrientations(float *g_Data, float *d_Sift, int maxPts, int w, int h)
{
    __shared__ float data[16*15];
    __shared__ float hist[32*13];
    __shared__ float gauss[16];
    
    const int tx = threadIdx.x;
    const int bx = blockIdx.x;
    
    if (tx < 13) {
        for (int i = 0; i < 32; i++) // Initialize histogram with zero
            hist[i * 13 + tx] = 0.0f;
    }
    __syncthreads();

    float i2sigma2 = -1.0f/(2.0f*3.0f*3.0f);
    if (tx < 15)
        gauss[tx] = exp(i2sigma2 * (tx - 7) * (tx - 7));

    int xp = (int)(d_Sift[bx + 0*maxPts] - 6.5f);
    int yp = (int)(d_Sift[bx + 1*maxPts] - 6.5f);
    int px = xp & 15;
    int x = tx - px;

    for (int y = 0; y < 15; y++) {
        int memPos = 16*y + x;
        int xi = xp + x;
        int yi = yp + y;
        xi = min(max(xi, 0), w-1); // Bound check for xi
        yi = min(max(yi, 0), h-1); // Bound check for yi
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
            bin = (bin == 32) ? 0 : bin; // Avoid overflow in binning
            float grad = sqrtf(dx * dx + dy * dy);
            atomicAdd(&hist[32 * (x - 1) + bin], grad * gauss[x] * gauss[y]); // Use atomicAdd for reduction
        }
    }
    __syncthreads();

    for (int offset = 8; offset > 0; offset >>= 1) { // Reduce summation steps
        if (tx < 32)
            hist[tx] += hist[tx + offset * 32];
        __syncthreads();
    }
    
    if (tx < 32) {
        float v = hist[32 + tx];
        hist[tx] = (v > hist[32 + ((tx + 1) & 31)] && v >= hist[32 + ((tx + 31) & 31)]) ? v : 0.0f;
    }
    __syncthreads();
    
    if (tx == 0) {
        float maxval1 = 0.0, maxval2 = 0.0, val1, val2, peak;
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
        
        val1 = hist[32 + ((i1 + 1) & 31)];
        val2 = hist[32 + ((i1 + 31) & 31)];
        peak = i1 + 0.5f * (val1 - val2) / (2.0f * maxval1 - val1 - val2);
        d_Sift[bx + 5 * maxPts] = 11.25f * ((peak < 0.0f) ? peak + 32.0f : peak);

        if (maxval2 < 0.8f * maxval1)
            i2 = -1;

        if (i2 >= 0) {
            val1 = hist[32 + ((i2 + 1) & 31)];
            val2 = hist[32 + ((i2 + 31) & 31)];
            peak = i2 + 0.5f * (val1 - val2) / (2.0f * maxval2 - val1 - val2);
            d_Sift[bx + 6 * maxPts] = 11.25f * ((peak < 0.0f) ? peak + 32.0f : peak);
        } else {
            d_Sift[bx + 6 * maxPts] = i2;
        }
    }
}