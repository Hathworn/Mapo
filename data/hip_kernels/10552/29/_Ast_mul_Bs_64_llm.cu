#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _Ast_mul_Bs_64(int nx, int ns, double *xval, int *xrow, int *xcol, double *sval, int *srow, int *scol, double *k) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Precompute stride to reduce repeated calculations
    int n = nx * ns;
    
    while (i < n) {
        double ki = 0;
        int xc = i % nx;
        int sc = i / nx;
        int x1 = xcol[xc] - 1;
        int x2 = xcol[xc + 1] - 1;
        int s1 = scol[sc] - 1;
        int s2 = scol[sc + 1] - 1;
        
        while (x1 < x2 && s1 < s2) {
            int xr = xrow[x1];
            int sr = srow[s1];
            
            if (sr < xr) {
                s1++;
            } else if (xr < sr) {
                x1++;
            } else {
                ki += xval[x1++] * sval[s1++]; // Eliminate braces for single line conditions
            }
        }
        k[i] = ki;
        i += stride; // Use precomputed stride
    }
}