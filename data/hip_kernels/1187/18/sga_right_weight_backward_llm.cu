#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sga_right_weight_backward(const int n, const float *bottom_data, const float *top_data, const float *temp_diff, const int height, const int width, const int depth, const int wsize, float *filters_diff) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= n) {
        return;
    }
    int step = height * width;
    int base = index / step * step * depth + index % step;
    int fbase = index / step * step * wsize + index % step;
    int col = index % step % width;

    // Use registers to reduce memory access latency
    const float *temp_diff_base = temp_diff + base;
    const float *bottom_data_base = bottom_data + base;
    for (int i = 0; i < depth; ++i) {
        filters_diff[fbase] += temp_diff_base[i * step] * bottom_data_base[i * step];
    }

    if (col - 1 >= 0) {
        int location = fbase + step;
        const float *top_data_offset1 = top_data + base - 1;
        for (int i = 0; i < depth; ++i) {
            filters_diff[location] += temp_diff_base[i * step] * top_data_offset1[i * step];
        }

        location = fbase + 3 * step;
        filters_diff[location] += temp_diff_base[0] * bottom_data_base[0];
        for (int i = 1; i < depth; ++i) {
            filters_diff[location] += temp_diff_base[i * step] * top_data_offset1[(i - 1) * step];
        }

        location = fbase + 4 * step;
        filters_diff[location] += temp_diff_base[(depth - 1) * step] * bottom_data_base[(depth - 1) * step];
        for (int i = 0; i < depth - 1; ++i) {
            filters_diff[location] += temp_diff_base[i * step] * top_data_offset1[(i + 1) * step];
        }
    }

    if (col - 2 >= 0) {
        int location = fbase + 2 * step;
        const float *top_data_offset2 = top_data + base - 2;
        for (int i = 0; i < depth; ++i) {
            filters_diff[location] += temp_diff_base[i * step] * top_data_offset2[i * step];
        }
    }
}