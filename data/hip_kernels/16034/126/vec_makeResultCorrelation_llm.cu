#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_makeResultCorrelation(int n, int sizeInput, int sizeFullPadded,float *output, float *input, int *sparse) {
    // Calculate 1D global thread index
    int id = blockIdx.y * gridDim.x * blockDim.x * blockDim.y + blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;
    
    if (id < n) {
        int id2 = id % sizeInput;
        int id3 = id / sizeInput;
        
        // Perform calculation
        output[id] = input[sparse[id2] + sizeFullPadded * id3] / sqrtf(sizeFullPadded / 2.0f);
    }
}