#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void check_for_neuron_spikes_kernel(float *d_membrane_potentials_v, float *d_thresholds_for_action_potential_spikes, float *d_resting_potentials, float* d_last_spike_time_of_each_neuron, unsigned char* d_bitarray_of_neuron_spikes, int bitarray_length, int bitarray_maximum_axonal_delay_in_timesteps, float current_time_in_seconds, float timestep, size_t total_number_of_neurons, bool high_fidelity_spike_flag) {

    // Get thread IDs
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int step = blockDim.x * gridDim.x;
    int offset_index = (int)(round((float)(current_time_in_seconds / timestep))) % bitarray_maximum_axonal_delay_in_timesteps;
    int offset_byte = offset_index / 8;
    int offset_bit_pos = offset_index - (8 * offset_byte);

    while (idx < total_number_of_neurons) {
        bool spike_occurred = d_membrane_potentials_v[idx] >= d_thresholds_for_action_potential_spikes[idx];

        if (spike_occurred) {
            // Set current time as last spike time of neuron
            d_last_spike_time_of_each_neuron[idx] = current_time_in_seconds;
            // Reset membrane potential
            d_membrane_potentials_v[idx] = d_resting_potentials[idx];
        }

        if (high_fidelity_spike_flag) {
            // Get start of the given neuron's bits
            int neuron_id_spike_store_start = idx * bitarray_length;
            unsigned char byte = d_bitarray_of_neuron_spikes[neuron_id_spike_store_start + offset_byte];
            // Modify the specific bit in the byte
            byte = spike_occurred ? (byte | (1 << offset_bit_pos)) : (byte & ~(1 << offset_bit_pos));
            // Assign the byte
            d_bitarray_of_neuron_spikes[neuron_id_spike_store_start + offset_byte] = byte;
        }

        idx += step;
    }
    __syncthreads();
}