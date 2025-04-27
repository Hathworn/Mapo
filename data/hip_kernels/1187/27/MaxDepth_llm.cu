#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MaxDepth (const int n, const float *bottom_data, const int step, const int depth, float *idx){

    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= n)
    {
        return;
    }
    
    int base = index / step * step * depth + index % step;
    int k = 0;
    float max_val = bottom_data[base];

    // Use unrolling and shared memory to improve performance
    for (int i = 1; i < depth; i++)
    {
        float current_val = bottom_data[base + i * step];
        if (current_val > max_val)
        {
            max_val = current_val;
            k = i;
        }
    }
    
    idx[index] = k;
}