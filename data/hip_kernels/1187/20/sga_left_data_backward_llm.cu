#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sga_left_data_backward (const int n, const float *filters, float *top_diff, const int height, const int width, const int depth, const int wsize, float *bottom_diff){

    // Calculate the global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Exit if the index is out of bounds
    if (index >= n) {
        return;
    }

    // Calculate steps and bases
    int step = height * width;
    int base = index / height * step * depth + (index % height) * width;
    int fbase = index / height * step * wsize + (index % height) * width;

    // Iterate over each column
    for (int col = 0; col < width; col++) {
        int shift = fbase + col;

        // Iterate over each depth level
        for (int d = 0; d < depth; d++) {
            int location = base + d * step + col;
            float temp = top_diff[location];

            if (col - 1 >= 0)
                temp += top_diff[location - 1] * filters[shift - 1 + step];
            if (col - 2 >= 0)
                temp += top_diff[location - 2] * filters[shift - 2 + 2 * step];
            if (col - 1 >= 0 && d + 1 < depth)
                temp += top_diff[location - 1 + step] * filters[shift - 1 + 3 * step];
            if (col - 1 >= 0 && d - 1 >= 0)
                temp += top_diff[location - 1 - step] * filters[shift - 1 + 4 * step];

            // Update top_diff with the computed temp
            top_diff[location] = temp;

            // Compute and accumulate bottom_diff
            bottom_diff[location] += temp * filters[shift];
        }
    }

    // Post processing: iterate over each column again
    for (int col = 0; col < width; col++) {
        int shift = fbase + col;
        int location = base + col;
        bottom_diff[location] += top_diff[location] * filters[shift + 3 * step];
        location += (depth - 1) * step;
        bottom_diff[location] += top_diff[location] * filters[shift + 4 * step];
    }
}