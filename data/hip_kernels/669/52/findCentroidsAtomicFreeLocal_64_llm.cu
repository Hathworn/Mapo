#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void findCentroidsAtomicFreeLocal_64(int afLocal, int* responses, int nPixels, int* cluster, int* centroidMass, unsigned int* centroidCount)
{
    // Local variables to store the sum and count of responses for each thread
    int local_responses = 0;
    int local_count = 0;

    // Calculate pixel range for current af_id (blockIdx.x)
    int pixel_start = blockIdx.x * afLocal;
    int pixel_end = min((blockIdx.x + 1) * afLocal, nPixels);

    // Memory access pointers for current filter and cluster
    int* filter_responses = &responses[threadIdx.x * nPixels];
    
    // Iterate over assigned pixel range
    for (int i = pixel_start; i < pixel_end; i++)
    {
        if (cluster[i] == blockIdx.y)  // Check if pixel belongs to current cluster
        {
            local_responses += filter_responses[i];  // Accumulate response
            local_count++;  // Count the pixel
        }
    }

    // Calculate index for storing results using thread and block identifiers
    int idx = blockIdx.x * gridDim.y * blockDim.x + threadIdx.x * 64 + blockIdx.y;
    centroidMass[idx] = local_responses;  // Store local sum of responses
    centroidCount[idx] = local_count;  // Store local count of pixels
}