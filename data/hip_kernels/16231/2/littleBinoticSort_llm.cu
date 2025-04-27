#include "hip/hip_runtime.h"
#include "includes.h"

// Swap function
__device__ void swap(int &a, int &b){
    int t = a;
    a = b;
    b = t;
}

__global__ void littleBinoticSort(int* arr, int num, int numMax){
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Set out-of-bound threads' data to INT_MAX
    if(tid >= num) arr[tid] = INT_MAX;

    __syncthreads();

    // Loop optimizations for sorting
    for(unsigned int i = 2; i <= numMax; i <<= 1){
        for(unsigned int j = i >> 1; j > 0; j >>= 1){
            unsigned int swapIdx = tid ^ j;

            // Ensure valid swap index and apply the sorting conditionally
            if(swapIdx < num && swapIdx > tid){
                bool tidIsEven = (tid & i) == 0;
                if((tidIsEven && arr[tid] > arr[swapIdx]) || (!tidIsEven && arr[tid] < arr[swapIdx])){
                    swap(arr[tid], arr[swapIdx]);
                }
            }

            __syncthreads();
        }
    }
}