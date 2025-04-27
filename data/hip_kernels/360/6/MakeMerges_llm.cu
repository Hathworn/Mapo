#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MakeMerges(int size, int *mergeWith, int *offsets, int *mis) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        int currentAgg = mis[idx];
        int newAgg = mergeWith[currentAgg];
        // Use conditional operator for concise conditional execution
        mis[idx] = (newAgg == -1) ? (currentAgg - offsets[currentAgg]) : (newAgg - offsets[newAgg]);
    }
}