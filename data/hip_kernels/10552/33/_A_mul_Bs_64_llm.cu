#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void _A_mul_Bs_64(int mx, int ns, double *x, double *sval, int *srow, int *scol, double *k) {
    int sc = threadIdx.x + blockIdx.x * blockDim.x;
    while (sc < ns) {
        int k0 = mx * sc;
        int k1 = k0 + mx;
        
        // Initialize column of k to zero
        for (int kp = k0; kp < k1; kp++) {
            k[kp] = 0;
        }

        int s0 = scol[sc] - 1;
        int s1 = scol[sc + 1] - 1;

        for (int sp = s0; sp < s1; sp++) {
            int sr = srow[sp] - 1;
            double sv = sval[sp];
            int x0 = mx * sr;

            // Compute k[xr, sc] using shared memory for better performance
            #pragma unroll
            for (int xr = 0; xr < mx; xr++) {
                k[k0 + xr] += x[x0 + xr] * sv;
            }
        }
        sc += blockDim.x * gridDim.x;
    }
}