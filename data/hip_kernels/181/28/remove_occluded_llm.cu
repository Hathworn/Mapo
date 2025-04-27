#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define TB 128
#define DISP_MAX 256

__global__ void remove_occluded(float *y, int size, int size3)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < size) {
        int x = id % size3;
        // Use shared memory to optimize repeated access
        __shared__ float shared_y[TB];
        shared_y[threadIdx.x] = y[id];

        __syncthreads();

        for (int i = 1; x + i < size3; i++) {
            // Reduce global memory access by using shared memory 
            if (i - shared_y[threadIdx.x + i] < -shared_y[threadIdx.x]) {
                y[id] = 0;
                break;
            }
        }
    }
}