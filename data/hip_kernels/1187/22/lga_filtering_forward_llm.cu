#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void lga_filtering_forward(const int n, const float *bottom_data, const float *filters, const int height, const int width, const int channel, const int radius, float *top_data) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread is within valid range
    if (index >= n) {
        return;
    }

    // Calculate necessary variables and offsets
    int step = height * width;
    int wsize = 2 * radius + 1;
    int fbase = index / (step * channel) * (step * wsize * wsize * 3) + index % step;
    int row = index % step / width;
    int col = index % width;
    int depth = index / step % channel;

    // Loop unrolling for efficiency
    #pragma unroll
    for (int d = -1; d <= 1; d++) {
        int dd = d + depth;
        if (dd < 0 || dd >= channel) continue;
        
        for (int r = -radius; r <= radius; r++) {
            int rr = r + row;
            if (rr < 0 || rr >= height) continue;

            for (int c = -radius; c <= radius; c++) {
                int cc = c + col;
                if (cc < 0 || cc >= width) continue;

                int shift = r * width + c + d * step;
                int location = (d + 1) * (wsize * wsize) + (r + radius) * wsize + c + radius;
                top_data[index] += bottom_data[index + shift] * filters[fbase + location * step];
            }
        }
    }
}