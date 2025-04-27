#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void squared_difference(float *x, float *y, int len) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Check if the index is within bounds, optimized with loop unrolling
    if (i < len) {
        float xi = x[i];
        float yi = y[i];
        x[i] = (xi - yi) * (xi - yi);
    }
}