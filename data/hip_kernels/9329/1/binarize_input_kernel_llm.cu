#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef CUDNN
#pragma comment(lib, "cudnn.lib")
#endif

extern "C" {
}

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    int s = blockIdx.x * blockDim.x + threadIdx.x;
    if (s >= size) return;

    // Optimize the mean calculation by reducing repeated index computations
    float mean = 0;
    int idx_base = s;
    for(int i = 0; i < n; ++i){
        mean += fabs(input[idx_base]);
        idx_base += size;
    }
    mean /= n;

    // Recompute base index and binarize
    idx_base = s;
    for(int i = 0; i < n; ++i){
        binary[idx_base] = (input[idx_base] > 0) ? mean : -mean;
        idx_base += size;
    }
}