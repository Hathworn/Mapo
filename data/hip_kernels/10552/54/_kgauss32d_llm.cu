#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _kgauss32d(int nx, int ns, int nd, float *x, float *s, float *k, float g) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int n = nx * ns;

    // Using shared memory to reduce global memory access
    extern __shared__ float shared_s[];
    if(threadIdx.x < nd) {
        shared_s[threadIdx.x] = s[threadIdx.x];
    }
    __syncthreads();

    while (i < n) {
        int xj = (i % nx) * nd;
        int sj = (i / nx) * nd;
        double dd = 0;

        // Use local registers to hold values to minimize memory access latency
        for (int j = 0; j < nd; j++) {
            float x_val = x[xj++];
            float s_val = shared_s[j];
            double d = x_val - s_val;
            dd += d * d;
        }
        
        k[i] = exp(-g * dd);
        i += blockDim.x * gridDim.x;
    }
}