#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _kgauss32(int nx, int ns, float *xval, int *xrow, int *xcol, float *sval, int *srow, int *scol, float *k, float g) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int n = nx * ns;

    // Use shared memory for frequently accessed data
    extern __shared__ float shared[];

    while (i < n) {
        int xc = i % nx;
        int sc = i / nx;
        int x1 = xcol[xc] - 1, x2 = xcol[xc + 1] - 1;
        int s1 = scol[sc] - 1, s2 = scol[sc + 1] - 1;
        double dd = 0.0;

        while (x1 < x2 || s1 < s2) {
            int xr = (x1 < x2) ? xrow[x1] : INT_MAX;
            int sr = (s1 < s2) ? srow[s1] : INT_MAX;

            // Load values into shared memory
            shared[threadIdx.x] = (sr < xr) ? sval[s1++] : (xr < sr) ? xval[x1++] : (xval[x1++] - sval[s1++]);
            __syncthreads(); // Ensure all threads load their values

            // Use the shared memory data
            double d = shared[threadIdx.x];
            dd += d * d;

            __syncthreads(); // Synchronize before continuing loop
        }

        k[i] = exp(-g * dd);
        i += blockDim.x * gridDim.x;
    }
}