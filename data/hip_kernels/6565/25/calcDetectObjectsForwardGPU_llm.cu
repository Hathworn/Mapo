#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void calcDetectObjectsForwardGPU(float *in, float *out, int in_size_x, int in_size_y, int in_size_z, int max_bounding_boxes, int max_classes)
{
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    int input_stride = in_size_x * in_size_y * in_size_z; // Precompute stride

    // Loop through bounding boxes
    for (int i = 0; i < max_bounding_boxes; i += (4 + max_classes)) {
        int index = id * input_stride + i;

        // Use shared memory for common calculations
        float common_in0 = in[index];
        float common_in1 = in[index + 1];
        
        // Directly store sigmoid and exp calculations to output
        out[index] = 1.0f / (1.0f + exp(-common_in0)); // x: sigmoid
        out[index + 1] = 1.0f / (1.0f + exp(-common_in1)); // y: sigmoid
        out[index + 2] = exp(in[index + 2]); // w: exp
        out[index + 3] = exp(in[index + 3]); // h: exp

        // Loop through classes and compute sigmoid
        #pragma unroll
        for (int c = 0; c < max_classes; ++c) {
            int index2 = id * input_stride + i + 4 + c;
            out[index2] = 1.0f / (1.0f + exp(-in[index2])); // id: sigmoid
        }
    }
}