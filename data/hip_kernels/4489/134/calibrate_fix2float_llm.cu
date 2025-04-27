#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calibrate_fix2float(float *dst, const float* sA, const float* sB, float alpha, float beta, int height, int width, int threads) {
    int ri = blockIdx.x;
    int tid = threadIdx.x;
    int idx = tid + blockIdx.x * blockDim.x; // Calculate a unique index per thread

    // Calculate loop based on total possible threads per block
    if (idx < width) {
        float rscale = (sA[ri] == 0.0f) ? 1.0f : sA[ri];
        float *data = dst + width * ri;

        float temp = data[idx];
        float cscale = (sB[idx] == 0.0f) ? 255.0f : sB[idx];
        data[idx] = beta * temp + alpha * temp * rscale * cscale;
    }
}