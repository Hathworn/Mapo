#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _A_mul_Bs_32(int mx, int ns, float *x, float *sval, int *srow, int *scol, float *k) {
    int sc = threadIdx.x + blockIdx.x * blockDim.x;

    // Pre-calculate the stride to avoid recalculation in while loop
    int stride = blockDim.x * gridDim.x;

    while (sc < ns) {
        int k0 = mx * sc;      // Start index for k[:,sc]
        int s0 = scol[sc] - 1; // Start index for s[:,sc]
        int s1 = scol[sc + 1] - 1; // End index for s[:,sc], exclusive

        // Initialize k[:,sc] to zero more efficiently
        for (int kp = 0; kp < mx; ++kp) {
            k[k0 + kp] = 0.0f;
        }

        // Perform the sparse matrix-vector multiplication
        for (int sp = s0; sp < s1; ++sp) {
            int sr = srow[sp] - 1; // Convert to 0-based indexing
            float sv = sval[sp];
            int x0 = mx * sr; // Start index for x[:,sr]

            // Perform the vector operations inside the loop
            for (int xr = 0; xr < mx; ++xr) {
                float xv = x[x0 + xr];
                k[k0 + xr] += xv * sv;
            }
        }

        // Move to the next sc index using pre-calculated stride
        sc += stride;
    }
}