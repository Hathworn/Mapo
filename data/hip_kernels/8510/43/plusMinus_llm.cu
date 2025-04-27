#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void plusMinus(int size, const double *base, const float *deviation, double *a, float *b) {
    const long ix = blockIdx.x * blockDim.x + threadIdx.x;  // Optimize thread index calculation
    if (ix < size) {
        double baseVal = base[ix];  // Cache memory access
        float deviationVal = deviation[ix];  // Cache memory access
        a[ix] = baseVal - deviationVal;  // Perform operation with cached values
        b[ix] = baseVal + deviationVal;  // Perform operation with cached values
    }
}