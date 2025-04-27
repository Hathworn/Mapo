#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bitonic_sort(int* arrayIn, int* arrayOut, int arrayLen, int chunkSize) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // If within bounds
    if (idx < arrayLen) {
        int myValue = arrayIn[idx];
        int chunkStart = (idx / chunkSize) * chunkSize;
        int chunkMid = chunkStart + (chunkSize >> 1); // Use bitwise shift for division by 2
        int partnerIndex = chunkSize - (idx - chunkStart) - 1 + chunkStart;

        // Check partner index bounds
        if (partnerIndex < arrayLen) {
            int partnerValue = arrayIn[partnerIndex];
            
            // Avoid multiple conditional comparisons
            bool compare = (myValue <= partnerValue);
            int min = compare ? myValue : partnerValue;
            int max = compare ? partnerValue : myValue;
            
            myValue = (idx < chunkMid) ? min : max;
        }
        
        // Write result
        arrayOut[idx] = myValue;
    }
}