#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_graph_maxpool_bprop(float* gradInput, const float *gradOutput, const float* indices, const int nClusters, const int dim, const int nClustersPerThread) {
    extern __shared__ float shared_mem[];
    float* gradOutput_data = (float*)shared_mem;
    float* indices_data = (float*)&gradOutput_data[nClusters];

    const int tidx = threadIdx.x;
    gradInput += blockIdx.x * dim;
    gradOutput += blockIdx.x * nClusters;
    indices += blockIdx.x * nClusters;
    __syncthreads();

    for (int i = tidx; i < nClusters; i += blockDim.x) {  // Load data into shared memory using all threads
        gradOutput_data[i] = gradOutput[i];
        indices_data[i] = indices[i];
    }
    __syncthreads();

    // Execute backprop calculation using all threads
    for (int i = tidx; i < nClusters; i += blockDim.x) {
        atomicAdd(&gradInput[(int)indices_data[i] - 1], gradOutput_data[i]);
    }
}