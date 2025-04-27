#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void findCentroidsAtomicFreeReduce_64(int afLocal, int* responses, int nPixels, int* cluster, int* centroidMass, unsigned int* centroidCount)
{
    int const af_id = blockIdx.x;
    int const cluster_id = blockIdx.y;
    int const filter_id = threadIdx.x;

    int local_mass = 0;
    int local_count = 0;

    if (af_id == 0)
    {
        int idx0 = filter_id * 64 + cluster_id;

        // Use shared memory for faster local_mass and local_count aggregation
        __shared__ int shared_mass[64 * blockDim.y];
        __shared__ unsigned int shared_count[64 * blockDim.y];

        shared_mass[filter_id * blockDim.y + cluster_id] = 0;
        shared_count[filter_id * blockDim.y + cluster_id] = 0;
        
        for (int i = 0; i < gridDim.x; i++)
        {
            int idxother = i * gridDim.y * blockDim.x + idx0;
            atomicAdd(&shared_mass[filter_id * blockDim.y + cluster_id], centroidMass[idxother]);
            atomicAdd(&shared_count[filter_id * blockDim.y + cluster_id], centroidCount[idxother]);
        }

        // Only a single thread needs to write back the result
        if (filter_id == 0) {
            centroidMass[idx0] = shared_mass[cluster_id];
            centroidCount[idx0] = shared_count[cluster_id];
        }
    }
}