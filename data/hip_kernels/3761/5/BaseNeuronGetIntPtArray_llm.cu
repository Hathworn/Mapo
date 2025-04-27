#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BaseNeuronGetIntPtArray(int *arr1, int *arr2, int *pos, int n_elem, int step1, int step2)
{
    int array_idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (array_idx < n_elem) {
        int pos_idx = pos[array_idx]; // Cache position index for repeated access
        arr2[array_idx * step2] = arr1[pos_idx * step1];
    }
}