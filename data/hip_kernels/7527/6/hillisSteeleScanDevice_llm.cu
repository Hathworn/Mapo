#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hillisSteeleScanDevice(int *d_array , int numberOfElements, int *d_tmpArray, int moveIndex) {
    int index = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Check within bounds
    if(index < numberOfElements) {
        d_tmpArray[index] = d_array[index];
        
        // Only perform addition if valid index
        if(index >= moveIndex) {
            d_tmpArray[index] += d_array[index - moveIndex];
        }
    }
}