#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecDiv(float* a, float* b, float* c, const int N) {
    // Optimize by calculating the global thread index in 3D for better utilization
    const int i = blockIdx.z * (gridDim.y * gridDim.x * blockDim.y * blockDim.x) 
                + blockIdx.y * (gridDim.x * blockDim.x * blockDim.y)
                + blockIdx.x * blockDim.x + threadIdx.x;
    if (i < N) {
        // Use intrinsic for performance improvement
        c[i] = __fdividef(a[i], b[i]); // faster, less-accurate divide
    }
}