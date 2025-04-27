#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calc_lut(int *lut, int *hist_in, int img_size, int nbr_bin) {

    __shared__ int shared_hist[256];
    shared_hist[threadIdx.x] = hist_in[threadIdx.x];
    __syncthreads();

    int cdf = 0;
    int min = 0;
    int d;

    // Use atomic operation to find the minimum
    for (int i = 0; i < blockDim.x; i++) {
        atomicMin(&min, shared_hist[i]);
    }
    __syncthreads();

    if (min == 0) {
        return;  // Early exit if min is zero
    }

    d = img_size - min;

    // Compute prefix sum (CDF)
    for (int i = 0; i <= threadIdx.x; i++) {
        cdf += shared_hist[i];
    }

    // Calculate LUT value
    lut[threadIdx.x] = (int)(((float)cdf - min) * (nbr_bin - 1) / d + 0.5);

    // Ensure LUT value does not fall below zero
    if (lut[threadIdx.x] < 0) {
        lut[threadIdx.x] = 0;
    }
}