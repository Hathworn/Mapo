#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void device_mse ()
{
    __shared__ double partial_mse[REDUC_THREADS];
    int index = threadIdx.x;
    unsigned int n = d_ncases * d_ntarg;

    double sum_mse = 0.0;
    for (int i = blockIdx.x * blockDim.x + index; i < n; i += blockDim.x * gridDim.x) {
        double diff = d_output[i] - d_targets[i];
        sum_mse += diff * diff;
    }

    partial_mse[index] = sum_mse;
    __syncthreads();

    // Efficient reduction using unrolled loop
    for (int i = blockDim.x >> 1; i > 32; i >>= 1) {
        if (index < i) {
            partial_mse[index] += partial_mse[index + i];
        }
        __syncthreads();
    }

    // Unrolling the last warp
    if (index < 32) {
        volatile double* vsm = partial_mse;
        vsm[index] += vsm[index + 32];
        vsm[index] += vsm[index + 16];
        vsm[index] += vsm[index + 8];
        vsm[index] += vsm[index + 4];
        vsm[index] += vsm[index + 2];
        vsm[index] += vsm[index + 1];
    }

    if (index == 0) {
        d_mse_out[blockIdx.x] = partial_mse[0];
    }
}