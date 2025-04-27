#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    int i;
    float sum = 0;
    float largest = -INFINITY;
    for(i = 0; i < n; ++i){
        float val = input[i*stride];
        largest = (val > largest) ? val : largest;
    }
    for(i = 0; i < n; ++i){
        float e = expf(input[i*stride]/temp - largest/temp);
        sum += e;
        output[i*stride] = e;
    }
    for(i = 0; i < n; ++i){
        output[i*stride] /= sum;
    }
}

__global__ void softmax_tree_kernel(float *input, int spatial, int batch, int stride, float temp, float *output, int groups, int *group_size, int *group_offset)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int total_threads = gridDim.x * blockDim.x;  // Compute total threads

    while (id < spatial * batch * groups) {  // Iterate over necessary elements
        int s = id % spatial;
        int group_idx = id / spatial;
        int g = group_idx % groups;
        int b = group_idx / groups;
        int goff = group_offset[g] * spatial;
        int boff = b * stride;
        
        // Invoke softmax_device for the specific group and batch
        softmax_device(input + goff + boff + s, group_size[g], temp, spatial, output + goff + boff + s);
        
        id += total_threads;  // Move to the next set of elements for this thread
    }
}