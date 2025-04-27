#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask4D(float* in, int* mask, int xstrides0, int xstrides1, int xstrides2, int xstrides3, int scalarCount) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    while (tid < scalarCount) {
        int xindex0, xindex1, xindex2, xindex3;
        
        // Directly calculate indices from tid
        xindex0 = tid / xstrides0;
        tid = tid % xstrides0;
        xindex1 = tid / xstrides1;
        tid = tid % xstrides1;
        xindex2 = tid / xstrides2;
        xindex3 = tid % xstrides2;
        
        // Efficient mask check
        if (xindex3 >= mask[xindex0]) {
            in[tid] = 0;
        }

        // Update tid for the next iteration
        tid += stride;
    }
}