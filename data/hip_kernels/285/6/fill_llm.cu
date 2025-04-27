#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fill(float * w, float val, int size) {
    // Use a stride equal to the total number of threads
    for (int tid = blockIdx.x * blockDim.x + threadIdx.x; tid < size; tid += blockDim.x * gridDim.x) {
        w[tid] = val; // Assign value
    }
}