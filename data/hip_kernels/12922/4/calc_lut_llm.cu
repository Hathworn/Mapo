#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calc_lut(int *lut, int *hist_in, int img_size, int nbr_bin) {
    __shared__ int shared_hist[256];
    __shared__ int cdf[256];

    // Load data into shared memory
    shared_hist[threadIdx.x] = hist_in[threadIdx.x];
    __syncthreads();

    // Calculate minimum non-zero value
    int i = 0, min = 0, d;
    while (min == 0 && i < 256) {
        min = shared_hist[i++];
    }
    d = img_size - min;

    // Prefix sum (CDF calculation)
    for (unsigned int stride = 1; stride < 256; stride *= 2) {
        if (threadIdx.x >= stride) {
            shared_hist[threadIdx.x] += shared_hist[threadIdx.x - stride];
        }
        __syncthreads();
    }

    cdf[threadIdx.x] = shared_hist[threadIdx.x];
    __syncthreads();

    // Compute LUT value
    lut[threadIdx.x] = (int)(((float)cdf[threadIdx.x] - min) * (nbr_bin - 1) / d + 0.5);
    if (lut[threadIdx.x] < 0) {
        lut[threadIdx.x] = 0;
    }
}