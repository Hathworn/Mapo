#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global index with 3D block and grid consideration:
    int i = blockIdx.x * blockDim.x + threadIdx.x + 
            blockIdx.y * blockDim.x * gridDim.x + 
            blockIdx.z * blockDim.x * gridDim.x * gridDim.y;
    
    // Efficient boundary check and update operation:
    if(i < N) X[i * INCX] += ALPHA;
}