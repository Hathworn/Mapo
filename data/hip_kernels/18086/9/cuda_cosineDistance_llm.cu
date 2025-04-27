#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_cosineDistance(double *x, double *y, int64_t len, double *dot_product, double *norm_x, double *norm_y) 
{
    int64_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    int64_t cacheIdx = threadIdx.x;

    __shared__ double dot_cache[threadsPerBlock];
    __shared__ double norm_x_cache[threadsPerBlock];
    __shared__ double norm_y_cache[threadsPerBlock];

    double dot_tmp = 0;
    double norm_x_tmp = 0;
    double norm_y_tmp = 0;

    // Load data into cache
    while (idx < len) {
        dot_tmp += x[idx] * y[idx];
        norm_x_tmp += x[idx] * x[idx];
        norm_y_tmp += y[idx] * y[idx];
        idx += blockDim.x * gridDim.x;
    }
    
    dot_cache[cacheIdx] = dot_tmp;
    norm_x_cache[cacheIdx] = norm_x_tmp;
    norm_y_cache[cacheIdx] = norm_y_tmp;
    __syncthreads();

    // Reduce cache using warp shuffling
    for (int offset = warpSize / 2; offset > 0; offset /= 2) {
        dot_tmp += __shfl_down_sync(0xFFFFFFFF, dot_tmp, offset);
        norm_x_tmp += __shfl_down_sync(0xFFFFFFFF, norm_x_tmp, offset);
        norm_y_tmp += __shfl_down_sync(0xFFFFFFFF, norm_y_tmp, offset);
    }

    if (cacheIdx % warpSize == 0) {
        atomicAdd(&dot_product[blockIdx.x], dot_tmp);
        atomicAdd(&norm_x[blockIdx.x], norm_x_tmp);
        atomicAdd(&norm_y[blockIdx.x], norm_y_tmp);
    }
}