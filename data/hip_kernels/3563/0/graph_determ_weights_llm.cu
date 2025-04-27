#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void graph_determ_weights(unsigned int* contact_mat_cum_row_indexes, unsigned int* contact_mat_column_indexes, 
                                     float* contact_mat_values, unsigned int rows, unsigned int values, 
                                     float* immunities, float* shedding_curve, unsigned int infection_length, 
                                     float transmission_rate, int* infection_mat_values) {

    unsigned int row = blockDim.x * blockIdx.x + threadIdx.x;

    // Optimize: Initialize random state once per thread
    if (row < rows) {
        hiprandState state;
        hiprand_init(1234 + row, 0, 0, &state);
        
        unsigned int start = contact_mat_cum_row_indexes[row];
        unsigned int end = contact_mat_cum_row_indexes[row + 1];

        for (int j = start; j < end; j++) {
            float pinf_noshed = contact_mat_values[j] * transmission_rate * 
                                (1.0f - immunities[contact_mat_column_indexes[j]]);
            int delay = -1; // Default delay is -1 if no infection

            // Optimize: Use a separate flag to check exit condition
            bool infected = false;
            for (int d = 1; d <= infection_length; d++) {
                if (hiprand_uniform(&state) < pinf_noshed * shedding_curve[d - 1]) {
                    delay = d;
                    infected = true;
                    break;
                }
            }
            
            infection_mat_values[j] = delay;
        }
    }
}