#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void device_ll() {
    __shared__ double partial_ll[REDUC_THREADS];
    int index = threadIdx.x;
    int n = d_ncases;
    int ntarg = d_ntarg;
    double sum_ll = 0.0;

    // Optimize loop stride calculation
    int stride = blockDim.x * gridDim.x;
    for (int i = blockIdx.x * blockDim.x + index; i < n; i += stride) {
        sum_ll -= log(d_output[i * ntarg + d_class[i]] + 1.e-30);
    }

    partial_ll[index] = sum_ll;
    __syncthreads();

    // Unroll reduction loop for improved performance
    for (int i = blockDim.x >> 1; i > 0; i >>= 1) {
        if (index < i) {
            partial_ll[index] += partial_ll[index + i];
        }
        __syncthreads();
    }

    if (index == 0) {
        d_mse_out[blockIdx.x] = partial_ll[0];
    }
}