```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void check_for_generator_spikes_kernel(int *d_neuron_ids_for_stimulus, float *d_spike_times_for_stimulus, float* d_last_spike_time_of_each_neuron, unsigned char* d_bitarray_of_neuron_spikes, int bitarray_length, int bitarray_maximum_axonal_delay_in_timesteps, float current_time_in_seconds, float timestep, size_t number_of_spikes_in_stimulus, bool high_fidelity_spike_flag) {

    // Calculate thread index
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    
    while (idx < number_of_spikes_in_stimulus) {
        float spike_time_difference = fabs(current_time_in_seconds - d_spike_times_for_stimulus[idx]);
        
        if (spike_time_difference < 0.5f * timestep) {
            d_last_spike_time_of_each_neuron[d_neuron_ids_for_stimulus[idx]] = current_time_in_seconds;
        }
        
        if (high_fidelity_spike_flag) {
            // Calculate start of bit storage for this neuron
            int neuron_id_spike_store_start = d_neuron_ids_for_stimulus[idx] * bitarray_length;
            
            // Compute offset for current timestep
            int offset_index = (int)(roundf(current_time_in_seconds / timestep)) % bitarray_maximum_axonal_delay_in_timesteps;
            int offset_byte = offset_index >> 3;  // Equivalent to offset_index / 8
            int offset_bit_pos = offset_index & 7; // Equivalent to offset_index % 8
            
            // Get current byte and update required bit
            unsigned char* byte_ptr = &d_bitarray_of_neuron_spikes[neuron_id_spike_store_start + offset_byte];
            if (spike_time_difference < 0.5f * timestep) {
                atomicOr(byte_ptr, (1 << offset_bit_pos));
            } else {
                atomicAnd(byte_ptr, ~(1 << offset_bit_pos));
            }
        }
        
        idx += stride;
    }
    
    __syncthreads();
}