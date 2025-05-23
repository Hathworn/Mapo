#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findCentroidsAtomicFreeReduce_64(int afLocal, int* responses, int nPixels, int* cluster, int* centroidMass, unsigned int* centroidCount)
{
    int const af_id = blockIdx.x;
    int const cluster_id = blockIdx.y;
    int const filter_id = threadIdx.x;

    // Use shared memory to optimize loading data
    __shared__ int shared_mass[64];
    __shared__ unsigned int shared_count[64];

    int idx0 = filter_id * 64 + cluster_id;
    int local_mass = 0;
    int local_count = 0;

    if (af_id == 0)
    {
        for (int i = 0; i < gridDim.x; i++)
        {
            int idxother = i * gridDim.y * blockDim.x + idx0;
            local_mass += centroidMass[idxother];
            local_count += centroidCount[idxother];
        }

        // Write the results to shared memory
        shared_mass[filter_id] = local_mass;
        shared_count[filter_id] = local_count;
        
        // Synchronize threads to ensure complete data update
        __syncthreads();

        // Write back from shared to global memory
        if (filter_id == 0)
        {
            centroidMass[idx0] = shared_mass[filter_id];
            centroidCount[idx0] = shared_count[filter_id];
        }
    }
}