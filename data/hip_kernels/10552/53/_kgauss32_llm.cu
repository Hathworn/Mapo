#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _kgauss32(int mx, int ns, float *xval, int *xrow, int *xcol, float *sval, int *srow, int *scol, float g, float *k) {
    // Use shared memory if necessary and unroll loops for better performance
    extern __shared__ float sharedSval[];

    int sc = threadIdx.x + blockIdx.x * blockDim.x;
    int tid = threadIdx.x;
    int offset = blockDim.x * gridDim.x;

    while (sc < ns) {  // sc: 0-based column for s
        int s0 = scol[sc] - 1;
        int s1 = scol[sc + 1] - 1;
        
        // Load s values into shared memory for faster access
        for (int sp = s0 + tid; sp < s1; sp += blockDim.x) {
            sharedSval[sp - s0] = sval[sp];
        }
        __syncthreads();

        for (int sp = s0; sp < s1; sp++) {
            int sr = srow[sp] - 1;
            float sv = sharedSval[sp - s0];  // Using shared memory

            int xc = sr;
            int x0 = xcol[xc] - 1;
            int x1 = xcol[xc + 1] - 1;

            for (int xp = x0; xp < x1; xp++) {
                int xr = xrow[xp] - 1;
                float xv = xval[xp];
                float xs = xv - sv;

                atomicAdd(&k[mx * sc + xr], xs * xs);  // Use atomicAdd to prevent race conditions
            }
        }

        __syncthreads();

        // Update k array with exponential function
        for (int kp = tid; kp < mx; kp += blockDim.x) {
            int kIdx = mx * sc + kp;
            k[kIdx] = exp(-g * k[kIdx]);
        }
        sc += offset;
    }
}