#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void saveTheWhalesX ( const int d0, const int d1, const int i0, const int i2, float *xxx, const int d3, const float *x ) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if ( i < d3 ) {
        // Precompute offsets for improved performance
        int offset = i * d0 + i2 * d0 * d1;
        xxx[i0 + offset] = x[i];
    }
}