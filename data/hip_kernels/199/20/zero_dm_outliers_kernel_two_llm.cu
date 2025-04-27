#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void zero_dm_outliers_kernel_two(unsigned short *d_input, int nchans, int nsamp) {
    // Initialize shared memory for block-level mean and standard deviation
    __shared__ float g_mean[1024];
    __shared__ float g_stdev[1024];

    int c = blockIdx.x * blockDim.x + threadIdx.x;

    // Local variables for mean, standard deviation, and related computations
    float mean = MEAN;
    float mean_last = 0.0f;
    float stdev = 1000000.0f;
    float sum = 0.0f;
    float sum_squares = 0.0f;
    int count = 0, iters = 0;
    float cutoff = (CUT * stdev);

    // Iterative process for calculating mean and standard deviation
    while (fabsf(mean - mean_last) > ACC) {  // Use fabsf for floating point absolute value
        sum = 0.0f;
        sum_squares = 0.0f;
        count = 0;
        
        for (int t = 0; t < nsamp; t++) {
            float data = static_cast<float>(d_input[t * nchans + c]);
            if (data < (mean + cutoff) && data > (mean - cutoff)) {
                sum += data;
                sum_squares += (data * data);
                count++;
            }
        }
        
        mean_last = mean;
        mean = (sum / static_cast<float>(count));
        sum_squares = ((sum_squares / count) - (mean * mean));
        stdev = sqrtf(sum_squares);  // Use sqrtf for floating point square root
        cutoff = (CUT * stdev);
        iters++;
        if (iters > ITER) break;
    }

    // Handle cases where standard deviation computation failed or reached iteration limit
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

    // Block-level calculation of mean of means and mean of standard deviations for further filtering
    float mean_of_mean = 0.0f, stdev_of_mean = 0.0f, m_cutoff = 0.0f;
    float mean_of_stdev = 0.0f, stdev_of_stdev = 0.0f, s_cutoff = 0.0f;
    sum_squares = 0.0f;

    for (int i = 0; i < blockDim.x; i++) {
        mean_of_mean += g_mean[i];
        sum_squares += (g_mean[i] * g_mean[i]);
    }

    mean_of_mean /= blockDim.x;
    sum_squares = ((sum_squares / blockDim.x) - (mean_of_mean * mean_of_mean));
    stdev_of_mean = sqrtf(sum_squares);
    m_cutoff = (3.0f * stdev_of_mean);

    sum_squares = 0.0f;
    for (int i = 0; i < blockDim.x; i++) {
        mean_of_stdev += g_stdev[i];
        sum_squares += (g_stdev[i] * g_stdev[i]);
    }

    mean_of_stdev /= blockDim.x;
    sum_squares = ((sum_squares / blockDim.x) - (mean_of_stdev * mean_of_stdev));
    stdev_of_stdev = sqrtf(sum_squares);
    s_cutoff = (3.0f * stdev_of_stdev);

    // Final filtering based on mean and standard deviation thresholds
    if (fabsf(g_mean[threadIdx.x] - mean_of_mean) > m_cutoff || fabsf(g_stdev[threadIdx.x] - mean_of_stdev) > s_cutoff) {
        for (int t = 0; t < nsamp; t++) {
            d_input[t * nchans + c] = MEAN;
        }
    } else {
        for (int t = 0; t < nsamp; t++) {
            float data = static_cast<float>(d_input[t * nchans + c]);
            if ((data - mean < R_CUT * stdev) && (data - mean > -R_CUT * stdev)) {
                d_input[t * nchans + c] = static_cast<unsigned short>(data - mean + MEAN);
            } else {
                d_input[t * nchans + c] = MEAN;
            }
        }
    }
}