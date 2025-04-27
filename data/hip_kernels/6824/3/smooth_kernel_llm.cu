#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_kernel(float *x, int n, int w, int h, int c, int size, float rate, float *delta)
{
    // Compute unique global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    // Derive indices from global thread index
    int j = id % w;
    int i = (id / w) % h;
    int k = (id / (w * h)) % c;
    int b = id / (w * h * c);

    int out_index = j + w * (i + h * (k + c * b));
    float delta_value = 0.0f; // Accumulate delta

    for(int l = 0; l < size; ++l){
        int cur_h = (i - size / 2) + l;
        if (cur_h >= 0 && cur_h < h) { // Check height bounds
            for(int m = 0; m < size; ++m){
                int cur_w = (j - size / 2) + m;
                if (cur_w >= 0 && cur_w < w) { // Check width bounds
                    int index = cur_w + w * (cur_h + h * (k + b * c));
                    delta_value += rate * (x[index] - x[out_index]);
                }
            }
        }
    }
    
    delta[out_index] = delta_value; // Store result
}