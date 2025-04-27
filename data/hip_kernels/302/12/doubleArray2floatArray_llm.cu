#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void doubleArray2floatArray(const double * doubleArray, float* floatArray, const int size) {
    // Calculate a unique global thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Process data in a coalesced manner, handle multiple elements per thread
    for (int idx = i; idx < size; idx += blockDim.x * gridDim.x) {
        floatArray[idx] = __double2float_rd(doubleArray[idx]); // Use intrinsic for conversion
    }
}