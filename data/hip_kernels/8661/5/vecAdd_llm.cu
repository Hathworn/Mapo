#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd(int *xd, float *Ag, float *Bg, float *Cg) {
    // Calculate the global index for each thread
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Perform vector addition and store the result in Cg
    Cg[j] = Ag[j] + Bg[j] + *xd;
}