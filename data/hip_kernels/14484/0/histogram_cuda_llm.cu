#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histogram_cuda(int *histogram, float *values, size_t nb, float bin_size, float min, int bins, int nb_thread)
{
    int id = (blockIdx.x * blockDim.x + threadIdx.x) * ITEMS_PER_THREAD;
    int thread_id = threadIdx.x;

    // Use shared memory instead of malloc for better performance
    extern __shared__ int s_bins[];
    int *local_hist = s_bins + thread_id * bins;

    if (id == 0)
        printf("Bin size : %f\n", bin_size);

    // Initialize local histogram
    for (int i = 0; i < bins; i++)
        local_hist[i] = 0;

    // Compute local bins
    for (int i = 0; i < ITEMS_PER_THREAD; i++)
    {
        for (int j = 0; j < bins; j += 1)
        {
            if (id + i < nb && values[id + i] <= ((float)min + (float)(j + 1) * bin_size))
            {
                local_hist[j] += 1;
                break;
            }
        }
    }
    __syncthreads();

    // Reduce local bins into shared memory
    for (size_t s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (thread_id < s)
        {
            for (int j = 0; j < bins; j++)
            {
                local_hist[j] += s_bins[(thread_id + s) * bins + j];
            }
        }
        __syncthreads();
    }

    // Combine results to histogram
    if (thread_id == 0)
    {
        for (int i = 0; i < bins; i++) {
            histogram[i + blockIdx.x * bins] = s_bins[i];
        }
    }
}