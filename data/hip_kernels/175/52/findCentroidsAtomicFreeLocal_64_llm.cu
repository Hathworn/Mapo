#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findCentroidsAtomicFreeLocal_64(int afLocal, int* responses, int nPixels, int* cluster, int* centroidMass, unsigned int* centroidCount)
{
    int const af_id = blockIdx.x;
    int const cluster_id = blockIdx.y;
    int const filter_id = threadIdx.x;
    int* filter_responses = &responses[filter_id * nPixels];

    extern __shared__ int sharedMemory[]; // Shared memory for local updates
    int* shared_responses = sharedMemory;
    int* shared_count = &sharedMemory[blockDim.x];

    shared_responses[filter_id] = 0;
    shared_count[filter_id] = 0;

    __syncthreads(); // Synchronize before accessing shared memory

    int pixel_start = af_id * afLocal;
    int pixel_end = (af_id + 1) * afLocal;
    pixel_end = pixel_end > nPixels ? nPixels : pixel_end;

    for (int i = pixel_start; i < pixel_end; i++)
    {
        if (cluster[i] == cluster_id)
        {
            shared_responses[filter_id] += filter_responses[i];
            shared_count[filter_id]++;
        }
    }

    __syncthreads(); // Ensure all threads have updated shared memory

    int idx = af_id * gridDim.y * blockDim.x + filter_id * 64 + cluster_id;
    centroidMass[idx] = shared_responses[filter_id];
    centroidCount[idx] = shared_count[filter_id];
}