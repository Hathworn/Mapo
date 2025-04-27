#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int translate_idx_inv( int ii, int d1, int d2, int d3, int scale_factor, int off_x, int off_y) {
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

__device__ __forceinline__ size_t idx(const size_t nc, const size_t height, const size_t width, const size_t y, const size_t x) {
    return (nc * height + y) * width + x;
}

__global__ void downscale(float *gradInput_data, const float *gradOutput_data, long no_elements, int scale_factor, int d1, int d2, int d3) {
    long ii = threadIdx.x + blockDim.x * blockIdx.x;
    ii += threadIdx.y + blockDim.y * (blockDim.x * gridDim.x) * blockIdx.y;
    if (ii >= no_elements) return;
    
    // Precompute new d2 and d3 to avoid redundant calculations in the loop
    int d2_scaled = d2 * scale_factor;
    int d3_scaled = d3 * scale_factor;

    // Use shared memory to store gradOutput_data parts if required for further optimization
    __shared__ float shared_gradOutput[BLOCK_SIZE]; // Example: Define BLOCK_SIZE depending on application

    for (int i = 0; i < scale_factor; i++) {
        for(int j = 0; j < scale_factor; j++) {
            int ipidx = translate_idx_inv(ii, d1, d2_scaled, d3_scaled, scale_factor, i, j);
            // Optionally load into shared memory
            // shared_gradOutput[threadIdx.x] = gradOutput_data[ipidx];
            // __syncthreads();

            // Then use shared memory in operations
            gradInput_data[ii] += gradOutput_data[ipidx];
            // gradInput_data[ii] += shared_gradOutput[threadIdx.x];
        }
    }
}