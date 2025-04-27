#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _As_mul_Bs_32(int mx, int ns, float *xval, int *xrow, int *xcol, float *sval, int *srow, int *scol, float *k) {
    int sc = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;  // Precompute stride
    while (sc < ns) {
        int k0 = mx * sc;
        int k1 = k0 + mx;

        // Initialize k to zero for column sc
        for (int kp = k0; kp < k1; kp++) 
            k[kp] = 0;

        int s0 = scol[sc] - 1;
        int s1 = scol[sc + 1] - 1;
        for (int sp = s0; sp < s1; sp++) {
            int sr = srow[sp] - 1;
            float sv = sval[sp];
            int xc = sr;
            int x0 = xcol[xc] - 1;
            int x1 = xcol[xc + 1] - 1;

            // Calculate contribution to each k element
            for (int xp = x0; xp < x1; xp++) {
                int xr = xrow[xp] - 1;
                atomicAdd(&k[k0 + xr], xval[xp] * sv);  // Use atomicAdd for concurrent updates
            }
        }
        sc += stride;
    }
}