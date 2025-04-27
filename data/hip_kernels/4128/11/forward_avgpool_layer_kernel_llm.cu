#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n * c) return;  // Simplified index calculation for combined (n, c) dimension

    int k = id % c;
    int b = id / c;  // Remove redundant division

    int out_index = k + c * b;
    float sum = 0.0f;  // Use local variable for summation

    // Use temporary variable to hold area size
    int area = w * h;
    int idx_offset = h * w * (k + b * c);
    for (int i = 0; i < area; ++i) {
        sum += input[i + idx_offset];  // Reduce repeated arithmetic
    }

    output[out_index] = sum / area;  // Assign computed average
}