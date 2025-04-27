#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void modify_i_j(int width, int height, int pitch, float *d_array, int i, int j, float change_to) {
    // Calculate row and column using blockIdx and threadIdx directly
    int idx = blockIdx.x;  // row
    int idy = threadIdx.x; // column

    // Directly access and modify the element if conditions are met
    if (idx == i && idy == j) {
        d_array[idx * (pitch / sizeof(float)) + idy] = change_to;
    }
}