#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *fData, int *sData, int *oData, int x, int y) {

    int index = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    
    // Calculate total size only once
    int totalSize = x * y;

    // Optimize loop by checking condition only once per stride
    while (index < totalSize) {
        oData[index] = fData[index] + sData[index];
        index += stride;
    }
}