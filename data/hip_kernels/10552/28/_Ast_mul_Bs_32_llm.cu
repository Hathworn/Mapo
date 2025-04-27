```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _Ast_mul_Bs_32(int nx, int ns, float *xval, int *xrow, int *xcol, float *sval, int *srow, int *scol, float *k) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int gridStride = blockDim.x * gridDim.x;  // Calculate grid stride once

    // Process multiple elements per thread
    for (; i < nx * ns; i += gridStride) {
        double ki = 0.0;
        int xc = i % nx;
        int sc = i / nx;
        int x1 = xcol[xc] - 1, x2 = xcol[xc + 1] - 1;
        int s1 = scol[sc] - 1, s2 = scol[sc + 1] - 1;

        // Unroll inner loop for better performance
        while (x1 < x2 && s1 < s2) {
            int xr = xrow[x1];
            int sr = srow[s1];
            if (sr < xr)
                s1++;
            else if (xr < sr)
                x1++;
            else {
                ki += xval[x1] * sval[s1];
                x1++;
                s1++;
            }
        }
        k[i] = ki;
    }
}