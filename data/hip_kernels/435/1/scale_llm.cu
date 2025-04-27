```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define THREADS_PER_BLOCK 512

__global__ void scale(double *d, int m, int ld, double *s) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (idx < m) {
        // Cache the square root of s to avoid repeated calculation
        double scale_factor = rsqrt(*s);
        d[idx * ld] *= scale_factor; // Applying scale
    }
}