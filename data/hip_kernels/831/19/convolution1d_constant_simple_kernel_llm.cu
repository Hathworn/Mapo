#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void convolution1d_constant_simple_kernel(int *In, int *Out){

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    __shared__ float N_ds[TILE_SIZE];
    N_ds[threadIdx.x] = (i < N_elements) ? In[i] : 0; // Load handling boundary
    __syncthreads();

    int N_start_point = i - (Mask_size / 2);
    int Pvalue = 0;
    
    // Unroll loop for better performance
    #pragma unroll
    for (int j = 0; j < Mask_size; j++) {
        int N_index = N_start_point + j;
        if (N_index >= 0 && N_index < N_elements) {
            Pvalue += ((blockIdx.x * blockDim.x <= N_index) && (N_index < (blockIdx.x + 1) * blockDim.x))
                      ? N_ds[threadIdx.x + j - (Mask_size / 2)] * Global_Mask[j]
                      : In[N_index] * Global_Mask[j];
        }
    }
    if (i < N_elements) { // Writing result only for valid indices
        Out[i] = Pvalue;
    }
}