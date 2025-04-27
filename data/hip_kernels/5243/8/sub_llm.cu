#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sub(int *fData, int *sData, int *oData, int x, int y) {

    // Calculate the global index
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Use the calculated index to process data directly
    if (index < x * y) {
        oData[index] = fData[index] - sData[index];
    }
}