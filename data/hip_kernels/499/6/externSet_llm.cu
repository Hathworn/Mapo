#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void externSet(int* variablesMem, int* lastValuesMem, int nQueen, int nVariableCollection) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Compute strides to reduce repetitive calculations
    int totalVariables = nVariableCollection * nQueen * nQueen;
    int collectionLimit = nVariableCollection * nQueen;

    if (index < totalVariables) {
        variablesMem[index] = 1;

        // Optimize branching by checking bounds once
        if (index < collectionLimit) {
            lastValuesMem[index] = 0;
        }
    }
}