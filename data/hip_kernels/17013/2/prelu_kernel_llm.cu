#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void prelu_kernel(const float *input, float *output, int num_elem, int input_size, int fm_size, const float* gamma) {

    int idx = threadIdx.x + blockDim.x * blockIdx.x;

    // Ensure index is within bounds
    if (idx < num_elem) {

        // Pre-compute channel index
        int c = (idx % input_size) / fm_size;

        // Simplify condition and avoid branch
        float val = input[idx];
        output[idx] = (val >= 0.0f) ? val : val * gamma[c];
    }
}