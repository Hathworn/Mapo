#include "hip/hip_runtime.h"
#include "includes.h"
// Copyright 2019, Dimitra S. Kaitalidou, All rights reserved

#define N 256
#define THR_PER_BL 8
#define BL_PER_GR 32

__global__ void kernel1(int* D, int* Q, int k) {
    // Calculate the thread's index within the grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Direct calculation of block index based on i and k
    int block = i / (2 * k);

    // Calculate corresponding index j
    int j = (i % 2 == 0) ? 
        (2 * block * k + i / 2 - k * (i / (2 * k))) : 
        ((2 * block + 1) * k + i / 2 - k * (i / (2 * k)));
    
    // Assign the values to the output array
    Q[j] = D[i];
}