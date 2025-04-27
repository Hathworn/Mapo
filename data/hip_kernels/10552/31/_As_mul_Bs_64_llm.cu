#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _As_mul_Bs_64(int mx, int ns, double *xval, int *xrow, int *xcol, double *sval, int *srow, int *scol, double *k) {
    int sc = threadIdx.x + blockIdx.x * blockDim.x;
    while (sc < ns) { 
        int k0 = mx * sc;    
        int k1 = k0 + mx;

        // Use memset to initialize k[:,sc] to zero
        if (threadIdx.x == 0) { 
            memset(&k[k0], 0, mx * sizeof(double));
        }
        __syncthreads();  // Ensure all threads sync after memset

        int s0 = scol[sc] - 1;    
        int s1 = scol[sc + 1] - 1;  

        for (int sp = s0; sp < s1; sp++) {
            int sr = srow[sp] - 1;
            double sv = sval[sp];
            int xc = sr;
            int x0 = xcol[xc] - 1;
            int x1 = xcol[xc + 1] - 1;

            for (int xp = x0; xp < x1; xp++) {
                int xr = xrow[xp] - 1;
                double xv = xval[xp];
                atomicAdd(&k[k0 + xr], xv * sv);  // Use atomicAdd for safe concurrent updates
            }
        }
        sc += blockDim.x * gridDim.x;
    }
}