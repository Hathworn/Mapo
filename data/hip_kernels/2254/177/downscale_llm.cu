#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int translate_idx_inv( int ii, int d1, int d2, int d3, int scale_factor, int off_x, int off_y) {
    int x, y, z, w;
    w = ii % d3;
    ii = ii/d3;
    z = ii % d2;
    ii = ii/d2;
    y = ii % d1;
    ii = ii/d1;
    x = ii;
    w = w*scale_factor+off_x;
    z = z*scale_factor+off_y;
    d2 *= scale_factor;
    d3 *= scale_factor;
    return (((x*d1+y)*d2)+z)*d3+w;
}

__device__ int translate_idx(int ii, int d1, int d2, int d3, int scale_factor) {
    int x, y, z, w;
    w = ii % d3;
    ii = ii/d3;
    z = ii % d2;
    ii = ii/d2;
    y = ii % d1;
    ii = ii/d1;
    x = ii;
    w = w/scale_factor;
    z = z/scale_factor;
    d2 /= scale_factor;
    d3 /= scale_factor;
    return (((x*d1+y)*d2)+z)*d3+w;
}

__device__ __forceinline__ size_t idx(const size_t nc, const size_t height, const size_t width, const size_t y, const size_t x) {
    return (nc * height + y) * width + x;
}

__global__ void downscale(float *gradInput_data, const float *gradOutput_data, long no_elements, int scale_factor, int d1, int d2, int d3) {
    // Calculate unique thread index
    long ii = threadIdx.x + blockDim.x * (threadIdx.y + blockDim.y * blockIdx.y * gridDim.y);

    // Ensure thread index is within array bounds
    if (ii >= no_elements) return;

    // Use shared memory to reduce memory latency
    extern __shared__ float shared_gradOutput[];

    // Load data into shared memory: Use a single loop to avoid redundancy
    for (int i = 0; i < scale_factor * scale_factor; i++) {
        int off_x = i % scale_factor;
        int off_y = i / scale_factor;
        int ipidx = translate_idx_inv(ii, d1, d2, d3, scale_factor, off_x, off_y);
        shared_gradOutput[i] = gradOutput_data[ipidx];
    }

    __syncthreads(); // Synchronize threads to ensure shared memory is populated

    // Sum up the contributions from the scaled positions
    for (int i = 0; i < scale_factor * scale_factor; i++) {
        gradInput_data[ii] += shared_gradOutput[i];
    }
}