#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    // Determine which channel and batch this thread is processing
    int batch_index = id / c;
    int channel_index = id % c;

    // Initialize sum for averaging
    float sum = 0.0f;
    int num_elements = w * h;

    // Compute input and output indices
    int out_index = channel_index + c * batch_index;
    int base_in_index = batch_index * c * num_elements + channel_index * num_elements;

    // Accumulate sum for the area
    for (int i = 0; i < num_elements; ++i) {
        sum += input[base_in_index + i];
    }

    // Store the average value in the output array
    output[out_index] = sum / num_elements;
}