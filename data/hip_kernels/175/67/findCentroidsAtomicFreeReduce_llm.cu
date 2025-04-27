#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findCentroidsAtomicFreeReduce(int afLocal, int* responses, int nPixels, int* cluster, int* centroidMass, unsigned int* centroidCount)
{
    int const af_id = blockIdx.x;
    int const cluster_id = blockIdx.y;
    int const filter_id = threadIdx.x;

    // Use shared memory to help reduce global memory access
    __shared__ int shared_mass[64];
    __shared__ int shared_count[64];
    
    // Initialize shared memory for this thread
    if (filter_id < 64) {
        shared_mass[filter_id] = 0;
        shared_count[filter_id] = 0;
    }
    __syncthreads();

    if (af_id == 0)
    {
        int idx0 = filter_id * 64 + cluster_id;

        for (int i = 0; i < gridDim.x; i++)
        {
            int idxother = i * gridDim.y * blockDim.x + idx0;

            // Accumulate results into shared memory
            atomicAdd(&shared_mass[filter_id], centroidMass[idxother]);
            atomicAdd(&shared_count[filter_id], centroidCount[idxother]);
        }

        __syncthreads(); // Ensure all threads have completed accumulation

        // Only one thread writes the result back to global memory
        if (filter_id < 64) {
            centroidMass[idx0] = shared_mass[filter_id];
            centroidCount[idx0] = shared_count[filter_id];
        }
    }
}