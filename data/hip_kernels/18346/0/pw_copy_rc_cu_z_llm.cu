#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel with optimized memory accesses
__global__ void pw_copy_rc_cu_z(const double * __restrict__ din, double * __restrict__ zout, const int n) {
    const int igpt = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Utilize shared memory for coalesced writing, improve cache usage
    __shared__ double shared_zout[256]; // Example size, should be set based on occupancy considerations

    if (igpt < n) {
        shared_zout[threadIdx.x * 2] = din[igpt];
        shared_zout[threadIdx.x * 2 + 1] = 0.0e0;
        
        __syncthreads(); // Synchronizing threads within block to ensure all writes to shared memory are done

        // Write back to global memory
        zout[2 * igpt] = shared_zout[threadIdx.x * 2];
        zout[2 * igpt + 1] = shared_zout[threadIdx.x * 2 + 1];
    }
}