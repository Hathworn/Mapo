#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSoftMaxGradCLS(float* mat, int* labels, float* indices, float* target, unsigned int width, unsigned int height) {
    // Calculate the global index for the current thread
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Pre-compute number of elements
    const unsigned int total_elements = width * height;
    // Loop over the elements this thread is responsible for, with a stride length equal to total threads
    for (unsigned int i = idx; i < total_elements; i += blockDim.x * gridDim.x) {
        // Compute the row index and check the condition directly
        const unsigned int row = i / width;
        const int label = labels[(int)indices[row]];
        // Direct write to target with conditional assignment
        target[i] = mat[i] - (label == row ? 1.0f : 0.0f);
    }
}