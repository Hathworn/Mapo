#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeOutput(const int num_elements, const int* __restrict__ original, int64_t* __restrict__ to_normalize, int64_t batch_index, int64_t class_index) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop over elements using stride to ensure all elements are processed
    for (; idx < num_elements; idx += blockDim.x * gridDim.x) {
        // Access memory by stride and store normalized values
        to_normalize[idx * 3] = batch_index;
        to_normalize[idx * 3 + 1] = class_index;
        to_normalize[idx * 3 + 2] = static_cast<int64_t>(original[idx]);
    }
}