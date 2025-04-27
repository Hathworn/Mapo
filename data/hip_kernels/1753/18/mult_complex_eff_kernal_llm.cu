#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mult_complex_eff_kernal(float* data, const float* src_data, const int nx, const int nxy, const int size)
{
    int idx = blockIdx.z*blockDim.z*nxy + blockIdx.y*blockDim.y*nx + blockIdx.x*blockDim.x 
              + threadIdx.z*nxy + threadIdx.y*nx + threadIdx.x;
    
    // Ensure idx is within valid range
    if (idx < size / 2) {
        data[idx] *= src_data[idx];
        data[size-idx-1] *= src_data[size-idx-1];
    }
}