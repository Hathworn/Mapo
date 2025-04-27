#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *input, float *output, int *indexes)
{
    // Calculate height and width of the output
    int h = (in_h + pad - size)/stride + 1;
    int w = (in_w + pad - size)/stride + 1;
    int c = in_c;

    // Calculate global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    int j = (id / 1) % w;
    int i = (id / w) % h;
    int k = (id / (w * h)) % c;
    int b = id / (w * h * c);

    int w_offset = -pad/2;
    int h_offset = -pad/2;

    // Calculate the output index
    int out_index = j + w*(i + h*(k + c*b));
    float max = -INFINITY;
    int max_i = -1;

    // Reduce loop overhead by precomputing boundary checks once
    int start_h = max(0, h_offset + i * stride);
    int end_h = min(in_h, h_offset + i * stride + size);
    int start_w = max(0, w_offset + j * stride);
    int end_w = min(in_w, w_offset + j * stride + size);

    // Iterating through the pool window
    for(int l = start_h; l < end_h; ++l) {
        for(int m = start_w; m < end_w; ++m) {
            int index = m + in_w*(l + in_h*(k + b*in_c));
            float val = input[index];
            if(val > max) {
                max = val;
                max_i = index;
            }
        }
    }
    output[out_index] = max;
    indexes[out_index] = max_i;
}