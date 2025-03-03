; ModuleID = '../data/hip_kernels/1594/11/main.cu'
source_filename = "../data/hip_kernels/1594/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ20backward_bias_kernelPfS_iiiE4part = internal unnamed_addr addrspace(3) global [512 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z20backward_bias_kernelPfS_iii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = icmp sgt i32 %2, 0
  br i1 %8, label %9, label %144

9:                                                ; preds = %5
  %10 = icmp sgt i32 %4, 0
  %11 = add i32 %4, -1
  %12 = lshr i32 %11, 9
  %13 = add nuw nsw i32 %12, 1
  %14 = and i32 %13, 7
  %15 = icmp ult i32 %4, 3585
  %16 = and i32 %13, -8
  %17 = icmp eq i32 %14, 0
  br label %18

18:                                               ; preds = %9, %140
  %19 = phi float [ 0.000000e+00, %9 ], [ %141, %140 ]
  %20 = phi i32 [ 0, %9 ], [ %142, %140 ]
  br i1 %10, label %21, label %140

21:                                               ; preds = %18
  %22 = mul nsw i32 %20, %3
  %23 = add nsw i32 %22, %6
  %24 = mul nsw i32 %23, %4
  br i1 %15, label %119, label %25

25:                                               ; preds = %21, %113
  %26 = phi i32 [ %116, %113 ], [ 0, %21 ]
  %27 = phi float [ %115, %113 ], [ %19, %21 ]
  %28 = phi i32 [ %117, %113 ], [ 0, %21 ]
  %29 = or i32 %26, %7
  %30 = icmp slt i32 %29, %4
  br i1 %30, label %31, label %36

31:                                               ; preds = %25
  %32 = add nsw i32 %29, %24
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %36

36:                                               ; preds = %25, %31
  %37 = phi contract float [ %35, %31 ], [ 0.000000e+00, %25 ]
  %38 = fadd contract float %27, %37
  %39 = or i32 %26, 512
  %40 = add nuw nsw i32 %39, %7
  %41 = icmp slt i32 %40, %4
  br i1 %41, label %42, label %47

42:                                               ; preds = %36
  %43 = add nsw i32 %40, %24
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %47

47:                                               ; preds = %42, %36
  %48 = phi contract float [ %46, %42 ], [ 0.000000e+00, %36 ]
  %49 = fadd contract float %38, %48
  %50 = or i32 %26, %7
  %51 = or i32 %50, 1024
  %52 = icmp slt i32 %51, %4
  br i1 %52, label %53, label %58

53:                                               ; preds = %47
  %54 = add nsw i32 %51, %24
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %58

58:                                               ; preds = %53, %47
  %59 = phi contract float [ %57, %53 ], [ 0.000000e+00, %47 ]
  %60 = fadd contract float %49, %59
  %61 = or i32 %26, 1536
  %62 = add nuw nsw i32 %61, %7
  %63 = icmp slt i32 %62, %4
  br i1 %63, label %64, label %69

64:                                               ; preds = %58
  %65 = add nsw i32 %62, %24
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %69

69:                                               ; preds = %64, %58
  %70 = phi contract float [ %68, %64 ], [ 0.000000e+00, %58 ]
  %71 = fadd contract float %60, %70
  %72 = or i32 %26, %7
  %73 = or i32 %72, 2048
  %74 = icmp slt i32 %73, %4
  br i1 %74, label %75, label %80

75:                                               ; preds = %69
  %76 = add nsw i32 %73, %24
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %80

80:                                               ; preds = %75, %69
  %81 = phi contract float [ %79, %75 ], [ 0.000000e+00, %69 ]
  %82 = fadd contract float %71, %81
  %83 = or i32 %26, 2560
  %84 = add nuw nsw i32 %83, %7
  %85 = icmp slt i32 %84, %4
  br i1 %85, label %86, label %91

86:                                               ; preds = %80
  %87 = add nsw i32 %84, %24
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %91

91:                                               ; preds = %86, %80
  %92 = phi contract float [ %90, %86 ], [ 0.000000e+00, %80 ]
  %93 = fadd contract float %82, %92
  %94 = or i32 %26, %7
  %95 = or i32 %94, 3072
  %96 = icmp slt i32 %95, %4
  br i1 %96, label %97, label %102

97:                                               ; preds = %91
  %98 = add nsw i32 %95, %24
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %1, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %102

102:                                              ; preds = %97, %91
  %103 = phi contract float [ %101, %97 ], [ 0.000000e+00, %91 ]
  %104 = fadd contract float %93, %103
  %105 = or i32 %26, 3584
  %106 = add nuw nsw i32 %105, %7
  %107 = icmp slt i32 %106, %4
  br i1 %107, label %108, label %113

108:                                              ; preds = %102
  %109 = add nsw i32 %106, %24
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %1, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %113

113:                                              ; preds = %108, %102
  %114 = phi contract float [ %112, %108 ], [ 0.000000e+00, %102 ]
  %115 = fadd contract float %104, %114
  %116 = add nuw nsw i32 %26, 4096
  %117 = add i32 %28, 8
  %118 = icmp eq i32 %117, %16
  br i1 %118, label %119, label %25, !llvm.loop !10

119:                                              ; preds = %113, %21
  %120 = phi float [ undef, %21 ], [ %115, %113 ]
  %121 = phi i32 [ 0, %21 ], [ %116, %113 ]
  %122 = phi float [ %19, %21 ], [ %115, %113 ]
  br i1 %17, label %140, label %123

123:                                              ; preds = %119, %134
  %124 = phi i32 [ %137, %134 ], [ %121, %119 ]
  %125 = phi float [ %136, %134 ], [ %122, %119 ]
  %126 = phi i32 [ %138, %134 ], [ 0, %119 ]
  %127 = add nuw nsw i32 %124, %7
  %128 = icmp slt i32 %127, %4
  br i1 %128, label %129, label %134

129:                                              ; preds = %123
  %130 = add nsw i32 %127, %24
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %1, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %134

134:                                              ; preds = %129, %123
  %135 = phi contract float [ %133, %129 ], [ 0.000000e+00, %123 ]
  %136 = fadd contract float %125, %135
  %137 = add nuw nsw i32 %124, 512
  %138 = add i32 %126, 1
  %139 = icmp eq i32 %138, %14
  br i1 %139, label %140, label %123, !llvm.loop !12

140:                                              ; preds = %119, %134, %18
  %141 = phi float [ %19, %18 ], [ %120, %119 ], [ %136, %134 ]
  %142 = add nuw nsw i32 %20, 1
  %143 = icmp eq i32 %142, %2
  br i1 %143, label %144, label %18, !llvm.loop !14

144:                                              ; preds = %140, %5
  %145 = phi float [ 0.000000e+00, %5 ], [ %141, %140 ]
  %146 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20backward_bias_kernelPfS_iiiE4part, i32 0, i32 %7
  store float %145, float addrspace(3)* %146, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %147 = icmp eq i32 %7, 0
  br i1 %147, label %148, label %221

148:                                              ; preds = %144
  %149 = sext i32 %6 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %0, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !5
  br label %152

152:                                              ; preds = %152, %148
  %153 = phi i32 [ 0, %148 ], [ %218, %152 ]
  %154 = phi float [ %151, %148 ], [ %217, %152 ]
  %155 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20backward_bias_kernelPfS_iiiE4part, i32 0, i32 %153
  %156 = load float, float addrspace(3)* %155, align 16, !tbaa !5
  %157 = fadd contract float %156, %154
  %158 = or i32 %153, 1
  %159 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20backward_bias_kernelPfS_iiiE4part, i32 0, i32 %158
  %160 = load float, float addrspace(3)* %159, align 4, !tbaa !5
  %161 = fadd contract float %160, %157
  %162 = or i32 %153, 2
  %163 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20backward_bias_kernelPfS_iiiE4part, i32 0, i32 %162
  %164 = load float, float addrspace(3)* %163, align 8, !tbaa !5
  %165 = fadd contract float %164, %161
  %166 = or i32 %153, 3
  %167 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20backward_bias_kernelPfS_iiiE4part, i32 0, i32 %166
  %168 = load float, float addrspace(3)* %167, align 4, !tbaa !5
  %169 = fadd contract float %168, %165
  %170 = or i32 %153, 4
  %171 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20backward_bias_kernelPfS_iiiE4part, i32 0, i32 %170
  %172 = load float, float addrspace(3)* %171, align 16, !tbaa !5
  %173 = fadd contract float %172, %169
  %174 = or i32 %153, 5
  %175 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20backward_bias_kernelPfS_iiiE4part, i32 0, i32 %174
  %176 = load float, float addrspace(3)* %175, align 4, !tbaa !5
  %177 = fadd contract float %176, %173
  %178 = or i32 %153, 6
  %179 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20backward_bias_kernelPfS_iiiE4part, i32 0, i32 %178
  %180 = load float, float addrspace(3)* %179, align 8, !tbaa !5
  %181 = fadd contract float %180, %177
  %182 = or i32 %153, 7
  %183 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20backward_bias_kernelPfS_iiiE4part, i32 0, i32 %182
  %184 = load float, float addrspace(3)* %183, align 4, !tbaa !5
  %185 = fadd contract float %184, %181
  %186 = or i32 %153, 8
  %187 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20backward_bias_kernelPfS_iiiE4part, i32 0, i32 %186
  %188 = load float, float addrspace(3)* %187, align 16, !tbaa !5
  %189 = fadd contract float %188, %185
  %190 = or i32 %153, 9
  %191 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20backward_bias_kernelPfS_iiiE4part, i32 0, i32 %190
  %192 = load float, float addrspace(3)* %191, align 4, !tbaa !5
  %193 = fadd contract float %192, %189
  %194 = or i32 %153, 10
  %195 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20backward_bias_kernelPfS_iiiE4part, i32 0, i32 %194
  %196 = load float, float addrspace(3)* %195, align 8, !tbaa !5
  %197 = fadd contract float %196, %193
  %198 = or i32 %153, 11
  %199 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20backward_bias_kernelPfS_iiiE4part, i32 0, i32 %198
  %200 = load float, float addrspace(3)* %199, align 4, !tbaa !5
  %201 = fadd contract float %200, %197
  %202 = or i32 %153, 12
  %203 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20backward_bias_kernelPfS_iiiE4part, i32 0, i32 %202
  %204 = load float, float addrspace(3)* %203, align 16, !tbaa !5
  %205 = fadd contract float %204, %201
  %206 = or i32 %153, 13
  %207 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20backward_bias_kernelPfS_iiiE4part, i32 0, i32 %206
  %208 = load float, float addrspace(3)* %207, align 4, !tbaa !5
  %209 = fadd contract float %208, %205
  %210 = or i32 %153, 14
  %211 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20backward_bias_kernelPfS_iiiE4part, i32 0, i32 %210
  %212 = load float, float addrspace(3)* %211, align 8, !tbaa !5
  %213 = fadd contract float %212, %209
  %214 = or i32 %153, 15
  %215 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20backward_bias_kernelPfS_iiiE4part, i32 0, i32 %214
  %216 = load float, float addrspace(3)* %215, align 4, !tbaa !5
  %217 = fadd contract float %216, %213
  %218 = add nuw nsw i32 %153, 16
  %219 = icmp eq i32 %218, 512
  br i1 %219, label %220, label %152, !llvm.loop !15

220:                                              ; preds = %152
  store float %217, float addrspace(1)* %150, align 4, !tbaa !5
  br label %221

221:                                              ; preds = %220, %144
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
