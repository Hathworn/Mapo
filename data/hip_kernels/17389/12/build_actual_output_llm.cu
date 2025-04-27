#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void build_actual_output(int *output, int n_rows, int k, const int *idx_labels, const int64_t *indices) {
    int element = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Early exit for out-of-bounds threads
    if (element < n_rows * k) {
        int ind = indices[element];
        output[element] = idx_labels[ind];
    }
}