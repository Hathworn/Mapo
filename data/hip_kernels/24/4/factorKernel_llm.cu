#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void factorKernel(float *w, int N)
{
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int idx = ix * 2;

    // Optimized to avoid repeated calculations
    if (idx < N) {
        float arg = (2.0f * 3.1415f * ix) / N;
        float cos_val = cos(arg);
        float sin_val = sin(arg);

        // Direct assignments with precomputed values
        w[idx] = cos_val;
        w[idx + 1] = sin_val;
        w[N + idx] = -cos_val;
        w[N + idx + 1] = -sin_val;
    }
}