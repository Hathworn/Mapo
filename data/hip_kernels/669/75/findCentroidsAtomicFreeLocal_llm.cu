```cuda
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void findCentroidsAtomicFreeLocal(int afLocal, int* responses, int nPixels, int* cluster, int* centroidMass, unsigned int* centroidCount)
{
    int const af_id = blockIdx.x;
    int const cluster_id = blockIdx.y;
    int const filter_id = threadIdx.x;
    int* filter_responses = &responses[filter_id * nPixels];

    // Use shared memory to reduce global memory access
    __shared__ int shared_responses[256];
    __shared__ int shared_counts[256];

    shared_responses[filter_id] = 0;
    shared_counts[filter_id] = 0;

    int pixel_start = af_id * afLocal;
    int pixel_end = min((af_id + 1) * afLocal, nPixels);

    for (int i = pixel_start; i < pixel_end; i++) {
        if (cluster[i] == cluster_id) {
            shared_responses[filter_id] += filter_responses[i];
            shared_counts[filter_id]++;
        }
    }

    // Synchronize threads within block to ensure shared memory is updated
    __syncthreads();

    // Write accumulated results back to global memory
    int idx = af_id * gridDim.y * blockDim.x + filter_id * 64 + cluster_id;
    centroidMass[idx] = shared_responses[filter_id];
    centroidCount[idx] = shared_counts[filter_id];
}