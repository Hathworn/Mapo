#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getMaxPorb(const int size, const float* class_prob, const int class_num, float* max_prob, int* idx, int *class_idx, const int conf_thresh)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if thread index is within bounds
    if (index >= size) return;

    // Compute memory offset once
    const float *start = class_prob + index * class_num;

    // Initialize max probability and class index
    float temp_max_prob = start[0];
    int class_index = 0;

    // Find max class probability and index
    for (int i = 1; i < class_num; i++)
    {
        float curr_prob = start[i];
        if (temp_max_prob < curr_prob)
        {
            class_index = i;
            temp_max_prob = curr_prob;
        }
    }

    // Store results with conditional threshold check
    if (temp_max_prob >= conf_thresh)
    {
        max_prob[index] = temp_max_prob;
    }
    else
    {
        max_prob[index] = 0.0f;
    }

    idx[index] = index;
    class_idx[index] = class_index;
}