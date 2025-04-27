#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *input, float *output, int *indexes)
{
    // Calculate the output dimensions
    int h = (in_h + 2*pad) / stride;
    int w = (in_w + 2*pad) / stride;
    int c = in_c;

    // Compute the unique global index for each thread
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    // Compute the mapping from flat index to 5D indices
    int j = id % w;
    int i = (id / w) % h;
    int k = (id / (w * h)) % c;
    int b = id / (w * h * c);

    int w_offset = -pad;
    int h_offset = -pad;

    // Initialize the maximum value to negative infinity and index to -1
    int out_index = j + w*(i + h*(k + c*b));
    float max = -INFINITY;
    int max_i = -1;

    // Loop over the pooling window to find the maximum value
    for(int l = 0; l < size; ++l) {
        for(int m = 0; m < size; ++m){
            int cur_h = h_offset + i*stride + l;
            int cur_w = w_offset + j*stride + m;
            int index = cur_w + in_w*(cur_h + in_h*(k + b*in_c));
            // Check if current position is valid within input dimensions
            bool valid = (cur_h >= 0 && cur_h < in_h && cur_w >= 0 && cur_w < in_w);
            float val = valid ? input[index] : -INFINITY;
            // Update max value and index when a new maximum is found
            if (val > max) {
                max = val;
                max_i = index;
            }
        }
    }
    
    // Store the maximum value and its index in the output and indexes arrays
    output[out_index] = max;
    indexes[out_index] = max_i;
}