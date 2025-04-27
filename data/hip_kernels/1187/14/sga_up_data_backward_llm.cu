#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sga_up_data_backward (const int n, const float *filters, float *top_diff, const int height, const int width, const int depth, const int wsize, float *bottom_diff) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= n) {
        return;
    }
    int step = height * width;
    int base = index / width * step * depth + index % width; // up->down
    int fbase = index / width * step * wsize + index % width;

    // Using shared memory for filters to reduce global memory accesses
    extern __shared__ float s_filters[];
    for (int row = threadIdx.y; row < height; row += blockDim.y) {
        int shift = fbase + row * width;
        s_filters[threadIdx.y * width + threadIdx.x] = filters[shift];
        __syncthreads();

        for (int d = 0; d < depth; d++) {
            int location = base + d * step + row * width;
            float temp = top_diff[location];
            if (row - 1 >= 0)
                temp += top_diff[location - width] * s_filters[threadIdx.y * width + threadIdx.x - width + step];
            if (row - 2 >= 0)
                temp += top_diff[location - 2 * width] * s_filters[threadIdx.y * width + threadIdx.x - 2 * width + 2 * step];
            if (row - 1 >= 0 && d + 1 < depth)
                temp += top_diff[location - width + step] * s_filters[threadIdx.y * width + threadIdx.x - width + 3 * step];
            if (row - 1 >= 0 && d - 1 >= 0)
                temp += top_diff[location - width - step] * s_filters[threadIdx.y * width + threadIdx.x - width + 4 * step];
            top_diff[location] = temp;
            bottom_diff[location] += temp * s_filters[threadIdx.y * width + threadIdx.x];
        }
        __syncthreads();
    }

    for (int row = 0; row < height; row++) {
        int shift = fbase + row * width;
        int location = base + row * width;
        bottom_diff[location] += top_diff[location] * filters[shift + 3 * step];
        location += (depth - 1) * step;
        bottom_diff[location] += top_diff[location] * filters[shift + 4 * step];
    }
}