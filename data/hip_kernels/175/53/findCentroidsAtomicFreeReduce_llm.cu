#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findCentroidsAtomicFreeReduce(int afLocal, int* responses, int nPixels, int* cluster, int* centroidMass, unsigned int* centroidCount)
{
    int const af_id = blockIdx.x;
    int const cluster_id = blockIdx.y;
    int const filter_id = threadIdx.x;
    
    __shared__ int shared_mass[32]; // Use shared memory for reduction
    __shared__ int shared_count[32];

    shared_mass[filter_id] = 0;
    shared_count[filter_id] = 0;
    __syncthreads();
    
    if (af_id == 0)
    {
        int idx0 = filter_id * 32 + cluster_id;

        for (int i=0; i<gridDim.x; i++) {
            int idxother = i * gridDim.y * blockDim.x + idx0;

            atomicAdd(&shared_mass[filter_id], centroidMass[idxother]); // Use atomic operations on shared memory
            atomicAdd(&shared_count[filter_id], centroidCount[idxother]);
        }
        __syncthreads();

        if (filter_id == 0) { // Only one thread writes back to global memory
            for (int i = 1; i < blockDim.x; i++) {
                shared_mass[0] += shared_mass[i];
                shared_count[0] += shared_count[i];
            }
            centroidMass[idx0] = shared_mass[0];
            centroidCount[idx0] = shared_count[0];
        }
    }
}