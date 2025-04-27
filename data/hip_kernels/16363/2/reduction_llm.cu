#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduction(bool *B, int *number, int order) {
    int num = 0;
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (idx < order) {
        // Use a stride-based loop to enhance memory coalescing
        for (int i = idx; i < order * order; i += order) {
            if (B[i] == 1) {
                num++;
            }
        }
        number[idx] = num;
    }
}