#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findCentroidsAtomicFreeReduce(int afLocal, int* responses, int nPixels, int* cluster, int* centroidMass, unsigned int* centroidCount)
{
    // Identify unique thread and block indices
    int const af_id = blockIdx.x;
    int const cluster_id = blockIdx.y;
    int const filter_id = threadIdx.x;

    // Initialize shared memory for mass and count
    __shared__ int sharedMass[32];
    __shared__ unsigned int sharedCount[32];

    // Initialize local variables
    int local_mass = 0;
    unsigned int local_count = 0;

    // Load initial values to shared memory
    if (af_id == 0)
    {
        int idx0 = filter_id * 32 + cluster_id;
        
        for (int i = 0; i < gridDim.x; i++)
        {
            int idxother = i * gridDim.y * blockDim.x + idx0;
            local_mass += centroidMass[idxother];
            local_count += centroidCount[idxother];
        }

        // Store computed values in shared memory
        sharedMass[filter_id] = local_mass;
        sharedCount[filter_id] = local_count;

        // Synchronize threads
        __syncthreads();
        
        // Write back the results from shared memory
        centroidMass[idx0] = sharedMass[filter_id];
        centroidCount[idx0] = sharedCount[filter_id];
    }
}