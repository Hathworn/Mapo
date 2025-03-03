; ModuleID = '../data/hip_kernels/12010/32/main.cu'
source_filename = "../data/hip_kernels/12010/32/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16fast_mean_kernelPfiiiS_E5local = internal unnamed_addr addrspace(3) global [512 x float] undef, align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16fast_mean_kernelPfiiiS_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ16fast_mean_kernelPfiiiS_E5local, i32 0, i32 %6
  store float 0.000000e+00, float addrspace(3)* %7, align 4, !tbaa !5
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %10, label %147

10:                                               ; preds = %5
  %11 = icmp sgt i32 %3, 0
  %12 = add i32 %3, -1
  %13 = lshr i32 %12, 9
  %14 = add nuw nsw i32 %13, 1
  %15 = and i32 %14, 7
  %16 = icmp ult i32 %3, 3585
  %17 = and i32 %14, -8
  %18 = icmp eq i32 %15, 0
  br label %19

19:                                               ; preds = %10, %143
  %20 = phi float [ 0.000000e+00, %10 ], [ %144, %143 ]
  %21 = phi i32 [ 0, %10 ], [ %145, %143 ]
  br i1 %11, label %22, label %143

22:                                               ; preds = %19
  %23 = mul i32 %21, %2
  %24 = add i32 %23, %8
  %25 = mul i32 %24, %3
  br i1 %16, label %120, label %26

26:                                               ; preds = %22, %114
  %27 = phi float [ %116, %114 ], [ %20, %22 ]
  %28 = phi i32 [ %117, %114 ], [ 0, %22 ]
  %29 = phi i32 [ %118, %114 ], [ 0, %22 ]
  %30 = or i32 %28, %6
  %31 = icmp slt i32 %30, %3
  br i1 %31, label %32, label %37

32:                                               ; preds = %26
  %33 = add i32 %30, %25
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %37

37:                                               ; preds = %26, %32
  %38 = phi contract float [ %36, %32 ], [ 0.000000e+00, %26 ]
  %39 = fadd contract float %38, %27
  %40 = or i32 %28, 512
  %41 = add nuw nsw i32 %40, %6
  %42 = icmp slt i32 %41, %3
  br i1 %42, label %43, label %48

43:                                               ; preds = %37
  %44 = add i32 %41, %25
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %48

48:                                               ; preds = %43, %37
  %49 = phi contract float [ %47, %43 ], [ 0.000000e+00, %37 ]
  %50 = fadd contract float %49, %39
  %51 = or i32 %28, %6
  %52 = or i32 %51, 1024
  %53 = icmp slt i32 %52, %3
  br i1 %53, label %54, label %59

54:                                               ; preds = %48
  %55 = add i32 %52, %25
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %59

59:                                               ; preds = %54, %48
  %60 = phi contract float [ %58, %54 ], [ 0.000000e+00, %48 ]
  %61 = fadd contract float %60, %50
  %62 = or i32 %28, 1536
  %63 = add nuw nsw i32 %62, %6
  %64 = icmp slt i32 %63, %3
  br i1 %64, label %65, label %70

65:                                               ; preds = %59
  %66 = add i32 %63, %25
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %70

70:                                               ; preds = %65, %59
  %71 = phi contract float [ %69, %65 ], [ 0.000000e+00, %59 ]
  %72 = fadd contract float %71, %61
  %73 = or i32 %28, %6
  %74 = or i32 %73, 2048
  %75 = icmp slt i32 %74, %3
  br i1 %75, label %76, label %81

76:                                               ; preds = %70
  %77 = add i32 %74, %25
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %81

81:                                               ; preds = %76, %70
  %82 = phi contract float [ %80, %76 ], [ 0.000000e+00, %70 ]
  %83 = fadd contract float %82, %72
  %84 = or i32 %28, 2560
  %85 = add nuw nsw i32 %84, %6
  %86 = icmp slt i32 %85, %3
  br i1 %86, label %87, label %92

87:                                               ; preds = %81
  %88 = add i32 %85, %25
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %92

92:                                               ; preds = %87, %81
  %93 = phi contract float [ %91, %87 ], [ 0.000000e+00, %81 ]
  %94 = fadd contract float %93, %83
  %95 = or i32 %28, %6
  %96 = or i32 %95, 3072
  %97 = icmp slt i32 %96, %3
  br i1 %97, label %98, label %103

98:                                               ; preds = %92
  %99 = add i32 %96, %25
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %103

103:                                              ; preds = %98, %92
  %104 = phi contract float [ %102, %98 ], [ 0.000000e+00, %92 ]
  %105 = fadd contract float %104, %94
  %106 = or i32 %28, 3584
  %107 = add nuw nsw i32 %106, %6
  %108 = icmp slt i32 %107, %3
  br i1 %108, label %109, label %114

109:                                              ; preds = %103
  %110 = add i32 %107, %25
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %0, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %114

114:                                              ; preds = %109, %103
  %115 = phi contract float [ %113, %109 ], [ 0.000000e+00, %103 ]
  %116 = fadd contract float %115, %105
  %117 = add nuw nsw i32 %28, 4096
  %118 = add i32 %29, 8
  %119 = icmp eq i32 %118, %17
  br i1 %119, label %120, label %26, !llvm.loop !10

120:                                              ; preds = %114, %22
  %121 = phi float [ undef, %22 ], [ %116, %114 ]
  %122 = phi float [ %20, %22 ], [ %116, %114 ]
  %123 = phi i32 [ 0, %22 ], [ %117, %114 ]
  br i1 %18, label %141, label %124

124:                                              ; preds = %120, %135
  %125 = phi float [ %137, %135 ], [ %122, %120 ]
  %126 = phi i32 [ %138, %135 ], [ %123, %120 ]
  %127 = phi i32 [ %139, %135 ], [ 0, %120 ]
  %128 = add nuw nsw i32 %126, %6
  %129 = icmp slt i32 %128, %3
  br i1 %129, label %130, label %135

130:                                              ; preds = %124
  %131 = add i32 %128, %25
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %0, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %135

135:                                              ; preds = %130, %124
  %136 = phi contract float [ %134, %130 ], [ 0.000000e+00, %124 ]
  %137 = fadd contract float %136, %125
  %138 = add nuw nsw i32 %126, 512
  %139 = add i32 %127, 1
  %140 = icmp eq i32 %139, %15
  br i1 %140, label %141, label %124, !llvm.loop !12

141:                                              ; preds = %135, %120
  %142 = phi float [ %121, %120 ], [ %137, %135 ]
  store float %142, float addrspace(3)* %7, align 4, !tbaa !5
  br label %143

143:                                              ; preds = %141, %19
  %144 = phi float [ %142, %141 ], [ %20, %19 ]
  %145 = add nuw nsw i32 %21, 1
  %146 = icmp eq i32 %145, %1
  br i1 %146, label %147, label %19, !llvm.loop !14

147:                                              ; preds = %143, %5
  %148 = icmp eq i32 %6, 0
  br i1 %148, label %149, label %224

149:                                              ; preds = %147
  %150 = sext i32 %8 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %4, i64 %150
  store float 0.000000e+00, float addrspace(1)* %151, align 4, !tbaa !5
  br label %152

152:                                              ; preds = %152, %149
  %153 = phi i32 [ 0, %149 ], [ %218, %152 ]
  %154 = phi float [ 0.000000e+00, %149 ], [ %217, %152 ]
  %155 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ16fast_mean_kernelPfiiiS_E5local, i32 0, i32 %153
  %156 = load float, float addrspace(3)* %155, align 16, !tbaa !5
  %157 = fadd contract float %156, %154
  %158 = or i32 %153, 1
  %159 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ16fast_mean_kernelPfiiiS_E5local, i32 0, i32 %158
  %160 = load float, float addrspace(3)* %159, align 4, !tbaa !5
  %161 = fadd contract float %160, %157
  %162 = or i32 %153, 2
  %163 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ16fast_mean_kernelPfiiiS_E5local, i32 0, i32 %162
  %164 = load float, float addrspace(3)* %163, align 8, !tbaa !5
  %165 = fadd contract float %164, %161
  %166 = or i32 %153, 3
  %167 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ16fast_mean_kernelPfiiiS_E5local, i32 0, i32 %166
  %168 = load float, float addrspace(3)* %167, align 4, !tbaa !5
  %169 = fadd contract float %168, %165
  %170 = or i32 %153, 4
  %171 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ16fast_mean_kernelPfiiiS_E5local, i32 0, i32 %170
  %172 = load float, float addrspace(3)* %171, align 16, !tbaa !5
  %173 = fadd contract float %172, %169
  %174 = or i32 %153, 5
  %175 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ16fast_mean_kernelPfiiiS_E5local, i32 0, i32 %174
  %176 = load float, float addrspace(3)* %175, align 4, !tbaa !5
  %177 = fadd contract float %176, %173
  %178 = or i32 %153, 6
  %179 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ16fast_mean_kernelPfiiiS_E5local, i32 0, i32 %178
  %180 = load float, float addrspace(3)* %179, align 8, !tbaa !5
  %181 = fadd contract float %180, %177
  %182 = or i32 %153, 7
  %183 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ16fast_mean_kernelPfiiiS_E5local, i32 0, i32 %182
  %184 = load float, float addrspace(3)* %183, align 4, !tbaa !5
  %185 = fadd contract float %184, %181
  %186 = or i32 %153, 8
  %187 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ16fast_mean_kernelPfiiiS_E5local, i32 0, i32 %186
  %188 = load float, float addrspace(3)* %187, align 16, !tbaa !5
  %189 = fadd contract float %188, %185
  %190 = or i32 %153, 9
  %191 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ16fast_mean_kernelPfiiiS_E5local, i32 0, i32 %190
  %192 = load float, float addrspace(3)* %191, align 4, !tbaa !5
  %193 = fadd contract float %192, %189
  %194 = or i32 %153, 10
  %195 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ16fast_mean_kernelPfiiiS_E5local, i32 0, i32 %194
  %196 = load float, float addrspace(3)* %195, align 8, !tbaa !5
  %197 = fadd contract float %196, %193
  %198 = or i32 %153, 11
  %199 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ16fast_mean_kernelPfiiiS_E5local, i32 0, i32 %198
  %200 = load float, float addrspace(3)* %199, align 4, !tbaa !5
  %201 = fadd contract float %200, %197
  %202 = or i32 %153, 12
  %203 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ16fast_mean_kernelPfiiiS_E5local, i32 0, i32 %202
  %204 = load float, float addrspace(3)* %203, align 16, !tbaa !5
  %205 = fadd contract float %204, %201
  %206 = or i32 %153, 13
  %207 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ16fast_mean_kernelPfiiiS_E5local, i32 0, i32 %206
  %208 = load float, float addrspace(3)* %207, align 4, !tbaa !5
  %209 = fadd contract float %208, %205
  %210 = or i32 %153, 14
  %211 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ16fast_mean_kernelPfiiiS_E5local, i32 0, i32 %210
  %212 = load float, float addrspace(3)* %211, align 8, !tbaa !5
  %213 = fadd contract float %212, %209
  %214 = or i32 %153, 15
  %215 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ16fast_mean_kernelPfiiiS_E5local, i32 0, i32 %214
  %216 = load float, float addrspace(3)* %215, align 4, !tbaa !5
  %217 = fadd contract float %216, %213
  %218 = add nuw nsw i32 %153, 16
  %219 = icmp eq i32 %218, 512
  br i1 %219, label %220, label %152, !llvm.loop !15

220:                                              ; preds = %152
  %221 = mul nsw i32 %3, %1
  %222 = sitofp i32 %221 to float
  %223 = fdiv contract float %217, %222
  store float %223, float addrspace(1)* %151, align 4, !tbaa !5
  br label %224

224:                                              ; preds = %220, %147
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
