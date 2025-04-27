```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MakeMerges_MarkSplits(int size, int* mergeWith, int* offsets, int* mis, int* splitsToMake) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= size) return; // Return early if out of bounds

    int currentAgg = mis[idx];
    int newAgg = mergeWith[currentAgg];

    if (newAgg == -1) {
        mis[idx] = currentAgg - offsets[currentAgg]; // Apply offset when not merging
    } else {
        int newId = newAgg - offsets[newAgg];
        mis[idx] = newId;
        atomicExch(&splitsToMake[newId], 1); // Ensure atomic write
    }
}