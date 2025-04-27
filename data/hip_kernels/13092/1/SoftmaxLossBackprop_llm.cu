#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SoftmaxLossBackprop(const float *label, int num_labels, int batch_size, float *diff) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Efficient boundary check
    if (idx < batch_size) {
        const int label_value = static_cast<int>(label[idx]);
        // Perform atomic operation to avoid race condition
        atomicSub(&diff[idx * num_labels + label_value], 1.0f);
    }
}