#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(double *save, double *y) {
    const int threadID = (blockIdx.x * blockDim.x + threadIdx.x) << 1;

    // Use float2 to copy two doubles at once for better memory coalescing
    reinterpret_cast<double2*>(save)[blockIdx.x * blockDim.x + threadIdx.x] = 
        reinterpret_cast<const double2*>(y)[blockIdx.x * blockDim.x + threadIdx.x];
}