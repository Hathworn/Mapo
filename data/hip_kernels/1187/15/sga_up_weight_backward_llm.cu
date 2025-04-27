#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sga_up_weight_backward (const int n, const float *bottom_data, const float *top_data, const float *temp_diff, const int height, const int width, const int depth, const int wsize, float *filters_diff) {

    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= n) {
        return;
    }

    int step = height * width;
    int base = index / step * step * depth + index % step;
    int fbase = index / step * step * wsize + index % step;
    int row = index % step / width;

    // Use shared memory for faster access patterns
    __shared__ float local_temp_diff[1024]; 
    __shared__ float local_bottom_data[1024];
    __shared__ float local_top_data[1024];

    if (threadIdx.x < step * depth) {
        local_temp_diff[threadIdx.x] = temp_diff[threadIdx.x];
        local_bottom_data[threadIdx.x] = bottom_data[threadIdx.x];
        local_top_data[threadIdx.x] = top_data[threadIdx.x];
    }
    __syncthreads();

    for (int i = 0; i < depth; i++) {
        filters_diff[fbase] += local_temp_diff[base + i * step] * local_bottom_data[base + i * step];
    }

    // Minimize index operation by pre-storing recurrent calculations
    if (row + 1 < height) {
        int location = fbase + step;
        for (int i = 0; i < depth; i++) {
            float temp_val = local_temp_diff[base + i * step];
            filters_diff[location] += temp_val * local_top_data[base + i * step + width];
            filters_diff[fbase + 3 * step] += temp_val * (i == 0 ? local_bottom_data[base] : local_top_data[base + (i - 1) * step + width]);
            filters_diff[fbase + 4 * step] += (i == depth - 1 ? temp_val * local_bottom_data[base + i * step] : temp_val * local_top_data[base + (i + 1) * step + width]);
        }
    }

    if (row + 2 < height) {
        int location = fbase + 2 * step;
        for (int i = 0; i < depth; i++) {
            filters_diff[location] += local_temp_diff[base + i * step] * local_top_data[base + i * step + 2 * width];
        }
    }
}