#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UpdateCC_XY(float *CCXY, int id_CC, float *XY_tofill, int dim_XY) {
    // Calculate global thread index more efficiently
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    if (id < dim_XY) {
        // Directly assign value without checking again
        CCXY[id_CC * dim_XY + id] = XY_tofill[id];
    }
}