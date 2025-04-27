#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void zero_dm_outliers_kernel_two(unsigned short *d_input, int nchans, int nsamp)
{
    // Use registers instead of local variables where possible
    int c = blockIdx.x * blockDim.x + threadIdx.x;
    float stdev = 1000000.0f, mean = MEAN, mean_last = 0.0f, sum, sum_squares, cutoff = CUT * stdev;
    int count, iters = 0;

    __shared__ float g_mean[1024], g_stdev[1024];

    // Iteratively refine the mean and standard deviation
    while (iters <= ITER && fabs(mean - mean_last) > ACC) {
        sum = 0.0f;
        sum_squares = 0.0f;
        count = 0;

        // Reduce data access within loop using a single index calculation
        for (int t = 0; t < nsamp; ++t) {
            float data = (float)d_input[t * nchans + c];
            if (fabs(data - mean) < cutoff ) {
                sum += data;
                sum_squares += data * data;
                count++;
            }
        }
        
        mean_last = mean;
        mean = sum / (float)count;
        sum_squares = sum_squares / count - mean * mean;
        stdev = sqrt(sum_squares);
        cutoff = CUT * stdev;
        iters++;
    }

    // Handle cases of computation exceeding iteration limit or other anomalies
    if (count == 0 || iters > ITER || mean == 0.0f || stdev == 0.0f) {
        for (int t = 0; t < nsamp; t++) {
            d_input[t * nchans + c] = MEAN;
        }
        g_mean[threadIdx.x] = mean = MEAN;
        g_stdev[threadIdx.x] = stdev = 0.0f;
    } else {
        g_mean[threadIdx.x] = mean;
        g_stdev[threadIdx.x] = stdev;
    }

    __syncthreads();

    // Calculate the mean and standard deviation of means and stdevs across block
    float mean_of_mean = 0.0f, stdev_of_mean, mean_of_stdev = 0.0f, stdev_of_stdev;
    sum_squares = 0.0f;
    
    for (int i = 0; i < blockDim.x; i++) {
        mean_of_mean += g_mean[i];
        sum_squares += g_mean[i] * g_mean[i];
    }
    
    mean_of_mean /= blockDim.x;
    sum_squares = sum_squares / blockDim.x - mean_of_mean * mean_of_mean;
    stdev_of_mean = sqrt(sum_squares);

    float m_cutoff = 3.0f * stdev_of_mean;
    sum_squares = 0.0f;
    
    for (int i = 0; i < blockDim.x; i++) {
        mean_of_stdev += g_stdev[i];
        sum_squares += g_stdev[i] * g_stdev[i];
    }

    mean_of_stdev /= blockDim.x;
    sum_squares = sum_squares / blockDim.x - mean_of_stdev * mean_of_stdev;
    stdev_of_stdev = sqrt(sum_squares);

    float s_cutoff = 3.0f * stdev_of_stdev;

    // Filter outliers based on computed cutoffs and normalize data
    if (fabs(g_mean[threadIdx.x] - mean_of_mean) > m_cutoff || fabs(g_stdev[threadIdx.x] - mean_of_stdev) > s_cutoff) {
        for (int t = 0; t < nsamp; t++) {
            d_input[t * nchans + c] = MEAN;
        }
    } else {
        for (int t = 0; t < nsamp; t++) {
            float val = d_input[t * nchans + c];
            d_input[t * nchans + c] = fabs(val - mean) < R_CUT * stdev ? static_cast<unsigned short>(val - mean + MEAN) : MEAN;
        }
    }
}