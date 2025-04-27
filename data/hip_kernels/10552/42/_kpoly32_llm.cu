#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _kpoly32(int nx, int ns, float *xval, int *xrow, int *xcol, float *sval, int *srow, int *scol, float *k, float c, float d) {
    // Compute global index
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int n = nx*ns;

    // Loop for processing multiple elements per thread with stride
    for (; i < n; i += blockDim.x * gridDim.x) {
        double ki = 0;
        // Calculate column indices for x and s
        int xc = i % nx;
        int sc = i / nx;
        // Set row index boundaries for x and s
        int x1 = xcol[xc] - 1;
        int x2 = xcol[xc + 1] - 1;
        int s1 = scol[sc] - 1;
        int s2 = scol[sc + 1] - 1;

        // Loop to process current element's column until either x or s is exhausted
        while (x1 < x2 && s1 < s2) {
            int xr = xrow[x1];
            int sr = srow[s1];
            // Compare and update indices based on row comparison for x and s
            if (sr < xr) {
                s1++;
            } else if (xr < sr) {
                x1++;
            } else {
                // Accumulate product of matching elements
                ki += xval[x1++] * sval[s1++];
            }
        }
        // Compute kernel value using polynomial expansion
        k[i] = pow(ki + c, (double)d);
    }
}