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

__global__ void downscale(float *gradInput_data, const float *gradOutput_data, long no_elements, int scale_factor, int d1, int d2, int d3) {
    long ii = threadIdx.x + blockDim.x * blockIdx.x;
    ii += threadIdx.y * (blockDim.x * gridDim.x);
    
    // Exit if the thread index exceeds the number of elements
    if (ii >= no_elements) return;

    // Use registers for storing scale_factor squared to avoid repeated calculations
    int scale_factor_sq = scale_factor * scale_factor;
    
    // Calculate the starting index for input data
    int ipidx_base = translate_idx_inv(ii, d1, d2, d3, scale_factor, 0, 0);

    // Initialize the temporary storage outside the loop
    float temp_sum = 0.0f;

    // Loop unrolling for better performance
    #pragma unroll
    for (int i = 0; i < scale_factor; i++) {
        #pragma unroll
        for (int j = 0; j < scale_factor; j++) {
            int ipidx = ipidx_base + i * d3 * scale_factor + j;
            temp_sum += gradOutput_data[ipidx];
        }
    }

    // Assign the result back to the global memory
    gradInput_data[ii] = temp_sum / scale_factor_sq;
}