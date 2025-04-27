#include "hip/hip_runtime.h"
#include "includes.h"

// Use cooperative grid-stride loop to ensure full utilization of the GPU
__global__ void loop()
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate the global index
    
    for (int i = idx; i < N; i += blockDim.x * gridDim.x) { // Grid-stride loop for multiple iterations
        printf("This is iteration number %d\n", i);
    }
}