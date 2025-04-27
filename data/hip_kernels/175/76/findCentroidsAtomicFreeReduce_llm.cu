#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findCentroidsAtomicFreeReduce(int afLocal, int* responses, int nPixels, int* cluster, int* centroidMass, unsigned int* centroidCount)
{
    int const af_id = blockIdx.x;
    int const cluster_id = blockIdx.y;
    int const filter_id = threadIdx.x;

    // Using shared memory for local reductions
    __shared__ int shared_mass[64];
    __shared__ int shared_count[64];

    int local_mass = 0;
    int local_count = 0;

    if (af_id == 0)
    {
        int idx0 = filter_id * 64 + cluster_id;

        for (int i = filter_id; i < gridDim.x; i += blockDim.x)
        {
            int idxother = i * gridDim.y * blockDim.x + idx0;

            local_mass += centroidMass[idxother];
            local_count += centroidCount[idxother];
        }

        // Store local results in shared memory
        shared_mass[filter_id] = local_mass;
        shared_count[filter_id] = local_count;

        // Synchronize threads within block
        __syncthreads();

        // Reduction within block (assuming blockDim.x is 64, adjust as necessary)
        if (filter_id < 32)
        {
            for (int offset = 32; offset > 0; offset /= 2)
            {
                if (filter_id < offset)
                {
                    shared_mass[filter_id] += shared_mass[filter_id + offset];
                    shared_count[filter_id] += shared_count[filter_id + offset];
                }
                __syncthreads();
            }
        }

        // Write final results from shared memory back to global memory
        if (filter_id == 0)
        {
            centroidMass[idx0] = shared_mass[0];
            centroidCount[idx0] = shared_count[0];
        }
    }
}