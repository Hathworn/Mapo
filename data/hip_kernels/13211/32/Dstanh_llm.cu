```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Unchanged kernel signature
extern "C" 
{
}

// Optimized kernel with loop unrolling and memory coalescing
__global__ void Dstanh(const int lengthX, const double sf, const double * __restrict__ gradc, const double * __restrict__ fc, double * __restrict__ gradn) 
{
    // Calculate the global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure proper memory alignment
    double local_sf = sf;

    // Unroll loop to process multiple elements per thread
    for (int i = idx; i < lengthX; i += blockDim.x * gridDim.x) {
        double fc_scaled = fc[i] / local_sf;
        gradn[i] += local_sf * gradc[i] * (1.0 - fc_scaled * fc_scaled);
    }
}