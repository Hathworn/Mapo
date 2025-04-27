#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _kgauss64d(int nx, int ns, int nd, double *x, double *s, double *k, double g) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int n = nx * ns;

    // Use shared memory to avoid redundant global memory loads
    extern __shared__ double shared_mem[];
    double *shared_s = shared_mem;

    while (i < n) {
        int xj = (i % nx) * nd;
        int sj_base = (i / nx) * nd;

        // Load `s` values into shared memory
        for (int j = 0; j < nd; j++) {
            shared_s[threadIdx.x * nd + j] = s[sj_base + j];
        }
        __syncthreads();

        double dd = 0.0;
        for (int j = 0; j < nd; j++) {
            double d = x[xj + j] - shared_s[threadIdx.x * nd + j];
            dd += d * d;
        }

        k[i] = exp(-g * dd);
        i += blockDim.x * gridDim.x;
        __syncthreads();
    }
}