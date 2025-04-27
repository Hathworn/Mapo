#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX) {
    // Calculate the global index for the element
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a stride loop to handle more elements per thread
    int stride = gridDim.x * blockDim.x;
    for (int index = i; index < N; index += stride) {
        X[index * INCX] = ALPHA;
    }
}