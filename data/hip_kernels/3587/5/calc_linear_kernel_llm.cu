#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void calc_linear_kernel(int objs, int coords, double* x, double* out) {
    int id = blockDim.x * blockIdx.x + threadIdx.x;
    int i = id / objs;
    int j = id % objs;

    if (i < objs) {
        double r = 0.0;

        // Use shared memory to reduce global memory access latency
        extern __shared__ double shared_x[];
        for (int k = threadIdx.x; k < coords * objs; k += blockDim.x) {
            shared_x[k] = x[k];
        }
        __syncthreads();

        for (int k = 0; k < coords; k++) {
            r += shared_x[objs * k + i] * shared_x[objs * k + j];
        }

        out[objs * i + j] = r;
    }
}