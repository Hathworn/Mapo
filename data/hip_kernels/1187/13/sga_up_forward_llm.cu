```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sga_up_forward (const int n, const float *filters, const int height, const int width, const int depth, const int wsize, float *top_data){

    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (index >= n) {
        return;
    }

    int step = height * width;
    int base = (index / width) * step * depth + index % width;
    int fbase = (index / width) * step * wsize + index % width;

    for (int row = height - 1; row >= 0; row--) {
        int shift = fbase + row * width;
        for (int d = 0; d < depth; d++) {
            float temp = 0;
            int location = base + d * step + row * width;

            float top_val = top_data[location];
            float filter_shift_step = filters[shift + step];
            float filter_shift_2step = filters[shift + 2 * step];
            float filter_shift_3step = filters[shift + 3 * step];
            float filter_shift_4step = filters[shift + 4 * step];
            
            // Load current data point
            temp += top_val * filters[shift];

            // Optimize boundary check by using conditional operator
            temp += ((row + 1 < height) ? top_data[location + width] : top_val) * filter_shift_step;
            temp += ((row + 2 < height) ? top_data[location + 2 * width] : top_val) * filter_shift_2step;
            temp += ((row + 1 < height && d - 1 >= 0) ? top_data[location + width - step] : top_val) * filter_shift_3step;
            temp += ((row + 1 < height && d + 1 < depth) ? top_data[location + width + step] : top_val) * filter_shift_4step;

            // Store computed result back
            top_data[location] = temp;
        }
    }
}