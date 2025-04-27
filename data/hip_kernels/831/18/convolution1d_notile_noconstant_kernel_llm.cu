#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convolution1d_notile_noconstant_kernel(int *In, int *Out) {
    unsigned int index = blockIdx.x * blockDim.x + threadIdx.x; // Index 1d iterator.
    
    // Early return if index is out of bound
    if (index >= N_elements) return; 
    
    int Value = 0;
    int N_start_point = index - (Mask_size / 2);
    
    for (int j = 0; j < Mask_size; j++) {
        int neighborIndex = N_start_point + j;

        // Load element only if it's within bounds, also hoisting boundary check
        if (neighborIndex >= 0 && neighborIndex < N_elements) {
            Value += In[neighborIndex] * Global_Mask[j];
        }
    }
    
    Out[index] = Value;
}