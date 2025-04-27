#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cu_minMaxLoc(const float* src, float* minValue, float* maxValue, int* minLoc, int* maxLoc, float* minValCache, float* maxValCache, int*   minLocCache, int*   maxLocCache, const int n) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    float val = (tid < n) ? src[tid] : src[0]; // Use ternary operator for boundary check
    int loc = (tid < n) ? tid : 0;            // Assign location only if within bounds
    
    maxValCache[threadIdx.x] = val;
    minValCache[threadIdx.x] = val;
    maxLocCache[threadIdx.x] = loc;
    minLocCache[threadIdx.x] = loc;
    __syncthreads();

    // Reducing within a block using shared memory
    for(int offset = blockDim.x / 2; offset > 0; offset >>= 1){
        if(threadIdx.x < offset){
            // Max value and location reduction
            if(maxValCache[threadIdx.x] < maxValCache[threadIdx.x + offset]){
                maxValCache[threadIdx.x] = maxValCache[threadIdx.x + offset];
                maxLocCache[threadIdx.x] = maxLocCache[threadIdx.x + offset];
            }

            // Min value and location reduction
            if(minValCache[threadIdx.x] > minValCache[threadIdx.x + offset]){
                minValCache[threadIdx.x] = minValCache[threadIdx.x + offset];
                minLocCache[threadIdx.x] = minLocCache[threadIdx.x + offset];
            }
        }
        __syncthreads();
    }

    // Write result by the first thread in block
    if(threadIdx.x == 0){
        minValue[blockIdx.x] = minValCache[0];
        maxValue[blockIdx.x] = maxValCache[0];
        minLoc[blockIdx.x] = minLocCache[0];
        maxLoc[blockIdx.x] = maxLocCache[0];
    }
}