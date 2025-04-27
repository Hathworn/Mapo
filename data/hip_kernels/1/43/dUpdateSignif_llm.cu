#include "hip/hip_runtime.h"
#include "includes.h"
#define FALSE 0
#define TRUE !FALSE

#define NUMTHREADS 16
#define THREADWORK 32

__device__ int dIsSignificant(float signif, int df) {
    float tcutoffs[49] = {
        637.000, 31.600, 2.920, 8.610, 6.869, 5.959, 5.408, 5.041, 4.781,
        4.587, 4.437, 4.318, 4.221, 4.140, 4.073, 4.015, 3.965, 3.922,
        3.883, 3.850, 3.819, 3.792, 3.768, 3.745, 3.725, 3.707, 3.690,
        3.674, 3.659, 3.646, 3.622, 3.601, 3.582, 3.566, 3.551, 3.538,
        3.526, 3.515, 3.505, 3.496, 3.476, 3.460, 3.447, 3.435, 3.416,
        3.390, 3.357, 3.340, 3.290
    };

    size_t index = 0;
    if (df <= 0) return 0;
    else if (df <= 30) index = df - 1;
    else if (df <= 50) index = 30 + (df >> 1) - 16;
    else if (df <= 70) index = 40 + (df - 55) / 5;
    else if (df <= 80) index = 44;
    else if (df <= 100) index = 45;
    else if (df <= 150) index = 46;
    else if (df <= 200) index = 47;
    else index = 48;

    return fabsf(signif) >= tcutoffs[index];
}

__global__ void dUpdateSignif(const float * gpuData, size_t n, float * gpuResults) {
    size_t bx = blockIdx.x, tx = threadIdx.x;
    size_t start = bx * NUMTHREADS * THREADWORK + tx * THREADWORK;

    // Unroll the loop for better performance
    #pragma unroll
    for(int i = 0; i < THREADWORK; i++) {
        size_t index = start + i;
        if (index >= n) break;

        size_t inrow = index * 5;
        size_t outrow = index * 6;
        
        float cor = gpuData[inrow + 3];
        float npairs = gpuData[inrow + 4];
        float tscore = (cor >= 0.999) ? 10000.0f : cor * sqrtf((npairs - 2.f) / (1.f - cor * cor));

        if (dIsSignificant(tscore, (int)npairs)) {
            for (int j = 0; j < 6; ++j) {
                gpuResults[outrow + j] = gpuData[inrow + j];
            }
            gpuResults[outrow + 4] = tscore;
        } else {
            gpuResults[outrow] = -1.f;
        }
    }
}