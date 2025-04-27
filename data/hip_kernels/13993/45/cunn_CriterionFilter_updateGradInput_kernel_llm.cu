#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_CriterionFilter_updateGradInput_kernel( float *gradInput, float *target, float *ignored_label, int batch_size, int n_classes, int map_nelem, int blocks_per_sample)
{
    // Calculate sample and element indices using grid and block dimensions
    int sample = blockIdx.x / blocks_per_sample;
    int elementIndex = (blockIdx.x % blocks_per_sample) * blockDim.x + threadIdx.x;
    int toffset = sample * map_nelem;
    int ioffset = sample * map_nelem * n_classes;
    int ignored_label_num = (int)(ignored_label[0]);

    // Loop through the elements for the current thread with stride optimization
    while (elementIndex < map_nelem) {
        int t = (int)target[toffset + elementIndex];
        if (t == ignored_label_num) {
            // Inline loop for efficiency
            for (int j = 0; j < n_classes; j++) {
                gradInput[ioffset + j * map_nelem + elementIndex] = 0;
            }
        }
        // Advance to the next elementIndex handled by this thread
        elementIndex += blockDim.x * blocks_per_sample;
    }
}