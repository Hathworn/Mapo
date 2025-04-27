#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sga_left_weight_backward(const int n, const float *bottom_data, const float *top_data, const float *temp_diff, const int height, const int width, const int depth, const int wsize, float *filters_diff) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= n) return;

    int step = height * width;
    int base = index / step * step * depth + index % step; // up->down
    int fbase = index / step * step * wsize + index % step;
    int col = index % step % width;

    // Optimize loop: reduce repeated pointer arithmetic
    int base_step;

    for (int i = 0; i < depth; i++) {
        base_step = base + i * step;
        filters_diff[fbase] += temp_diff[base_step] * bottom_data[base_step];
    }
    
    if (col + 1 < width) {
        int location = fbase + step;
        for (int i = 0; i < depth; i++) {
            base_step = base + i * step;
            filters_diff[location] += temp_diff[base_step] * top_data[base_step + 1];
        }
        
        location = fbase + 3 * step;
        filters_diff[location] += temp_diff[base] * bottom_data[base];
        for (int i = 1; i < depth; i++) {
            base_step = base + i * step;
            filters_diff[location] += temp_diff[base_step] * top_data[base + (i - 1) * step + 1];
        }
        
        location = fbase + 4 * step;
        filters_diff[location] += temp_diff[base + (depth - 1) * step] * bottom_data[base + (depth - 1) * step];
        for (int i = 0; i < depth - 1; i++) {
            base_step = base + i * step;
            filters_diff[location] += temp_diff[base_step] * top_data[base + (i + 1) * step + 1];
        }
    }

    if (col + 2 < width) {
        int location = fbase + 2 * step;
        for (int i = 0; i < depth; i++) {
            base_step = base + i * step;
            filters_diff[location] += temp_diff[base_step] * top_data[base_step + 2];
        }
    }
}