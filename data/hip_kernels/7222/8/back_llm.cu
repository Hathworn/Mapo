#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void back(double *h_out_d, double *weights_out_d, double *weights_h_d, double *weights_in_d, double *outputs_d, double *deltas_h_d, double *deltas_h_new_d, double *deltas_o_d, double *weights_in_delta_d, double *weights_out_delta_d, double *weights_h_delta_d, int height, int inputs, int outputs, int layers, double *training_in_d, double *training_out_d, int sample){

    int i, j;

    int tix = threadIdx.x;
    int tiy = threadIdx.y + sample;

    int h_offset = tiy * layers * height;
    int w_o_d_offset = tiy * outputs * height;
    int w_h_d_offset = tiy * (layers-1) * height * height;
    int w_i_d_offset = tiy * inputs * height;
    int d_h_offset = tiy * height;

    double delta_sum, temp;

    // Output layer processing
    if(tix < outputs){
        deltas_o_d[tiy * outputs + tix] = (outputs_d[tiy * outputs + tix] - training_out_d[tiy]);
        temp = deltas_o_d[tiy * outputs + tix];
        for(i = 0; i < height; i++){
            weights_out_delta_d[w_o_d_offset + (tix * height) + i] = temp * h_out_d[h_offset + (layers-1)*height+i];
        }
    }

    __syncthreads();

    // Hidden layer connected to output
    if(tix < height) {
        delta_sum = 0;
        for(i = 0; i < outputs; i++){
            delta_sum += weights_out_d[tix + (i * height)] * deltas_o_d[tiy * outputs + i];
        }
        temp = h_out_d[h_offset + (layers-1)*height + tix];
        deltas_h_d[d_h_offset + tix] = temp * (1 - temp) * delta_sum;

        for(i = 0; i < height; i++){
            weights_h_delta_d[w_h_d_offset + (layers-2)*height*height + (tix * height) + i] = deltas_h_d[d_h_offset + tix] * h_out_d[h_offset + (layers-2)*height+i];
        }
    }

    __syncthreads();

    // Each hidden layer not connected to input/hidden output layer
    for(i = layers - 2; i > 0; i--){
        if(tix < height) {
            delta_sum = 0;
            for(j = 0; j < height; j++){
                delta_sum += weights_h_d[i*height*height + j*height + tix] * deltas_h_d[d_h_offset + j];
            }
            temp = h_out_d[h_offset + i*height + tix];
            deltas_h_new_d[d_h_offset + tix] = temp * (1 - temp) * delta_sum;

            for(j = 0; j < height; j++){
                weights_h_delta_d[w_h_d_offset + (i-1)*height*height + (tix * height) + j] = deltas_h_new_d[d_h_offset + tix] * h_out_d[h_offset + (i-1)*height+j];
            }
        }

        __syncthreads();
        if(tix < height) {
            deltas_h_d[d_h_offset + tix] = deltas_h_new_d[d_h_offset + tix];
        }
        __syncthreads();
    }

    // Layer connected to inputs
    if(tix < height) {
        delta_sum = 0;
        for(i=0; i<height; i++){
            delta_sum += weights_h_d[i*height + tix] * deltas_h_d[d_h_offset + i];
        }
        temp = h_out_d[h_offset + tix];
        deltas_h_new_d[d_h_offset + tix] = temp * (1 - temp) * delta_sum;

        for(i=0; i<inputs; i++){
            weights_in_delta_d[w_i_d_offset + tix*inputs+i] = deltas_h_new_d[d_h_offset + tix] * training_in_d[tiy * inputs + i];
        }
    }

    __syncthreads();
}