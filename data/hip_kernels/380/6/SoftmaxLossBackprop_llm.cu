#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void SoftmaxLossBackprop(const int* label, int num_labels, int batch_size, float* diffData)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < batch_size)  // Simplified condition check
    {
        const int label_value = label[idx];
        diffData[idx * num_labels + label_value] -= 1.0f;
    }
}