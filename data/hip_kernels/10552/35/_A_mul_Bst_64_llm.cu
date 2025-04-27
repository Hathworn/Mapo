#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _A_mul_Bst_64(int my, int xc, double *dy, double *xval, int *xrow, int *xcol, double *dw) {
    int t = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Compute stride
    int n = xcol[xc + 1] - xcol[xc];
    
    // Loop unrolling for improved performance
    for (int i = t; i < n; i += stride) {
        int xp = xcol[xc] + i;
        int xr = xrow[xp] - 1;

        for (int yr = 0; yr < my; yr++) {
            int yp = yr + xc * my;
            int wp = yr + xr * my;
            atomicAdd(&dw[wp], dy[yp] * xval[xp]); // Use atomicAdd for concurrent updates
        }
    }
}
