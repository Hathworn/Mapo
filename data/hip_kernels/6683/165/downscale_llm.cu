#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int translate_idx_inv(int ii, int d1, int d2, int d3, int scale_factor, int off_x, int off_y) {
    int x, y, z, w;
    w = ii % d3;
    ii = ii / d3;
    z = ii % d2;
    ii = ii / d2;
    y = ii % d1;
    ii = ii / d1;
    x = ii;
    w = w * scale_factor + off_x;
    z = z * scale_factor + off_y;
    d2 *= scale_factor;
    d3 *= scale_factor;
    return (((x * d1 + y) * d2) + z) * d3 + w;
}

__device__ int translate_idx(int ii, int d1, int d2, int d3, int scale_factor) {
    int x, y, z, w;
    w = ii % d3;
    ii = ii / d3;
    z = ii % d2;
    ii = ii / d2;
    y = ii % d1;
    ii = ii / d1;
    x = ii;
    w = w / scale_factor;
    z = z / scale_factor;
    d2 /= scale_factor;
    d3 /= scale_factor;
    return (((x * d1 + y) * d2) + z) * d3 + w;
}

__global__ void downscale(float* __restrict__ gradInput_data, const float* __restrict__ gradOutput_data, long no_elements, int scale_factor, int d1, int d2, int d3) {
    long ii = threadIdx.x + blockDim.x * blockIdx.x + (threadIdx.y + blockDim.y * blockIdx.y) * (blockDim.x * gridDim.x);
    if (ii >= no_elements) return;

    // Using shared memory to reduce global memory accesses
    __shared__ float cache[1024]; // Cache for accumulating results
    cache[threadIdx.y * blockDim.x + threadIdx.x] = 0.0f;

    for (int i = 0; i < scale_factor; i++) {
        for (int j = 0; j < scale_factor; j++) {
            int ipidx = translate_idx_inv(ii, d1, d2, d3, scale_factor, i, j);
            cache[threadIdx.y * blockDim.x + threadIdx.x] += gradOutput_data[ipidx];
        }
    }

    // Synchronize threads to ensure all additions to cache are complete
    __syncthreads();

    // Write accumulated result to global memory
    gradInput_data[ii] = cache[threadIdx.y * blockDim.x + threadIdx.x];
}