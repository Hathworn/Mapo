#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void build_actual_output(int *output, int n_rows, int k, const int *idx_labels, const int64_t *indices) {
    int element = threadIdx.x + blockDim.x * blockIdx.x;
    int total_elements = n_rows * k;
  
    // Use grid-stride loop for better utilization of all threads
    for (; element < total_elements; element += blockDim.x * gridDim.x) {
        int ind = (int)indices[element];
        output[element] = idx_labels[ind];
    }
}