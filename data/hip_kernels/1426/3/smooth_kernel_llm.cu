#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void smooth_kernel(float *x, int n, int w, int h, int c, int size, float rate, float *delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    // Calculate multi-dimensional indices
    int j = id % w;
    int i = (id / w) % h;
    int k = (id / (w * h)) % c;
    int b = id / (w * h * c);
    
    int w_offset = -(size / 2);
    int h_offset = -(size / 2);

    int out_index = j + w * (i + h * (k + c * b));
    float delta_val = 0.0f; // Accumulate in a local variable

    // Unroll the loop for better performance
    #pragma unroll
    for(int l = 0; l < size; ++l) {
        int cur_h = h_offset + i + l;
        if(cur_h >= 0 && cur_h < h) { // Check height bounds once per row
            #pragma unroll
            for(int m = 0; m < size; ++m) {
                int cur_w = w_offset + j + m;
                if(cur_w >= 0 && cur_w < w) { // Check width bounds
                    int index = cur_w + w * (cur_h + h * (k + b * c));
                    delta_val += rate * (x[index] - x[out_index]);
                }
            }
        }
    }
    delta[out_index] = delta_val; // Assign accumulated value to global memory
}