#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void plusMinus(int *size, const double *base, const float *deviation, double *a, float *b) {
    // Load size into a register to minimize global memory access
    int n = *size;
    const long ix = threadIdx.x + blockIdx.x * (long)blockDim.x;
    if (ix < n) {
        // Use a register to store intermediate results
        double baseVal = base[ix];
        float devVal = deviation[ix];
        a[ix] = baseVal - devVal;
        b[ix] = baseVal + devVal;
    }
}