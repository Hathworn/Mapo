#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sga_down_weight_backward(const int n, const float *bottom_data, const float *top_data, const float *temp_diff, const int height, const int width, const int depth, const int wsize, float *filters_diff) {

    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= n) {
        return;
    }

    int step = height * width;
    int base = index / step * step * depth + index % step;
    int fbase = index / step * step * wsize + index % step;
    int row = index % step / width;

    // Unroll loop to improve performance
    for (int i = 0; i < depth; i++) {
        int offset = base + i * step;
        float tmp_diff_val = temp_diff[offset];
        filters_diff[fbase] += tmp_diff_val * bottom_data[offset];
    }

    if (row - 1 >= 0) {
        int location_step = fbase + step;
        for (int i = 0; i < depth; i++) {
            int offset = base + i * step;
            filters_diff[location_step] += temp_diff[offset] * top_data[offset - width];
        }

        int location_3step = fbase + 3 * step;
        filters_diff[location_3step] += temp_diff[base] * bottom_data[base];
        for (int i = 1; i < depth; i++) {
            int offset = base + i * step;
            filters_diff[location_3step] += temp_diff[offset] * top_data[base + (i - 1) * step - width];
        }

        int location_4step = fbase + 4 * step;
        int last_offset = base + (depth - 1) * step;
        filters_diff[location_4step] += temp_diff[last_offset] * bottom_data[last_offset];
        for (int i = 0; i < depth - 1; i++) {
            int offset = base + i * step;
            filters_diff[location_4step] += temp_diff[offset] * top_data[base + (i + 1) * step - width];
        }
    }

    if (row - 2 >= 0) {
        int location_2step = fbase + 2 * step;
        for (int i = 0; i < depth; i++) {
            int offset = base + i * step;
            filters_diff[location_2step] += temp_diff[offset] * top_data[offset - 2 * width];
        }
    }
}