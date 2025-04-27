#include "hip/hip_runtime.h"
#include "includes.h"

// Perform reduction with element-wise capping by scalar
extern "C"
__global__ void capByScalar(int n, float *a, float b, float *result)
{
    // Use shared memory to optimize memory access
    __shared__ float shared_cap;
    if (threadIdx.x == 0) shared_cap = b; // Load cap value to shared memory
    __syncthreads(); // Synchronize to ensure shared memory is ready

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n)
    {
        // Access the shared cap for better performance
        result[i] = a[i] < shared_cap ? a[i] : shared_cap;
    }
}