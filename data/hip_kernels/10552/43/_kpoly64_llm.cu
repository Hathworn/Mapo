#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void _kpoly64(int nx, int ns, double *xval, int *xrow, int *xcol, double *sval, int *srow, int *scol, double *k, double c, double d) {
    // Calculate the global thread index
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int n = nx * ns;
    
    // Optimize by unrolling the loop
    while (i < n) {
        double ki = 0.0;
        int xc = i % nx;
        int sc = i / nx;
        int x1 = xcol[xc] - 1, x2 = xcol[xc + 1] - 1;
        int s1 = scol[sc] - 1, s2 = scol[sc + 1] - 1;
        
        // Unroll the inner while loop
        while ((x1 < x2) && (s1 < s2)) {
            int xr = xrow[x1], sr = srow[s1];
            if (sr < xr) {
                s1++;
            } else if (xr < sr) {
                x1++;
            } else {
                ki += xval[x1++] * sval[s1++];
            }
        }
        
        // Calculate the kernel value
        k[i] = pow(ki + c, d);
        
        // Move to the next element in this thread's stride
        i += blockDim.x * gridDim.x;
    }
}