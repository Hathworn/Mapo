#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_kernel(float *x, int n, int w, int h, int c, int size, float rate, float *delta)
{
    // Calculate global thread ID.
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x; 
    if(id >= n) return;

    // Compute indices for dimensions.
    int j = id % w;
    int i = (id / w) % h;
    int k = (id / (w * h)) % c;
    int b = id / (w * h * c);

    int w_offset = -(size / 2);
    int h_offset = -(size / 2);

    int out_index = j + w * (i + h * (k + c * b));

    // Inlined offset calculation and reduced condition checks.
    for(int l = 0; l < size; ++l) {
        int cur_h = h_offset + i + l;
        if(cur_h < 0 || cur_h >= h) continue; // Skip when out of bounds.

        for(int m = 0; m < size; ++m) {
            int cur_w = w_offset + j + m;
            if(cur_w < 0 || cur_w >= w) continue; // Skip when out of bounds.
            
            int index = cur_w + w * (cur_h + h * (k + b * c));
            delta[out_index] += rate * (x[index] - x[out_index]);
        }
    }
}