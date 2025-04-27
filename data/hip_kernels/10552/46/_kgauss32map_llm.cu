#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized _kgauss32map kernel
__global__ void _kgauss32map(int nx, int ns, float *x2, float *s2, float *k, float g) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    int n = nx * ns;

    // Loop through elements with stride
    for (; i < n; i += stride) {
        int xi = i % nx;  // Compute row index
        int si = i / nx;  // Compute column index
        // Update k[i] using precomputed indices and exponential function
        k[i] = expf(-g * (x2[xi] + s2[si] - 2 * k[i]));
    }
}