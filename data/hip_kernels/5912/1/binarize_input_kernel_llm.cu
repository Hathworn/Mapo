#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    int s = blockIdx.x * blockDim.x + threadIdx.x;
    if (s >= size) return;

    float mean = 0.0f;

    // Use loop unrolling for partial vectorization
    for(int i = 0; i < n; i += 4) {
        if(i < n) mean += fabsf(input[i * size + s]);
        if(i + 1 < n) mean += fabsf(input[(i + 1) * size + s]);
        if(i + 2 < n) mean += fabsf(input[(i + 2) * size + s]);
        if(i + 3 < n) mean += fabsf(input[(i + 3) * size + s]);
    }
    
    mean /= n;

    for(int i = 0; i < n; i += 4) {
        if(i < n) binary[i * size + s] = (input[i * size + s] > 0) ? mean : -mean;
        if(i + 1 < n) binary[(i + 1) * size + s] = (input[(i + 1) * size + s] > 0) ? mean : -mean;
        if(i + 2 < n) binary[(i + 2) * size + s] = (input[(i + 2) * size + s] > 0) ? mean : -mean;
        if(i + 3 < n) binary[(i + 3) * size + s] = (input[(i + 3) * size + s] > 0) ? mean : -mean;
    }
}