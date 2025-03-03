; ModuleID = '../data/hip_kernels/90/0/main.cu'
source_filename = "../data/hip_kernels/90/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ26convolution_forward_kernelPfS_S_S_iiiiiifE5shImg = internal unnamed_addr addrspace(3) global [39 x [39 x float]] undef, align 16
@_ZZ26convolution_forward_kernelPfS_S_S_iiiiiifE8shFilter = internal unnamed_addr addrspace(3) global [8 x [8 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z26convolution_forward_kernelPfS_S_S_iiiiiif(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, float %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = sdiv i32 %4, 32
  %14 = freeze i32 %12
  %15 = freeze i32 %13
  %16 = udiv i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = freeze i32 %17
  %19 = freeze i32 %13
  %20 = udiv i32 %18, %19
  %21 = mul i32 %20, %19
  %22 = sub i32 %18, %21
  %23 = shl i32 %22, 5
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %25 = add i32 %23, %24
  %26 = mul i32 %16, %15
  %27 = sub i32 %14, %26
  %28 = shl i32 %27, 5
  %29 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %30 = add i32 %28, %29
  %31 = icmp sgt i32 %5, 0
  br i1 %31, label %32, label %81

32:                                               ; preds = %11
  %33 = icmp ult i32 %24, %7
  %34 = icmp ult i32 %29, %7
  %35 = select i1 %33, i1 %34, i1 false
  %36 = mul nsw i32 %20, %5
  %37 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ26convolution_forward_kernelPfS_S_S_iiiiiifE8shFilter, i32 0, i32 %29, i32 %24
  %38 = mul i32 %4, %4
  %39 = mul i32 %38, %5
  %40 = mul i32 %39, %16
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ26convolution_forward_kernelPfS_S_S_iiiiiifE5shImg, i32 0, i32 %29, i32 %24
  %44 = icmp slt i32 %25, %9
  %45 = icmp slt i32 %30, %9
  %46 = select i1 %44, i1 true, i1 %45
  %47 = sub nsw i32 %30, %9
  %48 = mul nsw i32 %47, %4
  %49 = sub i32 %25, %9
  %50 = add nsw i32 %49, %48
  %51 = sext i32 %50 to i64
  %52 = icmp ult i32 %24, 7
  %53 = add nuw nsw i32 %24, 32
  %54 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ26convolution_forward_kernelPfS_S_S_iiiiiifE5shImg, i32 0, i32 %29, i32 %53
  %55 = add nsw i32 %25, 32
  %56 = add nsw i32 %9, %4
  %57 = icmp sge i32 %55, %56
  %58 = sub i32 %55, %9
  %59 = add nsw i32 %58, %48
  %60 = sext i32 %59 to i64
  %61 = icmp ult i32 %29, 7
  %62 = add nuw nsw i32 %29, 32
  %63 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ26convolution_forward_kernelPfS_S_S_iiiiiifE5shImg, i32 0, i32 %62, i32 %24
  %64 = add nsw i32 %30, 32
  %65 = icmp sge i32 %64, %56
  %66 = sub nsw i32 %64, %9
  %67 = mul nsw i32 %66, %4
  %68 = add nsw i32 %49, %67
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [39 x [39 x float]], [39 x [39 x float]] addrspace(3)* @_ZZ26convolution_forward_kernelPfS_S_S_iiiiiifE5shImg, i32 0, i32 %62, i32 %53
  %71 = add nsw i32 %58, %67
  %72 = sext i32 %71 to i64
  %73 = icmp sgt i32 %7, 0
  %74 = select i1 %45, i1 true, i1 %57
  %75 = select i1 %44, i1 true, i1 %65
  %76 = select i1 %65, i1 true, i1 %57
  %77 = and i32 %7, 7
  %78 = icmp ult i32 %7, 8
  %79 = and i32 %7, -8
  %80 = icmp eq i32 %77, 0
  br label %103

81:                                               ; preds = %148, %11
  %82 = phi float [ 0.000000e+00, %11 ], [ %149, %148 ]
  %83 = sext i32 %25 to i64
  %84 = mul i32 %6, %6
  %85 = mul i32 %84, %8
  %86 = mul i32 %85, %16
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %2, i64 %87
  %89 = mul nsw i32 %84, %20
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %88, i64 %90
  %92 = mul nsw i32 %30, %6
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %91, i64 %93
  %95 = getelementptr inbounds float, float addrspace(1)* %94, i64 %83
  %96 = sext i32 %20 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %3, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !5, !amdgpu.noclobber !9
  %99 = fadd contract float %82, %98
  %100 = fmul contract float %10, %10
  %101 = fdiv contract float 1.000000e+00, %100
  %102 = fmul contract float %101, %99
  store float %102, float addrspace(1)* %95, align 4, !tbaa !5
  ret void

103:                                              ; preds = %32, %148
  %104 = phi float [ 0.000000e+00, %32 ], [ %149, %148 ]
  %105 = phi i32 [ 0, %32 ], [ %150, %148 ]
  br i1 %35, label %106, label %115

106:                                              ; preds = %103
  %107 = add i32 %105, %36
  %108 = mul i32 %107, %7
  %109 = add i32 %108, %29
  %110 = mul i32 %109, %7
  %111 = add i32 %110, %24
  %112 = zext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %1, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %114, float addrspace(3)* %37, align 4, !tbaa !5
  br label %115

115:                                              ; preds = %106, %103
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %116 = mul i32 %38, %105
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %42, i64 %117
  br i1 %46, label %122, label %119

119:                                              ; preds = %115
  %120 = getelementptr inbounds float, float addrspace(1)* %118, i64 %51
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %122

122:                                              ; preds = %115, %119
  %123 = phi float [ %121, %119 ], [ 0.000000e+00, %115 ]
  store float %123, float addrspace(3)* %43, align 4, !tbaa !5
  br i1 %52, label %124, label %130

124:                                              ; preds = %122
  br i1 %74, label %128, label %125

125:                                              ; preds = %124
  %126 = getelementptr inbounds float, float addrspace(1)* %118, i64 %60
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %128

128:                                              ; preds = %124, %125
  %129 = phi float [ %127, %125 ], [ 0.000000e+00, %124 ]
  store float %129, float addrspace(3)* %54, align 4, !tbaa !5
  br label %130

130:                                              ; preds = %128, %122
  br i1 %61, label %131, label %143

131:                                              ; preds = %130
  br i1 %75, label %135, label %132

132:                                              ; preds = %131
  %133 = getelementptr inbounds float, float addrspace(1)* %118, i64 %69
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %135

135:                                              ; preds = %131, %132
  %136 = phi float [ %134, %132 ], [ 0.000000e+00, %131 ]
  store float %136, float addrspace(3)* %63, align 4, !tbaa !5
  br i1 %52, label %137, label %143

137:                                              ; preds = %135
  br i1 %76, label %141, label %138

138:                                              ; preds = %137
  %139 = getelementptr inbounds float, float addrspace(1)* %118, i64 %72
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %141

141:                                              ; preds = %137, %138
  %142 = phi float [ %140, %138 ], [ 0.000000e+00, %137 ]
  store float %142, float addrspace(3)* %70, align 4, !tbaa !5
  br label %143

143:                                              ; preds = %141, %135, %130
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %73, label %144, label %148

144:                                              ; preds = %143, %169
  %145 = phi i32 [ %172, %169 ], [ 0, %143 ]
  %146 = phi float addrspace(3)* [ %171, %169 ], [ %43, %143 ]
  %147 = phi float [ %170, %169 ], [ %104, %143 ]
  br i1 %78, label %152, label %174

148:                                              ; preds = %169, %143
  %149 = phi float [ %104, %143 ], [ %170, %169 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %150 = add nuw nsw i32 %105, 1
  %151 = icmp eq i32 %150, %5
  br i1 %151, label %81, label %103, !llvm.loop !10

152:                                              ; preds = %174, %144
  %153 = phi float [ undef, %144 ], [ %232, %174 ]
  %154 = phi i32 [ 0, %144 ], [ %233, %174 ]
  %155 = phi float [ %147, %144 ], [ %232, %174 ]
  br i1 %80, label %169, label %156

156:                                              ; preds = %152, %156
  %157 = phi i32 [ %166, %156 ], [ %154, %152 ]
  %158 = phi float [ %165, %156 ], [ %155, %152 ]
  %159 = phi i32 [ %167, %156 ], [ 0, %152 ]
  %160 = getelementptr inbounds float, float addrspace(3)* %146, i32 %157
  %161 = load float, float addrspace(3)* %160, align 4, !tbaa !5
  %162 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ26convolution_forward_kernelPfS_S_S_iiiiiifE8shFilter, i32 0, i32 %145, i32 %157
  %163 = load float, float addrspace(3)* %162, align 4, !tbaa !5
  %164 = fmul contract float %161, %163
  %165 = fadd contract float %158, %164
  %166 = add nuw nsw i32 %157, 1
  %167 = add i32 %159, 1
  %168 = icmp eq i32 %167, %77
  br i1 %168, label %169, label %156, !llvm.loop !12

169:                                              ; preds = %156, %152
  %170 = phi float [ %153, %152 ], [ %165, %156 ]
  %171 = getelementptr inbounds float, float addrspace(3)* %146, i32 39
  %172 = add nuw nsw i32 %145, 1
  %173 = icmp eq i32 %172, %7
  br i1 %173, label %148, label %144, !llvm.loop !14

174:                                              ; preds = %144, %174
  %175 = phi i32 [ %233, %174 ], [ 0, %144 ]
  %176 = phi float [ %232, %174 ], [ %147, %144 ]
  %177 = phi i32 [ %234, %174 ], [ 0, %144 ]
  %178 = getelementptr inbounds float, float addrspace(3)* %146, i32 %175
  %179 = load float, float addrspace(3)* %178, align 4, !tbaa !5
  %180 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ26convolution_forward_kernelPfS_S_S_iiiiiifE8shFilter, i32 0, i32 %145, i32 %175
  %181 = load float, float addrspace(3)* %180, align 16, !tbaa !5
  %182 = fmul contract float %179, %181
  %183 = fadd contract float %176, %182
  %184 = or i32 %175, 1
  %185 = getelementptr inbounds float, float addrspace(3)* %146, i32 %184
  %186 = load float, float addrspace(3)* %185, align 4, !tbaa !5
  %187 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ26convolution_forward_kernelPfS_S_S_iiiiiifE8shFilter, i32 0, i32 %145, i32 %184
  %188 = load float, float addrspace(3)* %187, align 4, !tbaa !5
  %189 = fmul contract float %186, %188
  %190 = fadd contract float %183, %189
  %191 = or i32 %175, 2
  %192 = getelementptr inbounds float, float addrspace(3)* %146, i32 %191
  %193 = load float, float addrspace(3)* %192, align 4, !tbaa !5
  %194 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ26convolution_forward_kernelPfS_S_S_iiiiiifE8shFilter, i32 0, i32 %145, i32 %191
  %195 = load float, float addrspace(3)* %194, align 8, !tbaa !5
  %196 = fmul contract float %193, %195
  %197 = fadd contract float %190, %196
  %198 = or i32 %175, 3
  %199 = getelementptr inbounds float, float addrspace(3)* %146, i32 %198
  %200 = load float, float addrspace(3)* %199, align 4, !tbaa !5
  %201 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ26convolution_forward_kernelPfS_S_S_iiiiiifE8shFilter, i32 0, i32 %145, i32 %198
  %202 = load float, float addrspace(3)* %201, align 4, !tbaa !5
  %203 = fmul contract float %200, %202
  %204 = fadd contract float %197, %203
  %205 = or i32 %175, 4
  %206 = getelementptr inbounds float, float addrspace(3)* %146, i32 %205
  %207 = load float, float addrspace(3)* %206, align 4, !tbaa !5
  %208 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ26convolution_forward_kernelPfS_S_S_iiiiiifE8shFilter, i32 0, i32 %145, i32 %205
  %209 = load float, float addrspace(3)* %208, align 16, !tbaa !5
  %210 = fmul contract float %207, %209
  %211 = fadd contract float %204, %210
  %212 = or i32 %175, 5
  %213 = getelementptr inbounds float, float addrspace(3)* %146, i32 %212
  %214 = load float, float addrspace(3)* %213, align 4, !tbaa !5
  %215 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ26convolution_forward_kernelPfS_S_S_iiiiiifE8shFilter, i32 0, i32 %145, i32 %212
  %216 = load float, float addrspace(3)* %215, align 4, !tbaa !5
  %217 = fmul contract float %214, %216
  %218 = fadd contract float %211, %217
  %219 = or i32 %175, 6
  %220 = getelementptr inbounds float, float addrspace(3)* %146, i32 %219
  %221 = load float, float addrspace(3)* %220, align 4, !tbaa !5
  %222 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ26convolution_forward_kernelPfS_S_S_iiiiiifE8shFilter, i32 0, i32 %145, i32 %219
  %223 = load float, float addrspace(3)* %222, align 8, !tbaa !5
  %224 = fmul contract float %221, %223
  %225 = fadd contract float %218, %224
  %226 = or i32 %175, 7
  %227 = getelementptr inbounds float, float addrspace(3)* %146, i32 %226
  %228 = load float, float addrspace(3)* %227, align 4, !tbaa !5
  %229 = getelementptr inbounds [8 x [8 x float]], [8 x [8 x float]] addrspace(3)* @_ZZ26convolution_forward_kernelPfS_S_S_iiiiiifE8shFilter, i32 0, i32 %145, i32 %226
  %230 = load float, float addrspace(3)* %229, align 4, !tbaa !5
  %231 = fmul contract float %228, %230
  %232 = fadd contract float %225, %231
  %233 = add nuw nsw i32 %175, 8
  %234 = add i32 %177, 8
  %235 = icmp eq i32 %234, %79
  br i1 %235, label %152, label %174, !llvm.loop !15
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !11}
