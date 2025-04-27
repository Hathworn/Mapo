#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addVector(int *d1_in, int *d2_in, int *d_out, int n) {
    // Calculate flattened array index using block and thread indices
    int ind = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure index is within bounds using more efficient memory access pattern
    if (ind < n) {
        // Utilize registers to optimize memory access for addition
        int temp1 = d1_in[ind];
        int temp2 = d2_in[ind];
        d_out[ind] = temp1 + temp2;
    }
}