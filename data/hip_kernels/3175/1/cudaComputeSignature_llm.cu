#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaComputeSignature(double* hyperplanes, double* v, int* dimensions, bool* sig, long* hyperp_length) {
    long tid = threadIdx.x + blockDim.x * blockIdx.x;

    if (tid < *hyperp_length) {
        int d_dimensions = *dimensions;
        long pos = tid * d_dimensions;
        double sum = 0.0;

        // Utilize shared memory for better memory access pattern
        extern __shared__ double shared_v[];
        
        // Each thread loads a part of the vector v into shared memory
        if (threadIdx.x < d_dimensions) {
            shared_v[threadIdx.x] = v[threadIdx.x];
        }
        __syncthreads();

        // Compute dot product using shared memory
        for (int i = 0; i < d_dimensions; i++) {
            sum += hyperplanes[i + pos] * shared_v[i];
        }

        sig[tid] = (sum >= 0);
    }
}