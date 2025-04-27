#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sga_right_forward(const int n, const float *filters, const int height, const int width, const int depth, const int wsize, float *top_data){

    // Calculate the index of the thread
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds
    if (index >= n) {
        return;
    }

    int step = height * width;
    int base = index / height * step * depth + (index % height) * width;
    int fbase = index / height * step * wsize + (index % height) * width;

    // Loop over columns
    for (int col = 0; col < width; col++) {
        int shift = fbase + col;

        // Loop over depth
        for (int d = 0; d < depth; d++) {
            float temp = 0;
            int location = base + d * step + col;

            // Sum up the contributions
            temp += top_data[location] * filters[shift];
            temp += top_data[col - 1 >= 0 ? location - 1 : location] * filters[shift + step];
            temp += top_data[col - 2 >= 0 ? location - 2 : location] * filters[shift + 2 * step];
            temp += top_data[(col - 1 >= 0 && d - 1 >= 0) ? location - 1 - step : location] * filters[shift + 3 * step];
            temp += top_data[(col - 1 >= 0 && d + 1 < depth) ? location - 1 + step : location] * filters[shift + 4 * step];

            // Store the result
            top_data[location] = temp;
        }
    }
}