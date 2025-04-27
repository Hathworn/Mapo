#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findCentroidsAtomicFreeReduce(int afLocal, int* responses, int nPixels, int* cluster, int* centroidMass, unsigned int* centroidCount)
{
    int const af_id = blockIdx.x;
    int const cluster_id = blockIdx.y;
    int const filter_id = threadIdx.x;

    // Shared memory to accumulate local masses and counts
    __shared__ int smem_mass[64];
    __shared__ unsigned int smem_count[64];

    int local_mass = 0;
    int local_count = 0;

    if (af_id == 0)
    {
        int idx0 = filter_id*64 + cluster_id;

        for (int i=0; i<gridDim.x; i++)
        {
            int idxother = i * gridDim.y*blockDim.x + idx0;

            local_mass += centroidMass[idxother];
            local_count += centroidCount[idxother];
        }

        // Store results in shared memory
        smem_mass[filter_id] = local_mass;
        smem_count[filter_id] = local_count;
    }

    // Synchronize threads in the block
    __syncthreads();

    // Use a single thread to consolidate results in global memory
    if (filter_id == 0)
    {
        int total_mass = 0;
        unsigned int total_count = 0;

        for (int i = 0; i < 64; ++i) 
        {
            total_mass += smem_mass[i];
            total_count += smem_count[i];
        }

        centroidMass[cluster_id] = total_mass;
        centroidCount[cluster_id] = total_count;
    }
}