#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void _kgauss64map(int nx, int ns, double *x2, double *s2, double *k, double g) {
    // Calculate global thread index
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int n = nx * ns;

    // Use a stride loop for the grid
    while (i < n) {
        int xi = (i % nx);
        int si = (i / nx);
        
        // Simplified expression inside exp()
        double temp = x2[xi] + s2[si] - 2 * k[i];
        k[i] = exp(-g * temp);

        // Advance to the next grid-stride position
        i += blockDim.x * gridDim.x;
    }
}