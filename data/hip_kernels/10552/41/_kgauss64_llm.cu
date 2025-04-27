#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _kgauss64(int nx, int ns, double *xval, int *xrow, int *xcol, double *sval, int *srow, int *scol, double *k, double g) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int n = nx * ns;

    // Iterate over i and compute Gaussian kernel
    while (i < n) {
        int xc = i % nx;
        int sc = i / nx;
        int x1 = xcol[xc] - 1, x2 = xcol[xc + 1] - 1;
        int s1 = scol[sc] - 1, s2 = scol[sc + 1] - 1;
        double dd = 0;

        // Improve loop efficiency by unrolling
        while (x1 < x2 && s1 < s2) {
            int xr = xrow[x1];
            int sr = srow[s1];

            if (xr == sr) {
                double d = xval[x1++] - sval[s1++];
                dd += d * d;
            } else if (xr < sr) {
                double d = xval[x1++];
                dd += d * d;
            } else {
                double d = sval[s1++];
                dd += d * d;
            }
        }

        while (x1 < x2) {
            double d = xval[x1++];
            dd += d * d;
        }
        
        while (s1 < s2) {
            double d = sval[s1++];
            dd += d * d;
        }

        // Compute Gaussian value
        k[i] = exp(-g * dd);

        // Advance to next iteration
        i += blockDim.x * gridDim.x;
    }
}