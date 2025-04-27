#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *input, float *output, int *indexes)
{
    int h = (in_h + pad - size) / stride + 1;
    int w = (in_w + pad - size) / stride + 1;
    int c = in_c;

    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    // Pre-calculate offsets for repeated ID index divisions
    int temp_id = id;
    int j = temp_id % w; temp_id /= w;
    int i = temp_id % h; temp_id /= h;
    int k = temp_id % c; temp_id /= c;
    int b = temp_id;

    int w_offset = -pad / 2;
    int h_offset = -pad / 2;

    int out_index = j + w * (i + h * (k + c * b));
    float max = -INFINITY;
    int max_i = -1;

    // Prefetch input dimensions to minimize register pressure within loop
    int input_w = in_w;
    int input_h = in_h;
    int input_c = in_c;

    // Use flattened loops for better warp utilization
    for (int l_m = 0; l_m < size * size; ++l_m) {
        int l = l_m / size;
        int m = l_m % size;
        int cur_h = h_offset + i * stride + l;
        int cur_w = w_offset + j * stride + m;
        int index = cur_w + input_w * (cur_h + input_h * (k + b * input_c));
        
        // Conditional check in one line for clarity and efficiency
        int valid = (cur_h >= 0 && cur_h < input_h && cur_w >= 0 && cur_w < input_w);
        
        float val = valid ? input[index] : -INFINITY;
        if (val > max) {
            max = val;
            max_i = index;
        }
    }
    output[out_index] = max;
    indexes[out_index] = max_i;
}