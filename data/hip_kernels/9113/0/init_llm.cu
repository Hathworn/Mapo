#include "hip/hip_runtime.h"
#include "includes.h"

struct timeval startTime, stopTime;
int started = 0;

__global__ void init(int *arr, int sqroot, int limit) {
    int c;
    for(c = 2; c <= sqroot; c++) {
        if(arr[c] == 0) {

            int tid = c + 1 + threadIdx.x + (blockIdx.x * blockDim.x);
            
            // Unrolling loop for more efficient execution
            int stride = blockDim.x * gridDim.x;
            while (tid < limit) {
                if (tid % c == 0) {
                    arr[tid] = 1;
                }
                tid += stride; // move to next block stride position
            }
        }
    }
}