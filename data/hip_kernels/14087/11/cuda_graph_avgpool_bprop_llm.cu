#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_graph_avgpool_bprop(float* gradInput, const float *gradOutput, const float* clusters, const int nClusters, const int poolsize, const int dim, const int nClustersPerThread) {

    extern __shared__ float shared_mem[];
    float* gradOutput_data = (float*)shared_mem;

    const int tidx = threadIdx.x;
    gradInput += blockIdx.x * dim;
    gradOutput += blockIdx.x * nClusters;

    // Load gradOutput into shared memory for faster access
    for (int i = tidx; i < nClusters; i += blockDim.x) {
        gradOutput_data[i] = gradOutput[i];
    }
    __syncthreads();

    // Distribute gradOutput over gradInput using clusters
    for (int i = tidx; i < poolsize; i += blockDim.x) {
        for (int j = 0; j < nClusters; ++j) {
            atomicAdd(&gradInput[(int)(clusters[j * poolsize + i] - 1)], gradOutput_data[j] / poolsize);
        }
    }
}