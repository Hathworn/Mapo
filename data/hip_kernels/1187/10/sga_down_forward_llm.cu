#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sga_down_forward(const int n, const float *filters, const int height, const int width, const int depth, const int wsize, float *top_data) {
    // Compute global index and check bounds
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= n) return;

    // Compute common variables
    int step = height * width;
    int base = (index / width) * step * depth + (index % width); // up->down
    int fbase = (index / width) * step * wsize + (index % width);

    // Iterate through each row
    for (int row = 0; row < height; row++) {
        int shift = fbase + row * width;

        // Iterate through each depth
        for (int d = 0; d < depth; d++) {
            float temp = 0;
            int location = base + d * step + row * width;

            // Apply filter logic using ternary operators for conciseness
            temp += top_data[location] * filters[shift];
            temp += (row - 1 >= 0 ? top_data[location - width] : top_data[location]) * filters[shift + step];
            temp += (row - 2 >= 0 ? top_data[location - 2 * width] : top_data[location]) * filters[shift + 2 * step];
            temp += (row - 1 >= 0 && d - 1 >= 0 ? top_data[location - width - step] : top_data[location]) * filters[shift + 3 * step];
            temp += (row - 1 >= 0 && d + 1 < depth ? top_data[location - width + step] : top_data[location]) * filters[shift + 4 * step];

            // Store the result back
            top_data[location] = temp;
        }
    }
}