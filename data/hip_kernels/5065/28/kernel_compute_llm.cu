```c
#include "hip/hip_runtime.h"
#include "includes.h"
#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif
__global__ void kernel_compute(int* trainingSet, int* data, int* res, int setSize, int dataSize){
    int computeId = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure computeId is within setSize bounds
    if(computeId < setSize){
        int diff = 0;

        // Use register variable for loop to avoid repeated computations
        int offset = computeId * 784;

        for(int i = 0; i < dataSize; i++){
            int toAdd = data[i] - trainingSet[offset + i];
            diff += toAdd * toAdd;
        }

        // Write result directly after computation
        res[computeId] = diff;
    }
}