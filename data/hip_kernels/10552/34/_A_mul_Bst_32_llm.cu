#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _A_mul_Bst_32(int my, int xc, float *dy, float *xval, int *xrow, int *xcol, float *dw) {
    // Calculate global thread ID
    int t = threadIdx.x + blockIdx.x * blockDim.x;

    // Compute number of elements in current column
    int n = xcol[xc+1] - xcol[xc];

    // Efficiently handle threads within bounds
    for (int idx = t; idx < n; idx += blockDim.x * gridDim.x) {
        int xp = xcol[xc] + idx - 1;
        int xr = xrow[xp] - 1;

        // Optimize loop unrolling for my
        for (int yr = 0; yr < my; ++yr) {
            int yp = yr + xc * my;
            int wp = yr + xr * my;
            atomicAdd(&dw[wp], dy[yp] * xval[xp]);  // Use atomicAdd for concurrent writes
        }
    }
}