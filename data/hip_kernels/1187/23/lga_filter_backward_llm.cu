#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void lga_filter_backward (const int n, const float *bottom_data, const float *top_diff, const int height, const int width, const int channel, const int radius, float *filter_diff) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    if (index < n) { // Combine condition to avoid unnecessary computation
        int step = height * width;
        int wsize = 2 * radius + 1;

        int base = index / (step * wsize * wsize * 3) * (step * channel) + index % step;
        int location = index / step % (wsize * wsize * 3);
        int d = location / (wsize * wsize) - 1;
        int r = (location / wsize) % wsize - radius;
        int c = location % wsize - radius;

        int rr = index % step / width + r;
        int cc = index % width + c;

        for (int i = 0; i < channel; i++) {
            int dd = i + d;
            int idx_shift = base + i * step; // Precompute repeated index calculation

            if (rr >= 0 && cc >= 0 && dd >= 0 && rr < height && cc < width && dd < channel) {
                int shift = r * width + c + d * step;
                filter_diff[index] += top_diff[idx_shift] * bottom_data[base + shift + i * step];
            } else {
                filter_diff[index] += top_diff[idx_shift] * bottom_data[idx_shift];
            }
        }
    }
}