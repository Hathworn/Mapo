#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernUpdatePi( const size_t numPoints, const size_t numComponents, double* logpi, double* Gamma ) {
    int b = blockIdx.y * gridDim.x + blockIdx.x;
    int comp = b * blockDim.x + threadIdx.x;
    if(comp >= numComponents) { // Fix boundary condition
        return;
    }

    // Optimize shared memory usage
    __shared__ double A[1024];
    double componentGamma = log(Gamma[comp * numPoints]);
    A[threadIdx.x] = logpi[comp] + componentGamma;
    __syncthreads();

    // Reduce across components using threads
    double sum = 0;
    for(int offset = 0; offset < blockDim.x; ++offset) {
        if(offset < numComponents) {
            sum += exp(A[offset]);
        }
    } 
    
    if(comp < numComponents) { // Ensure writing back only valid components
        logpi[comp] = A[threadIdx.x] - log(sum);
    }
}