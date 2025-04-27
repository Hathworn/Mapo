#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_Filter_peaks_kernel(unsigned int *d_new_peak_list_DM, unsigned int *d_new_peak_list_TS, unsigned int *d_new_peak_list_BW, float *d_new_peak_list_SNR, unsigned int *d_peak_list_DM, unsigned int *d_peak_list_TS, unsigned int *d_peak_list_BW, float *d_peak_list_SNR, unsigned int nElements, unsigned int max_distance, int nLoops, int max_list_pos, int *gmem_pos){
// PPF_DPB = 128 //this is because I set nThreads to 64
// PPF_PEAKS_PER_BLOCK = something small like 10
__shared__ float s_data_snr[PPF_DPB];
__shared__ int s_data_dm[PPF_DPB];
__shared__ int s_data_ts[PPF_DPB];
__shared__ int s_flag[PPF_NTHREADS];
int elements_pos, pos;
float snr, distance, fs, fd;

// Initialize flags
if (threadIdx.x < PPF_PEAKS_PER_BLOCK) {
    s_flag[threadIdx.x] = 1;
} else {
    s_flag[threadIdx.x] = 0;
}

for (int f = 0; f < nLoops; f++) {
    // Load new data blob
    pos = PPF_DPB * f + threadIdx.x;
    if (pos < nElements) {
        s_data_dm[threadIdx.x] = d_peak_list_DM[pos];
        s_data_ts[threadIdx.x] = d_peak_list_TS[pos];
        s_data_snr[threadIdx.x] = d_peak_list_SNR[pos];
    } else {
        // Use sentinel values for inactive threads
        s_data_dm[threadIdx.x] = 0;
        s_data_ts[threadIdx.x] = 0;
        s_data_snr[threadIdx.x] = -1000;
    }

    pos = PPF_DPB * f + threadIdx.x + PPF_NTHREADS;
    if (pos < nElements) {
        s_data_dm[threadIdx.x + PPF_NTHREADS] = d_peak_list_DM[pos];
        s_data_ts[threadIdx.x + PPF_NTHREADS] = d_peak_list_TS[pos];
        s_data_snr[threadIdx.x + PPF_NTHREADS] = d_peak_list_SNR[pos];
    } else {
        s_data_dm[threadIdx.x + PPF_NTHREADS] = 0;
        s_data_ts[threadIdx.x + PPF_NTHREADS] = 0;
        s_data_snr[threadIdx.x + PPF_NTHREADS] = -1000;
    }

    __syncthreads();

    elements_pos = blockIdx.x * PPF_PEAKS_PER_BLOCK;
    for (int p = 0; p < PPF_PEAKS_PER_BLOCK; p++) {
        if ((s_flag[p]) && ((elements_pos + p) < nElements)) {
            int d = d_peak_list_DM[elements_pos + p]; // DM
            int s = d_peak_list_TS[elements_pos + p]; // Time
            snr = d_peak_list_SNR[elements_pos + p]; // SNR

            // Compare with first element
            if (s_data_snr[threadIdx.x] >= snr) {
                fs = (float)s_data_dm[threadIdx.x] - (float)d;
                fd = (float)s_data_ts[threadIdx.x] - (float)s;
                distance = (fd * fd + fs * fs);
                if ((distance < (float)max_distance) && (distance != 0)) {
                    s_flag[p] = 0;
                }
            }

            // Compare with second element
            if (s_data_snr[threadIdx.x + PPF_NTHREADS] >= snr) {
                fs = (float)s_data_dm[threadIdx.x + PPF_NTHREADS] - (float)d;
                fd = (float)s_data_ts[threadIdx.x + PPF_NTHREADS] - (float)s;
                distance = (fd * fd + fs * fs);
                if ((distance < (float)max_distance) && (distance != 0)) {
                    s_flag[p] = 0;
                }
            }
        }
    } // for p
}

// Saving peaks that got through
elements_pos = blockIdx.x * PPF_PEAKS_PER_BLOCK;
if (threadIdx.x < PPF_PEAKS_PER_BLOCK) {
    if ((s_flag[threadIdx.x] == 1) && ((elements_pos + threadIdx.x) < nElements)) {
        int list_pos = atomicAdd(gmem_pos, 1);
        if (list_pos < max_list_pos) {
            d_new_peak_list_DM[list_pos] = d_peak_list_DM[elements_pos + threadIdx.x];
            d_new_peak_list_TS[list_pos] = d_peak_list_TS[elements_pos + threadIdx.x];
            d_new_peak_list_BW[list_pos] = d_peak_list_BW[elements_pos + threadIdx.x];
            d_new_peak_list_SNR[list_pos] = d_peak_list_SNR[elements_pos + threadIdx.x];
        }
    }
}
}